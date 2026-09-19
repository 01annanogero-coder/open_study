// Live check of every open-content source Open Study uses.
// Run: node tool/verify_sources.js "software engineering"
// It identifies itself honestly, sends one request per source, and prints what came back.
// No keys are needed. (YouTube needs an API key and is checked only if YOUTUBE_API_KEY is set.)
const q = process.argv[2] || "software engineering"
const UA = "OpenStudyApp/1.0 (educational open-content search; verification script)"
const enc = encodeURIComponent

async function get(url, asText = false) {
  const res = await fetch(url, { headers: { "User-Agent": UA, Accept: asText ? "application/xml,text/xml" : "application/json" }, signal: AbortSignal.timeout(15000) })
  if (!res.ok) throw new Error("HTTP " + res.status)
  return asText ? res.text() : res.json()
}

const checks = {
  async "Internet Archive"() {
    const lic = "(licenseurl:*creativecommons.org* OR licenseurl:*publicdomain*)"
    const u = `https://archive.org/advancedsearch.php?q=${enc(`(${q}) AND ${lic}`)}&fl[]=identifier&fl[]=title&fl[]=mediatype&fl[]=licenseurl&fl[]=creator&rows=5&output=json`
    const d = (await get(u)).response
    return { count: d.numFound, sample: d.docs.slice(0, 2).map((x) => `${x.title} | ${x.mediatype} | ${x.licenseurl}`) }
  },
  async Wikipedia() {
    const d = await get(`https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=${enc(q)}&format=json&srlimit=5&origin=*`)
    return { count: d.query.search.length, sample: d.query.search.slice(0, 2).map((x) => x.title) }
  },
  async arXiv() {
    const t = await get(`https://export.arxiv.org/api/query?search_query=all:${enc(q)}&start=0&max_results=5`, true)
    const titles = [...t.matchAll(/<entry>[\s\S]*?<title>([\s\S]*?)<\/title>/g)].map((m) => m[1].replace(/\s+/g, " ").trim())
    return { count: titles.length, sample: titles.slice(0, 2) }
  },
  async OpenAlex() {
    const f = "open_access.is_oa:true,best_oa_location.license:cc-by|cc-by-sa|cc0|public-domain|cc-by-nc|cc-by-nc-sa"
    const d = await get(`https://api.openalex.org/works?search=${enc(q)}&filter=${f}&per_page=5&select=id,title,best_oa_location,open_access`)
    return { count: d.results.length, sample: d.results.slice(0, 2).map((w) => `${w.title} | license=${w.best_oa_location?.license} | ${w.best_oa_location?.landing_page_url}`) }
  },
  async DOAJ() {
    const d = await get(`https://doaj.org/api/search/articles/${enc(q)}?pageSize=5`)
    return { count: (d.results || []).length, sample: (d.results || []).slice(0, 2).map((r) => `${r.bibjson?.title} | licenses=${JSON.stringify((r.bibjson?.journal?.license || []).map((l) => l.type))}`) }
  },
  async "OpenStax (CMS API)"() {
    const u = "https://openstax.org/apps/cms/api/v2/pages/?type=books.Book&fields=title,slug,cover_url,book_state,license_name,license_url&format=json&limit=100"
    const d = await get(u)
    const items = d.items || []
    return { count: items.length, keys: Object.keys(items[0] || {}), sample: items.slice(0, 2).map((b) => `${b.title} | ${b.slug} | ${b.license_name} | ${b.book_state}`) }
  },
}

if (process.env.YOUTUBE_API_KEY) {
  checks["YouTube CC (official API)"] = async () => {
    const u = `https://www.googleapis.com/youtube/v3/search?key=${process.env.YOUTUBE_API_KEY}&q=${enc(q)}&part=snippet&type=video&videoLicense=creativeCommon&videoEmbeddable=true&maxResults=5&safeSearch=strict`
    const d = await get(u)
    return { count: (d.items || []).length, sample: (d.items || []).slice(0, 2).map((i) => i.snippet.title) }
  }
}

;(async () => {
  let failed = 0
  for (const [name, fn] of Object.entries(checks)) {
    try {
      const r = await fn()
      console.log(`OK    ${name}: ${r.count} results${r.keys ? " keys=" + r.keys.join(",") : ""}`)
      for (const s of r.sample) console.log("        - " + s)
    } catch (e) {
      failed++
      console.log(`FAIL  ${name}: ${e.message}`)
    }
  }
  console.log(failed ? `${failed} source(s) failed` : "all sources responded")
  process.exit(failed ? 1 : 0)
})()
