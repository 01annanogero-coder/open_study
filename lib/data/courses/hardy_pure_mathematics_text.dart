// Lesson texts for A Course of Pure Mathematics by G. H. Hardy (public
// domain), keyed by lesson id. Each text is the opening of the section it
// belongs to, taken from the book's LaTeX source so formulas stay exact;
// examples, footnotes and figures are left out.
//
// Format: paragraphs separated by a blank line; a paragraph that is
// $$...$$ is a displayed formula; $...$ is an inline formula;
// *italic* and **bold** outside formulas.
//
// Generated from the book's source; edit with care.

const Map<String, String> hardyPureMathematicsTexts = {
  'ch1-t1': r'''
A fraction $r = p/q$, where $p$ and $q$ are positive or negative integers, is called a *rational number*. We can suppose (i) that $p$ and $q$ have no common factor, as if they have a common factor we can divide each of them by it, and (ii) that $q$ is positive, since

$$p/(-q) = (-p)/q,\quad (-p)/(-q) = p/q.$$

To the rational numbers thus defined we may add the ‘rational number $0$’ obtained by taking $p = 0$.

We assume that the reader is familiar with the ordinary arithmetical rules for the manipulation of rational numbers. The examples which follow demand no knowledge beyond this.

**2. The representation of rational numbers by points on a line.**

It is convenient, in many branches of mathematical analysis, to make a good deal of use of geometrical illustrations.

The use of geometrical illustrations in this way does not, of course, imply that analysis has any sort of dependence upon geometry: they are illustrations and nothing more, and are employed merely for the sake of clearness of exposition. This being so, it is not necessary that we should attempt any logical analysis of the ordinary notions of elementary geometry; we may be content to suppose, however far it may be from the truth, that we know what they mean.

Assuming, then, that we know what is meant by a *straight line*, a *segment* of a line, and the *length* of a segment, let us take a straight line $\Lambda$, produced indefinitely in both directions, and a segment $A_{0}A_{1}$ of any length. We call $A_{0}$ the *origin*, or *the point $0$*, and $A_{1}$ *the point $1$*, and we regard these points as representing the numbers $0$ and $1$.

In order to obtain a point which shall represent a positive rational number $r = p/q$, we choose the point $A_{r}$ such that

$$A_{0}A_{r}/A_{0}A_{1} = r,$$

$A_{0}A_{r}$ being a stretch of the line extending in the same direction along the line as $A_{0}A_{1}$, a direction which we shall suppose to be from left to right when, as in Fig. 1, the line is drawn horizontally across the paper. In order to obtain a point to represent a negative rational number $r = -s$, it is natural to regard length as a magnitude capable of sign, positive if the length is measured in one direction (that of $A_{0}A_{1}$), and negative if measured in the other, so that $AB = -BA$; and to take as the point representing $r$ the point $A_{-s}$ such that

$$A_{0}A_{-s} = -A_{-s}A_{0} = -A_{0}A_{s}.$$

We thus obtain a point $A_{r}$ on the line corresponding to every rational value of $r$, positive or negative, and such that

$$A_{0}A_{r} = r \cdot A_{0}A_{1};$$

and if, as is natural, we take $A_{0}A_{1}$ as our unit of length, and write $A_{0}A_{1} = 1$, then we have

$$A_{0}A_{r} = r.$$

We shall call the points $A_{r}$ the *rational points* of the line.
''',
  'ch1-t2': r'''
If the reader will mark off on the line all the points corresponding to the rational numbers whose denominators are $1$, $2$, $3, \dots$ in succession, he will readily convince himself that he can cover the line with rational points as closely as he likes. We can state this more precisely as follows: *if we take any segment $BC$ on $\Lambda$, we can find as many rational points as we please on $BC$*.

Suppose, for example, that $BC$ falls within the segment $A_{1}A_{2}$. It is evident that if we choose a positive integer $k$ so that

$$k \cdot BC > 1, \qquad\text{(1)}$$

and divide $A_{1}A_{2}$ into $k$ equal parts, then at least one of the points of division (say $P$) must fall inside $BC$, without coinciding with either $B$ or $C$. For if this were not so, $BC$ would be entirely included in one of the $k$ parts into which $A_{1}A_{2}$ has been divided, which contradicts the supposition (1). But $P$ obviously corresponds to a rational number whose denominator is $k$. Thus at least one rational point $P$ lies between $B$ and $C$. But then we can find another such point $Q$ between $B$ and $P$, another between $B$ and $Q$, and so on indefinitely; *i.e.*, as we asserted above, we can find as many as we please. We may express this by saying that $BC$ includes *infinitely many* rational points.

The meaning of such phrases as ‘*infinitely many*’ or ‘*an infinity of*’, in such sentences as ‘$BC$ includes infinitely many rational points’ or ‘there are an infinity of rational points on $BC$’ or ‘there are an infinity of positive integers’, will be considered more closely in Ch. IV\@. The assertion ‘there are an infinity of positive integers’ means ‘given any positive integer $n$, however large, we can find more than $n$ positive integers’. This is plainly true whatever $n$ may be, *e.g.* for $n = 100,000$ or $100,000,000$. The assertion means exactly the same as ‘we can find *as many positive integers as we please*’.
''',
  'ch1-t3': r'''
We have confined ourselves so far to certain sections of the positive rational numbers, which we have agreed provisionally to call ‘positive real numbers.’ Before we frame our final definitions, we must alter our point of view a little. We shall consider sections, or divisions into two classes, not merely of the positive rational numbers, but of all rational numbers, including zero. We may then repeat all that we have said about sections of the positive rational numbers in §§ 6, 7, merely omitting the word positive occasionally.

**Definitions.** A section of the rational numbers, in which both classes exist and the lower class has no greatest member, is called a **real number**, or simply a **number**.

A real number which does not correspond to a rational number is called an **irrational** number.

If the real number does correspond to a rational number, we shall use the term ‘rational’ as applying to the real number also.

The term ‘rational number’ will, as a result of our definitions, be ambiguous; it may mean the rational number of § 1, or the corresponding real number. If we say that $\frac{1}{2} > \frac{1}{3}$, we may be asserting either of two different propositions, one a proposition of elementary arithmetic, the other a proposition concerning sections of the rational numbers. Ambiguities of this kind are common in mathematics, and are perfectly harmless, since the relations between different propositions are exactly the same whichever interpretation is attached to the propositions themselves. From $\frac{1}{2} > \frac{1}{3}$ and $\frac{1}{3} > \frac{1}{4}$ we can infer $\frac{1}{2} > \frac{1}{4}$; the inference is in no way affected by any doubt as to whether $\frac{1}{2}$, $\frac{1}{3}$, and $\frac{1}{4}$ are arithmetical fractions or real numbers. Sometimes, of course, the context in which (*e.g.*) ‘$\frac{1}{2}$’ occurs is sufficient to fix its interpretation. When we say (see § 9) that $\frac{1}{2} < \sqrt{\frac{1}{3}}$, we *must* mean by ‘$\frac{1}{2}$’ the real number $\frac{1}{2}$.

The reader should observe, moreover, that no particular logical importance is to be attached to the precise form of definition of a ‘real number’ that we have adopted. We defined a ‘real number’ as being a section, *i.e.* a pair of classes. We might equally well have defined it as being the lower, or the upper, class; indeed it would be easy to define an infinity of classes of entities each of which would possess the properties of the class of real numbers. What is essential in mathematics is that its symbols should be capable of *some* interpretation; generally they are capable of *many*, and then, so far as mathematics is concerned, it does not matter which we adopt. Mr Bertrand Russell has said that ‘mathematics is the science in which we do not know what we are talking about, and do not care whether what we say about it is true’, a remark which is expressed in the form of a paradox but which in reality embodies a number of important truths. It would take too long to analyse the meaning of Mr Russell’s epigram in detail, but one at any rate of its implications is this, that the symbols of mathematics are capable of varying interpretations, and that we are in general at liberty to adopt whichever we prefer.
''',
  'ch1-t4': r'''
It is plain that, now that we have extended our conception of number, we are bound to make corresponding extensions of our conceptions of equality, inequality, addition, multiplication, and so on. We have to show that these ideas can be applied to the new numbers, and that, when this extension of them is made, all the ordinary laws of algebra retain their validity, so that we can operate with real numbers in general in exactly the same way as with the rational numbers of § 1. To do all this systematically would occupy a considerable space, and we shall be content to indicate summarily how a more systematic discussion would proceed.

We denote a real number by a Greek letter such as $\alpha$, $\beta$, $\gamma, \dots$; the rational numbers of its lower and upper classes by the corresponding English letters $a$, $A$; $b$, $B$; $c$, $C$; …. The classes themselves we denote by $(a)$, $(A), \dots$.

If $\alpha$ and $\beta$ are two real numbers, there are three possibilities:

(i) every $a$ is a $b$ and every $A$ a $B$; in this case $(a)$ is identical with $(b)$ and $(A)$ with $(B)$;

(ii) every $a$ is a $b$, but not all $A$’s are $B$’s; in this case $(a)$ is a proper part of $(b)$, and $(B)$ a proper part of $(A)$;

(iii) every $A$ is a $B$, but not all $a$’s are $b$’s.

These three cases may be indicated graphically as in Fig. 4.

In case (i) we write $\alpha = \beta$, in case (ii) $\alpha < \beta$, and in case (iii) $\alpha > \beta$. It is clear that, when $\alpha$ and $\beta$ are both rational, these definitions agree with the ideas of equality and inequality between rational numbers which we began by taking for granted; and that any positive number is greater than any negative number.

It will be convenient to define at this stage the negative $-\alpha$ of a positive number $\alpha$. If $(a)$, $(A)$ are the classes which constitute $\alpha$, we can define another section of the rational numbers by putting all numbers $-A$ in the lower class and all numbers $-a$ in the upper. The real number thus defined, which is clearly negative, we denote by $-\alpha$. Similarly we can define $-\alpha$ when $\alpha$ is negative or zero; if $\alpha$ is negative, $-\alpha$ is positive. It is plain also that $-(-\alpha) = \alpha$. Of the two numbers $\alpha$ and $-\alpha$ one is always positive (unless $\alpha = 0$). The one which is positive we denote by $|\alpha|$ and call the *modulus* of $\alpha$.
''',
  'ch1-t5': r'''
We now proceed to define the meaning of the elementary algebraical operations such as addition, as applied to real numbers in general.

*(i) Addition.* In order to define the sum of two numbers $\alpha$ and $\beta$, we consider the following two classes: (i) the class $(c)$ formed by all sums $c = a + b$, (ii) the class $(C)$ formed by all sums $C = A + B$. Plainly $c < C$ in all cases.

Again, there cannot be more than one rational number which does not belong either to $(c)$ or to $(C)$. For suppose there were two, say $r$ and $s$, and let $s$ be the greater. Then both $r$ and $s$ must be greater than every $c$ and less than every $C$; and so $C - c$ cannot be less than $s - r$. But

$$C - c = (A - a) + (B - b);$$

and we can choose $a$, $b$, $A$, $B$ so that both $A - a$ and $B - b$ are as small as we like; and this plainly contradicts our hypothesis.

If every rational number belongs to $(c)$ or to $(C)$, the classes $(c)$, $(C)$ form a section of the rational numbers, that is to say, a number $\gamma$. If there is one which does not, we add it to $(C)$. We have now a section or real number $\gamma$, which must clearly be rational, since it corresponds to the least member of $(C)$. *In any case we call $\gamma$ the sum of $\alpha$ and $\beta$, and write*

$$\gamma = \alpha + \beta.$$

If both $\alpha$ and $\beta$ are rational, they are the least members of the upper classes $(A)$ and $(B)$. In this case it is clear that $\alpha + \beta$ is the least member of $(C)$, so that our definition agrees with our previous ideas of addition.

*(ii) Subtraction.* We define $\alpha - \beta$ by the equation

$$\alpha - \beta = \alpha + (-\beta).$$

The idea of subtraction accordingly presents no fresh difficulties.
''',
  'ch1-t6': r'''
Let us now return for a moment to the particular irrational number which we discussed in §§ 4–5. We there constructed a section by means of the inequalities $x^{2} < 2$, $x^{2} > 2$. This was a section of the positive rational numbers only; but we replace it (as was explained in § 8) by a section of all the rational numbers. We denote the section or number thus defined by the symbol $\sqrt{2}$.

The classes by means of which the product of $\sqrt{2}$ by itself is defined are (i) $(aa')$, where $a$ and $a'$ are positive rational numbers whose squares are less than $2$, (ii) $(AA')$, where $A$ and $A'$ are positive rational numbers whose squares are greater than $2$. These classes exhaust all positive rational numbers save one, which can only be $2$ itself. Thus

$$(\sqrt{2})^{2} = \sqrt{2}\sqrt{2} = 2.$$

Again

$$(-\sqrt{2})^{2} = (-\sqrt{2})(-\sqrt{2}) = \sqrt{2}\sqrt{2} = (\sqrt{2})^{2} = 2.$$

Thus *the equation $x^{2} = 2$ has the two roots $\sqrt{2}$ and $-\sqrt{2}$*. Similarly we could discuss the equations $x^{2} = 3$, $x^{3} = 7, \dots$ and the corresponding irrational numbers $\sqrt{3}$, $-\sqrt{3}$, $\sqrt[3]{7}, \dots$.
''',
  'ch1-t7': r'''
A number of the form $\pm \sqrt{a}$, where $a$ is a positive rational number which is not the square of another rational number, is called a *pure quadratic surd*. A number of the form $a \pm \sqrt{b}$, where $a$ is rational, and $\sqrt{b}$ is a pure quadratic surd, is sometimes called a mixed quadratic surd.

The two numbers $a \pm \sqrt{b}$ are the roots of the quadratic equation

$$x^{2} - 2ax + a^{2} - b = 0.$$

Conversely, the equation $x^{2} + 2px + q = 0$, where $p$ and $q$ are rational, and $p^{2} - q > 0$, has as its roots the two quadratic surds $-p \pm \sqrt{p^{2} - q}$.

The only kind of irrational numbers whose existence was suggested by the geometrical considerations of § 3 are these quadratic surds, pure and mixed, and the more complicated irrationals which may be expressed in a form involving the repeated extraction of square roots, such as

$$\sqrt{2} + \sqrt{2 + \sqrt{2}} + \sqrt{2 + \sqrt{2 + \sqrt{2}}}.$$

It is easy to construct geometrically a line whose length is equal to any number of this form, as the reader will easily see for himself. That irrational numbers of these kinds *only* can be constructed by Euclidean methods (*i.e.* by geometrical constructions with ruler and compasses) is a point the proof of which must be deferred for the present. This property of quadratic surds makes them especially interesting.

**14. Some theorems concerning quadratic surds.**

Two pure quadratic surds are said to be *similar* if they can be expressed as rational multiples of the same surd, and otherwise to be *dissimilar*. Thus

$$\sqrt{8} = 2\sqrt{2},\quad \sqrt{\tfrac{25}{2}} = \tfrac{5}{2}\sqrt{2},$$

and so $\sqrt{8}$, $\sqrt{\frac{25}{2}}$ are similar surds. On the other hand, if $M$ and $N$ are integers which have no common factor, and neither of which is a perfect square, $\sqrt{M}$ and $\sqrt{N}$ are dissimilar surds. For suppose, if possible,

$$\sqrt{M} = \frac{p}{q}\sqrt{\frac{t}{u}},\quad \sqrt{N} = \frac{r}{s}\sqrt{\frac{t}{u}},$$

where all the letters denote integers.
''',
  'ch1-t8': r'''
The aggregate of all real numbers, rational and irrational, is called the **arithmetical continuum**.

It is convenient to suppose that the straight line $\Lambda$ of § 2 is composed of points corresponding to all the numbers of the arithmetical continuum, and of no others. The points of the line, the aggregate of which may be said to constitute the **linear continuum**, then supply us with a convenient image of the arithmetical continuum.

We have considered in some detail the chief properties of a few classes of real numbers, such, for example, as rational numbers or quadratic surds. We add a few further examples to show how very special these particular classes of numbers are, and how, to put it roughly, they comprise only a minute fraction of the infinite variety of numbers which constitute the continuum.

(i) Let us consider a more complicated surd expression such as

$$z = \sqrt[3]{4 + \sqrt{15}} + \sqrt[3]{4 - \sqrt{15}}.$$

Our argument for supposing that the expression for $z$ has a meaning might be as follows. We first show, as in § 12, that there is a number $y = \sqrt{15}$ such that $y^{2} = 15$, and we can then, as in § 10, define the numbers $4 + \sqrt{15}$, $4 - \sqrt{15}$. Now consider the equation in $z_{1}$,

$$z_{1}^{3} = 4 + \sqrt{15}.$$

The right-hand side of this equation is not rational: but exactly the same reasoning which leads us to suppose that there is a real number $x$ such that $x^{3} = 2$ (or any other rational number) also leads us to the conclusion that there is a number $z_{1}$ such that $z_{1}^{3} = 4 + \sqrt{15}$. We thus define $z_{1} = \sqrt[3]{4 + \sqrt{15}}$, and similarly we can define $z_{2} = \sqrt[3]{4 - \sqrt{15}}$; and then, as in § 10, we define $z = z_{1} + z_{2}$.

Now it is easy to verify that

$$z^{3} = 3z + 8.$$

And we might have given a direct proof of the existence of a unique number $z$ such that $z^{3} = 3z + 8$. It is easy to see that there cannot be two such numbers. For if $z_{1}^{3} = 3z_{1} + 8$ and $z_{2}^{3} = 3z_{2} + 8$, we find on subtracting and dividing by $z_{1} - z_{2}$ that $z_{1}^{2} + z_{1}z_{2} + z_{2}^{2} = 3$. But if $z_{1}$ and $z_{2}$ are positive $z_{1}^{3}>8$, $z_{2}^{3}>8$ and therefore $z_{1} > 2$, $z_{2} > 2$, $z_{1}^{2} + z_{1}z_{2} + z_{2}^{2} > 12$, and so the equation just found is impossible. And it is easy to see that neither $z_{1}$ nor $z_{2}$ can be negative. For if $z_{1}$ is negative and equal to $-\zeta$, $\zeta$ is positive and $\zeta^{3} - 3\zeta + 8 = 0$, or $3 - \zeta^{2} = 8/\zeta$. Hence $3 - \zeta^{2} > 0$, and so $\zeta < 2$. But then $8/\zeta > 4$, and so $8/\zeta$ cannot be equal to $3 - \zeta^{2}$, which is less than $3$.
''',
  'ch1-t9': r'''
The ‘real numbers’ may be regarded from two points of view. We may think of them *as an aggregate*, the ‘arithmetical continuum’ defined in the preceding section, or *individually*. And when we think of them individually, we may think either of a particular *specified* number (such as $1$, $-\frac{1}{2}$, $\sqrt{2}$, or $\pi$) or we may think of *any* number, *an unspecified* number, *the number $x$*. This last is our point of view when we make such assertions as ‘$x$ is a number’, ‘$x$ is the measure of a length’, ‘$x$ may be rational or irrational’. The $x$ which occurs in propositions such as these is called *the continuous real variable*: and the individual numbers are called the *values* of the variable.

A ‘variable’, however, need not necessarily be continuous. Instead of considering the aggregate of *all* real numbers, we might consider some partial aggregate contained in the former aggregate, such as the aggregate of rational numbers, or the aggregate of positive integers. Let us take the last case. Then in statements about *any* positive integer, or *an unspecified* positive integer, such as ‘$n$ is either odd or even’, $n$ is called the variable, a *positive integral variable*, and the individual positive integers are its values.

Naturally ‘$x$’ and ‘$n$’ are only examples of variables, the variable whose ‘field of variation’ is formed by all the real numbers, and that whose field is formed by the positive integers. These are the most important examples, but we have often to consider other cases. In the theory of decimals, for instance, we may denote by $x$ any figure in the expression of any number as a decimal. Then $x$ is a variable, but a variable which has only ten different values, viz. $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$, $8$, $9$. The reader should think of other examples of variables with different fields of variation. He will find interesting examples in ordinary life: policeman $x$, the driver of cab $x$, the year $x$, the $x$th day of the week. The values of these variables are naturally not numbers.
''',
  'ch1-t10': r'''
In §§ 4–7 we considered ‘sections’ of the rational numbers, *i.e.* modes of division of the rational numbers (or of the positive rational numbers only) into two classes $L$ and $R$ possessing the following characteristic properties:

(i) that every number of the type considered belongs to one and only one of the two classes;

(ii) that both classes exist;

(iii) that any member of $L$ is less than any member of $R$.

It is plainly possible to apply the same idea to the aggregate of all real numbers, and the process is, as the reader will find in later chapters, of very great importance.

Let us then suppose that $P$ and $Q$ are two properties which are mutually exclusive, and one of which is possessed by every real number. Further let us suppose that any number which possesses $P$ is less than any which possesses $Q$. We call the numbers which possess $P$ the *lower* or *left-hand class* $L$, and those which possess $Q$ the *upper* or *right-hand class* $R$.

Thus $P$ might be $x \leqq \sqrt{2}$ and $Q$ be $x > \sqrt{2}$. It is important to observe that a pair of properties which suffice to define a section of the rational numbers may not suffice to define one of the real numbers. This is so, for example, with the pair ‘$x < \sqrt{2}$’ and ‘$x > \sqrt{2}$’ or (if we confine ourselves to positive numbers) with ‘$x^{2} < 2$’ and ‘$x^{2} > 2$’. Every rational number possesses one or other of the properties, but not every real number, since in either case $\sqrt{2}$ escapes classification.

There are now two possibilities. Either $L$ has a greatest member $l$, or $R$ has a least member $r$. *Both* of these events cannot occur. For if $L$ had a greatest member $l$, and $R$ a least member $r$, the number $\frac{1}{2}(l + r)$ would be greater than all members of $L$ and less than all members of $R$, and so could not belong to either class. On the other hand *one* event must occur.
''',
  'ch1-t11': r'''
A system of real numbers, or of the points on a straight line corresponding to them, defined in any way whatever, is called an **aggregate** or **set** of numbers or points. The set might consist, for example, of all the positive integers, or of all the rational points.

It is most convenient here to use the language of geometry. Suppose then that we are given a set of points, which we will denote by $S$. Take any point $\xi$, which may or may not belong to $S$. Then there are two possibilities. Either (i) it is possible to choose a positive number $\delta$ so that the interval $[\xi - \delta, \xi + \delta]$ does not contain any point of $S$, other than $\xi$ itself, or (ii) this is not possible.

Suppose, for example, that $S$ consists of the points corresponding to all the positive integers. If $\xi$ is itself a positive integer, we can take $\delta$ to be any number less than $1$, and (i) will be true; or, if $\xi$ is halfway between two positive integers, we can take $\delta$ to be any number less than $\frac{1}{2}$. On the other hand, if $S$ consists of all the rational points, then, whatever the value of $\xi$, (ii) is true; for any interval whatever contains an infinity of rational points.

Let us suppose that (ii) is true. Then any interval $[\xi - \delta, \xi + \delta]$, however small its length, contains at least one point $\xi_{1}$ which belongs to $S$ and does not coincide with $\xi$; and this whether $\xi$ itself be a member of $S$ or not. In this case we shall say that $\xi$ is a **point of accumulation** of $S$. It is easy to see that the interval $[\xi - \delta, \xi + \delta]$ must contain, not merely one, but infinitely many points of $S$. For, when we have determined $\xi_{1}$, we can take an interval $[\xi - \delta_{1}, \xi + \delta_{1}]$ surrounding $\xi$ but not reaching as far as $\xi_{1}$. But this interval also must contain a point, say $\xi_{2}$, which is a member of $S$ and does not coincide with $\xi$. Obviously we may repeat this argument, with $\xi_{2}$ in the place of $\xi_{1}$; and so on indefinitely. In this way we can determine as many points

$$\xi_{1},\quad \xi_{2},\quad \xi_{3},\ \dots$$

as we please, all belonging to $S$, and all lying inside the interval $[\xi - \delta, \xi + \delta]$.
''',
  'ch1-t12': r'''
The general theory of sets of points is of the utmost interest and importance in the higher branches of analysis; but it is for the most part too difficult to be included in a book such as this. There is however one fundamental theorem which is easily deduced from Dedekind’s Theorem and which we shall require later.

**Theorem.** If a set $S$ contains infinitely many points, and is entirely situated in an interval $[\alpha, \beta]$, then at least one point of the interval is a point of accumulation of $S$.

We divide the points of the line $\Lambda$ into two classes in the following manner. The point $P$ belongs to $L$ if there are an infinity of points of $S$ to the right of $P$, and to $R$ in the contrary case. Then it is evident that conditions (i) and (iii) of Dedekind’s Theorem are satisfied; and since $\alpha$ belongs to $L$ and $\beta$ to $R$, condition (ii) is satisfied also.

Hence there is a point $\xi$ such that, however small be $\delta$, $\xi - \delta$ belongs to $L$ and $\xi + \delta$ to $R$, so that the interval $[\xi - \delta, \xi + \delta]$ contains an infinity of points of $S$. Hence $\xi$ is a point of accumulation of $S$.

This point may of course coincide with $\alpha$ or $\beta$, as for instance when $\alpha = 0$, $\beta = 1$, and $S$ consists of the points $1$, $\frac{1}{2}$, $\frac{1}{3}, \dots$. In this case $0$ is the sole point of accumulation.
''',
  'ch2-t1': r'''
Suppose that $x$ and $y$ are two continuous real variables, which we may suppose to be represented geometrically by distances $A_{0}P = x$, $B_{0}Q = y$ measured from fixed points $A_{0}$, $B_{0}$ along two straight lines $\Lambda$, $\mathrm{M}$. And let us suppose that the positions of the points $P$ and $Q$ are not independent, but connected by a relation which we can imagine to be expressed as a relation between $x$ and $y$: so that, when $P$ and $x$ are known, $Q$ and $y$ are also known. We might, for example, suppose that $y = x$, or $y = 2x$, or $\frac{1}{2}x$, or $x^{2} + 1$. In all of these cases the value of $x$ determines that of $y$. Or again, we might suppose that the relation between $x$ and $y$ is given, not by means of an explicit formula for $y$ in terms of $x$, but by means of a geometrical construction which enables us to determine $Q$ when $P$ is known.

In these circumstances $y$ is said to be a *function* of $x$. This notion of functional dependence of one variable upon another is perhaps the most important in the whole range of higher mathematics. In order to enable the reader to be certain that he understands it clearly, we shall, in this chapter, illustrate it by means of a large number of examples.

But before we proceed to do this, we must point out that the simple examples of functions mentioned above possess three characteristics which are by no means involved in the general idea of a function, viz.:

(1) $y$ is determined *for every value of $x$*;

(2) to each value of $x$ for which $y$ is given corresponds *one and only one value of $y$*;

(3) the relation between $x$ and $y$ is expressed by means of *an analytical formula*, from which the value of $y$ corresponding to a given value of $x$ can be calculated by direct substitution of the latter.
''',
  'ch2-t2': r'''
Suppose that the variable $y$ is a function of the variable $x$. It will generally be open to us also to regard $x$ as a function of $y$, in virtue of the functional relation between $x$ and $y$. But for the present we shall look at this relation from the first point of view. We shall then call $x$ the *independent variable* and $y$ the *dependent variable*; and, when the particular form of the functional relation is not specified, we shall express it by writing

$$y = f(x)$$

(or $F(x)$, $\phi(x)$, $\psi(x), \dots$, as the case may be).

The nature of particular functions may, in very many cases, be illustrated and made easily intelligible as follows. Draw two lines $OX$, $OY$ at right angles to one another and produced indefinitely in both directions. We can represent values of $x$ and $y$ by distances measured from $O$ along the lines $OX$, $OY$ respectively, regard being paid, of course, to sign, and the positive directions of measurement being those indicated by arrows in Fig. 6.

Let $a$ be any value of $x$ for which $y$ is defined and has (let us suppose) the single value $b$. Take $OA = a$, $OB = b$, and complete the rectangle $OAPB$. Imagine the point $P$ marked on the diagram. This marking of the point $P$ may be regarded as showing that the value of $y$ for $x = a$ is $b$.

If to the value $a$ of $x$ correspond several values of $y$ (say $b$, $b'$, $b''$), we have, instead of the single point $P$, a number of points $P$, $P'$, $P''$.

We shall call $P$ the *point* $(a, b)$; $a$ and $b$ the *coordinates of $P$ referred to the axes $OX$, $OY$*; $a$ the *abscissa*, $b$ the *ordinate* of $P$; $OX$ and $OY$ the *axis of $x$* and the *axis of $y$*, or together the

*axes of coordinates*, and $O$ the *origin of coordinates*, or simply the *origin*.
''',
  'ch2-t3': r'''
In what precedes we have determined the position of $P$ by the lengths of its coordinates $OM = x$, $MP = y$. If $OP = r$ and $MOP = \theta$, $\theta$ being an angle between $0$ and $2\pi$ (measured in the positive direction), it is evident that

$$\begin{array}{c}\displaystyle x = r\cos\theta,\qquad y = r\sin\theta, \\ \displaystyle r = \sqrt{x^{2} + y^{2}},\quad \cos\theta : \sin\theta : 1 :: x : y : r, \end{array}$$

and that the position of $P$ is equally well determined by a knowledge of $r$ and $\theta$. We call $r$ and $\theta$ the *polar coordinates* of $P$. The former, it should be observed, is essentially positive.

If $P$ moves on a locus there will be some relation between $r$ and $\theta$, say $r = f(\theta)$ or $\theta = F(r)$. This we call the *polar equation* of the locus. The polar equation may be deduced from the $(x, y)$ equation (or *vice versa*) by means of the formulae above.

Thus the polar equation of a straight line is of the form

$$r\cos(\theta - \alpha) = p,$$

where $p$ and $\alpha$ are constants. The equation $r = 2a\cos\theta$ represents a circle passing through the origin; and the general equation of a circle is of the form

$$r^{2} + c^{2} - 2rc\cos(\theta - \alpha) = A^{2},$$

where $A$, $c$, and $\alpha$ are constants.
''',
  'ch2-t4': r'''
The examples which follow will give the reader a better notion of the infinite variety of possible types of functions.

**A. Polynomials.** A *polynomial* in $x$ is a function of the form

$$a_{0}x^{m} + a_{1}x^{m-1} + \dots + a_{m},$$

where $a_{0}$, $a_{1}$, …, $a_{m}$ are constants. The simplest polynomials are the simple powers $y = x$, $x^{2}$, $x^{3}$, …, $x^{m}, \dots$. The graph of the function $x^{m}$ is of two distinct types, according as $m$ is even or odd.

First let $m = 2$. Then three points on the graph are $(0, 0)$, $(1, 1)$, $(-1, 1)$. Any number of additional points on the graph may be found by assigning other special values to $x$: thus the values

$$\begin{alignedat}{6} x &= \tfrac{1}{2},\quad &&2,\quad &&3,\quad -&&\tfrac{1}{2},\quad -&&2,\quad &&3 \\ \\ \text{give} \\ y &= \tfrac{1}{4},\quad &&4,\quad &&9,\quad &&\tfrac{1}{4},\quad &&4,\quad &&9. \end{alignedat}$$

If the reader will plot off a fair number of points on the graph, he will be led to conjecture that the form of the graph is something like that shown in Fig. 8. If he draws a curve through the special points which he has proved to lie on the graph and then tests its accuracy by giving $x$ new values, and calculating the corresponding values of $y$, he will find that they lie as near to the curve as it is reasonable to expect, when the inevitable inaccuracies of drawing are considered. The curve is of course a parabola.

There is, however, one fundamental question which we cannot answer adequately at present. The reader has no doubt some notion as to what is meant by a *continuous* curve, a curve without breaks or jumps; such a curve, in fact, as is roughly represented in Fig. 8. The question is whether the graph of the function $y = x^{2}$ is in fact such a curve. This cannot be *proved* by merely constructing any number of isolated points on the curve, although the more such points we construct the more probable it will appear.
''',
  'ch2-t5': r'''
**B. Rational Functions.** The class of functions which ranks next to that of polynomials in simplicity and importance is that of *rational functions*. A rational function is the quotient of one polynomial by another: thus if $P(x)$, $Q(x)$ are polynomials, we may denote the general rational function by

$$R(x) = \frac{P(x)}{Q(x)}.$$

In the particular case when $Q(x)$ reduces to unity or any other constant (*i.e.* does not involve $x$), $R(x)$ reduces to a polynomial: thus the class of rational functions includes that of polynomials as a sub-class. The following points concerning the definition should be noticed.

(1) We usually suppose that $P(x)$ and $Q(x)$ have no common factor $x + a$ or $x^{p} + ax^{p-1} + bx^{p-2} + \dots + k$, all such factors being removed by division.

(2) It should however be observed that this removal of common factors *does as a rule change the function*. Consider for example the function $x/x$, which is a rational function. On removing the common factor $x$ we obtain $1/1 = 1$. But the original function is not *always* equal to $1$: it is equal to $1$ only so long as $x\neq 0$. If $x = 0$ it takes the form $0/0$, which is meaningless. Thus the function $x/x$ is equal to $1$ if $x\neq 0$ and is undefined when $x = 0$. It therefore differs from the function $1$, which is *always* equal to $1$.

(3) Such a function as

$$\left(\frac{1}{x + 1} + \frac{1}{x - 1}\right) \bigg/ \left(\frac{1}{x} + \frac{1}{x - 2}\right)$$

may be reduced, by the ordinary rules of algebra, to the form

$$\frac{x^{2}(x - 2)}{(x - 1)^{2} (x + 1)},$$

which is a rational function of the standard form. But here again it must be noticed that the reduction is not *always* legitimate. In order to calculate the value of a function for a given value of $x$ we must substitute the value for $x$ in the function *in the form in which it is given*. In the case of this function the values $x = -1$, $1$, $0$, $2$ all lead to a meaningless expression, and so the function is not defined for these values. The same is true of the reduced form, so far as the values $-1$ and $1$ are concerned. But $x = 0$ and $x = 2$ give the value $0$. Thus once more the two functions are not the same.
''',
  'ch2-t6': r'''
**C. Explicit Algebraical Functions.** The next important class of functions is that of *explicit algebraical functions*. These are functions which can be generated from $x$ by a finite number of operations such as those used in generating rational functions, together with a finite number of operations of root extraction. Thus

$$\frac{\sqrt{1 + x} - \sqrt[3]{1 - x}} {\sqrt{1 + x} + \sqrt[3]{1 - x}},\quad \sqrt{x} + \sqrt{x +\sqrt{x}},\quad \left(\frac{x^{2} + x + \sqrt{3}}{x\sqrt[3]{2} - \pi}\right)^{\frac{2}{3}}$$

are explicit algebraical functions, and so is $x^{m/n}$ (*i.e.* $\sqrt[n]{x^{m}}$), where $m$ and $n$ are any integers.

It should be noticed that there is an ambiguity of notation involved in such an equation as $y = \sqrt{x}$. We have, up to the present, regarded (*e.g.*) $\sqrt{2}$ as denoting the *positive* square root of $2$, and it would be natural to denote by $\sqrt{x}$, where $x$ is any positive number, the positive square root of $x$, in which case $y = \sqrt{x}$ would be a one-valued function of $x$. It is however often more convenient to regard $\sqrt{x}$ as standing for the two-valued function whose two values are the positive and negative square roots of $x$.

The reader will observe that, when this course is adopted, the function $\sqrt{x}$ differs fundamentally from rational functions in two respects. In the first place a rational function is always defined for all values of $x$ with a certain number of isolated exceptions. But $\sqrt{x}$ is undefined for a *whole range* of values of $x$ (*i.e.* all negative values). Secondly the function, when $x$ has a value for which it is defined, has generally two values of opposite signs.

The function $\sqrt[3]{x}$, on the other hand, is one-valued and defined for all values of $x$.

**27.**

**D. Implicit Algebraical Functions.** It is easy to verify that if

$$y = \frac{\sqrt{1 + x} - \sqrt[3]{1 - x}} {\sqrt{1 + x} + \sqrt[3]{1 - x}},$$

then

$$\left(\frac{1 + y}{1 - y}\right)^{6} = \frac{(1 + x)^{3}}{(1 - x)^{2}};$$

or if

$$y = \sqrt{x} + \sqrt{x + \sqrt{x}},$$

then

$$y^{4} - (4y^{2} + 4y + 1)x = 0.$$

Each of these equations may be expressed in the form

$$y^{m} + R_{1}y^{m-1} + \dots + R_{m} = 0, \qquad\text{(1)}$$

where $R_{1}$, $R_{2}$, …, $R_{m}$ are rational functions of $x$: and the reader will easily verify that, if $y$ is any one of the functions considered in the last set of examples, $y$ satisfies an equation of this form.
''',
  'ch2-t7': r'''
All functions of $x$ which are not rational or even algebraical are called *transcendental* functions. This class of functions, being defined in so purely negative a manner, naturally includes an infinite variety of whole kinds of functions of varying degrees of simplicity and importance. Among these we can at present distinguish two kinds which are particularly interesting.

**E. The direct and inverse trigonometrical or circular functions.** These are the sine and cosine functions of elementary trigonometry, and their inverses, and the functions derived from them. We may assume provisionally that the reader is familiar with their most important properties.

**29.**

**F. Other classes of transcendental functions.** Next in importance to the trigonometrical functions come the exponential and logarithmic functions, which will be discussed in Chs. IX and X\@. But these functions are beyond our range at present. And most of the other classes of transcendental functions whose properties have been studied, such as the elliptic functions, Bessel’s and Legendre’s functions, Gamma-functions, and so forth, lie altogether beyond the scope of this book. There are however some elementary types of functions which, though of much less importance theoretically than the rational, algebraical, or trigonometrical functions, are particularly instructive as illustrations of the possible varieties of the functional relation.
''',
  'ch2-t8': r'''
Many equations can be expressed in the form

$$f(x) = \phi(x), \qquad\text{(1)}$$

where $f(x)$ and $\phi(x)$ are functions whose graphs are easy to draw. And if the curves

$$y = f(x),\quad y = \phi(x)$$

intersect in a point $P$ whose abscissa is $\xi$, then $\xi$ is a root of the equation (1).
''',
  'ch2-t9': r'''
In § 20 we considered two variables connected by a relation. We may similarly consider *three* variables ($x$, $y$, and $z$) connected by a relation such that when the values of $x$ and $y$ are both given, the value or values of $z$ are known. In this case we call $z$ a *function of the two variables* $x$ and $y$; $x$ and $y$ the *independent* variables, $z$ the *dependent* variable; and we express this dependence of $z$ upon $x$ and $y$ by writing

$$z = f(x, y).$$

The remarks of § 20 may all be applied, *mutatis mutandis*, to this more complicated case.

The method of representing such functions of two variables graphically is exactly the same in principle as in the case of functions of a single variable. We must take three axes, $OX$, $OY$, $OZ$ in space of three dimensions, each axis being perpendicular to the other two. The point $(a, b, c)$ is the point whose distances from the planes $YOZ$, $ZOX$, $XOY$, measured parallel to $OX$, $OY$, $OZ$, are $a$, $b$, and $c$. Regard must of course be paid to sign, lengths measured in the directions $OX$, $OY$, $OZ$ being regarded as positive. The definitions of *coordinates*, *axes*, *origin* are the same as before.

Now let

$$z = f(x, y).$$

As $x$ and $y$ vary, the point $(x, y, z)$ will move in space. The aggregate of all the positions it assumes is called the *locus* of the point $(x, y, z)$ or the *graph* of the function $z = f(x, y)$. When the relation between $x$, $y$, and $z$ which defines $z$ can be expressed in an analytical formula, this formula is called the *equation* of the locus. It is easy to show, for example, that the equation

$$Ax + By + Cz + D = 0$$

(*the general equation of the first degree*) represents a *plane*, and that the equation of any plane is of this form. The equation

$$(x - \alpha)^{2} + (y - \beta)^{2} + (z - \gamma)^{2} = \rho^{2},$$

or

$$x^{2} + y^{2} + z^{2} + 2Fx + 2Gy + 2Hz + C = 0,$$

where $F^{2} + G^{2} + H^{2} - C > 0$, represents a *sphere*; and so on. For proofs of these propositions we must again refer to text-books of Analytical Geometry.
''',
  'ch2-t10': r'''
We have hitherto used the notation

$$y = f(x) \qquad\text{(1)}$$

to express functional dependence of $y$ upon $x$. It is evident that this notation is most appropriate in the case in which $y$ is expressed explicitly in terms of $x$ by means of a formula, as when for example

$$y = x^{2},\quad \sin x,\quad a\cos^{2}x + b\sin^{2}x.$$

We have however very often to deal with functional relations which it is impossible or inconvenient to express in this form. If, for example, $y^{5} - y - x = 0$ or $x^{5} + y^{5} - ay = 0$, it is known to be impossible to express $y$ explicitly as an algebraical function of $x$. If

$$x^{2} + y^{2} + 2Gx + 2Fy+ C = 0,$$

$y$ can indeed be so expressed, viz. by the formula

$$y = -F + \sqrt{F^{2} - x^{2} - 2Gx - C};$$

but the functional dependence of $y$ upon $x$ is better and more simply expressed by the original equation.

It will be observed that in these two cases the functional relation is fully expressed *by equating a function of the two variables $x$ and $y$ to zero*, *i.e.* by means of an equation

$$f(x, y) = 0. \qquad\text{(2)}$$

We shall adopt this equation as the standard method of expressing the functional relation. It includes the equation (1) as a special case, since $y - f(x)$ is a special form of a function of $x$ and $y$. We can then speak of the locus of the point $(x, y)$ subject to $f(x, y) = 0$, the graph of the function $y$ defined by $f(x, y) = 0$, the curve or locus $f(x, y) = 0$, and the equation of this curve or locus.

There is another method of representing curves which is often useful. Suppose that $x$ and $y$ are both functions of a third variable $t$, which is to be regarded as essentially auxiliary and devoid of any particular geometrical significance. We may write

$$x = f(t),\quad y = F(t). \qquad\text{(3)}$$

If a particular value is assigned to $t$, the corresponding values of $x$ and of $y$ are known. Each pair of such values defines a point $(x, y)$.
''',
  'ch2-t11': r'''
In space of three dimensions there are two fundamentally different kinds of loci, of which the simplest examples are the plane and the straight line.

A particle which moves along a straight line has only *one degree of freedom*. Its direction of motion is fixed; its position can be completely fixed by one measurement of position, *e.g.* by its distance from a fixed point on the line. If we take the line as our fundamental line $\Lambda$ of Chap. I, the position of any of its points is determined by a single coordinate $x$. A particle which moves in a plane, on the other hand, has *two* degrees of freedom; its position can only be fixed by the determination of two coordinates.

A locus represented by a single equation

$$z = f(x, y)$$

plainly belongs to the second of these two classes of loci, and is called a *surface*. It may or may not (in the obvious simple cases it will) satisfy our common-sense notion of what a surface should be.

The considerations of § 31 may evidently be generalised so as to give definitions of a function $f(x, y, z)$ of *three* variables (or of functions of any number of variables). And as in § 32 we agreed to adopt $f(x, y) = 0$ as the standard form of the equation of a plane curve, so now we shall agree to adopt

$$f(x, y, z) = 0$$

as the standard form of equation of a surface.
''',
  'ch3-t1': r'''
The ‘real number’ $x$, with which we have been concerned in the two preceding chapters, may be regarded from many different points of view. It may be regarded as a pure number, destitute of geometrical significance, or a geometrical significance may be attached to it in at least three different ways. It may be regarded as *the measure of a length*, viz. the length $A_{0}P$ along the line $\Lambda$ of Chap. I\@. It may be regarded as *the mark of a point*, viz. the point $P$ whose distance from $A_{0}$ is $x$. Or it may be regarded as *the measure of a displacement* or *change of position* on the line $\Lambda$. It is on this last point of view that we shall now concentrate our attention.

Imagine a small particle placed at $P$ on the line $\Lambda$ and then displaced to $Q$. We shall call the displacement or change of position which is needed to transfer the particle from $P$ to $Q$ *the displacement $\overline{PQ}$*. To specify a displacement completely three things are needed, its *magnitude*, its *sense* forwards or backwards along the line, and what may be called its *point of application*, *i.e.* the original position $P$ of the particle. But, when we are thinking merely of the change of position produced by the displacement, it is natural to disregard the point of application and to consider all displacements as equivalent whose lengths and senses are the same. Then the displacement is completely specified by the length $PQ = x$, the sense of the displacement being fixed by the sign of $x$. We may therefore, without ambiguity, speak of *the displacement $[x]$*, and we may write $\overline{PQ} = [x]$.

We use the square bracket to distinguish the displacement $[x]$ from the length or number $x$. If the coordinate of $P$ is $a$, that of $Q$ will be $a + x$; the displacement $[x]$ therefore transfers a particle from the point $a$ to the point $a + x$.
''',
  'ch3-t2': r'''
Just as to a displacement $[x]$ along $OX$ correspond a point $(x)$ and a real number $x$, so to a displacement $[x, y]$ in the plane correspond a point $(x, y)$ and a *pair of real numbers $x$, $y$*.

We shall find it convenient to denote this pair of real numbers $x$, $y$ by the symbol

$$x + yi.$$

The reason for the choice of this notation will appear later. For the present the reader must regard $x + yi$ as *simply another way of writing $[x, y]$*. The expression $x + yi$ is called a *complex number*.

We proceed next to define *equivalence*, *addition*, and *multiplication* of complex numbers. To every complex number corresponds a displacement. Two complex numbers are equivalent if the corresponding displacements are equivalent. The sum or product of two complex numbers is the complex number which corresponds to the sum or product of the two corresponding displacements. Thus

$$x + yi = x' + y'i, \qquad\text{(1)}$$

if and only if $x = x'$, $y = y'$;

$$\begin{array}{c}\displaystyle (x + yi) + (x' + y'i) = (x + x') + (y + y')i; \qquad\text{(2)}\\ \displaystyle (x + yi) (x' + y'i) = xx' - yy' + (xy' + yx')i. \qquad\text{(3)} \end{array}$$

In particular we have, as special cases of (2) and (3),

$$\begin{array}{c}\displaystyle x + yi = (x + 0i) + (0 + yi),\\ \displaystyle (x + 0i) (x' + y'i) = xx' + xy'i; \end{array}$$

and these equations suggest that there will be no danger of confusion if, when dealing with complex numbers, we write $x$ for $x + 0i$ and $yi$ for $0 + yi$, as we shall henceforth.

Positive integral powers and polynomials of complex numbers are then defined as in ordinary algebra. Thus, by putting $x = x'$, $y = y'$ in (3), we obtain

$$(x + yi)^{2} = (x + yi) (x + yi) = x^{2} - y^{2} + 2xyi.$$

The reader will easily verify for himself that addition and multiplication of complex numbers obey the laws of algebra expressed by the equations

$$\begin{array}{c}\displaystyle (x + yi) + (x' + y'i) = (x' + y'i) + (x + yi),\\ \displaystyle \{(x + yi) + (x' + y'i)\} + (x'' + y''i) = (x + yi) + \{(x' + y'i) + (x'' + y''i)\},\\ \displaystyle (x + yi) (x' + y'i) = (x' + y'i) (x + yi),\\ \displaystyle (x + yi)\{(x' + y'i) + (x'' + y''i)\} = (x + yi)(x' + y'i) + (x + yi)(x'' + y''i),\\ \displaystyle \{(x + yi) + (x' + y'i)\}(x'' + y''i) = (x + yi)(x'' + y''i) + (x' + y'i)(x'' + y''i),\\ \displaystyle (x + yi) \{(x' + y'i) (x'' + y''i)\} = \{(x + yi) (x' + y'i)\} (x'' + y''i), \end{array}$$

the proofs of these equations being practically the same as those of the corresponding equations for the corresponding displacements.
''',
  'ch3-t3': r'''
There is no real number $z$ such that $z^{2} + 1 = 0$; this is expressed by saying that the equation has *no real roots*. But, as we have just seen, the two complex numbers $i$ and $-i$ satisfy this equation. We express this by saying that the equation has *the two complex roots* $i$ and $-i$. Since $i$ satisfies $z^{2} = -1$, it is sometimes written in the form $\sqrt{-1}$.

Complex numbers are sometimes called *imaginary*. The expression is by no means a happily chosen one, but it is firmly established and has to be accepted. It cannot, however, be too strongly impressed upon the reader that an ‘imaginary number’ is no more ‘imaginary’, in any ordinary sense of the word, than a ‘real’ number; and that it is not a number at all, in the sense in which the ‘real’ numbers are numbers, but, as should be clear from the preceding discussion, *a pair of numbers $(x, y)$*, united symbolically, for purposes of technical convenience, in the form $x + yi$. Such a pair of numbers is no less ‘real’ than any ordinary number such as $\frac{1}{2}$, or than the paper on which this is printed, or than the Solar System. Thus

$$i = 0 + 1i$$

stands for the pair of numbers $(0, 1)$, and may be represented geometrically by a point or by the displacement $[0, 1]$. And when we say that $i$ is a root of the equation $z^{2} + 1 = 0$, what we mean is simply that we have defined a method of combining such pairs of numbers (or displacements) which we call ‘multiplication’, and which, when we so combine $(0, 1)$ with itself, gives the result $(-1, 0)$.

Now let us consider the more general equation

$$az^{2} + 2bz + c = 0,$$

where $a$, $b$, $c$ are real numbers. If $b^{2} > ac$, the ordinary method of solution gives two real roots

$$\{-b \pm \sqrt{b^{2} - ac}\}/a.$$

If $b^{2} < ac$, the equation has no real roots. It may be written in the form

$$\{z + (b/a)\}^{2} = -(ac - b^{2})/a^{2},$$

an equation which is evidently satisfied if we substitute for $z + (b/a)$ either of the complex numbers $\pm i\sqrt{ac - b^{2}}/a$. We express this by saying that the equation has *the two complex roots*
''',
  'ch3-t4': r'''
Let $P$ (Fig. 24) be the point $(x, y)$, $r$ the length $OP$, and $\theta$ the angle $XOP$, so that

$$x = r\cos\theta,\quad y = r\sin\theta,\quad r = \sqrt{x^{2} + y^{2}},\quad \cos\theta : \sin\theta : 1 :: x : y : r.$$

We denote the complex number $x + yi$ by $z$, as in § 43, and we call $z$ the *complex variable*.

We call $P$ *the point* $z$, or the point corresponding to $z$; $z$ the *argument* of $P$, $x$ the *real part*, $y$ the *imaginary part*, $r$ the *modulus*, and $\theta$ the *amplitude* of $z$; and we write

$$x = \mathbf{R}(z),\quad y = \mathbf{I}(z),\quad r = |z|,\quad \theta = {\operatorname{am}} z.$$

When $y = 0$ we say that *$z$ is real*, when $x = 0$ that *$z$ is purely imaginary*. Two numbers $x + yi$, $x - yi$ which differ only in the signs of their imaginary parts, we call *conjugate*. It will be observed that the sum $2x$ of two conjugate numbers and their product $x^{2} + y^{2}$ are both real, that they have the same modulus $\sqrt{x^{2} + y^{2}}$ and that their product is equal to the square of the modulus of either. The roots of a quadratic with real coefficients, for example, are conjugate, when not real.

It must be observed that $\theta$ or ${\operatorname{am}} z$ is a many-valued function of $x$ and $y$, having an infinity of values, which are angles differing by multiples of $2\pi$. A line originally lying along $OX$ will, if turned through any of these angles, come to lie along $OP$. We shall describe that one of these angles which lies between $-\pi$ and $\pi$ as the *principal value* of the amplitude of $z$. This definition is unambiguous except when one of the values is $\pi$, in which case $-\pi$ is also a value. In this case we must make some special provision as to which value is to be regarded as the principal value. In general, when we speak of the amplitude of $z$ we shall, unless the contrary is stated, mean the principal value of the amplitude.
''',
  'ch3-t5': r'''
The following statements follow immediately from the definitions of addition and multiplication.

(1) The real (or imaginary) part of the sum of two complex numbers is equal to the sum of their real (or imaginary) parts.

(2) The modulus of the product of two complex numbers is equal to the product of their moduli.

(3) The amplitude of the product of two complex numbers is either equal to the sum of their amplitudes, or differs from it by $2\pi$.

It should be observed that it is not always true that the principal value of ${\operatorname{am}}(zz')$ is the sum of the principal values of ${\operatorname{am}} z$ and ${\operatorname{am}} z'$. For example, if $z = z' = -1 + i$, then the principal values of the amplitudes of $z$ and $z'$ are each $\frac{3}{4}\pi$. But $zz' = -2i$, and the principal value of ${\operatorname{am}}(zz')$ is $-\frac{1}{2}\pi$ and not $\frac{3}{2}\pi$.

The two last theorems may be expressed in the equation

$$r(\cos\theta + i\sin\theta) \times \rho(\cos\phi + i\sin\phi) = r\rho\{\cos(\theta + \phi) + i\sin(\theta + \phi)\},$$

which may be proved at once by multiplying out and using the ordinary trigonometrical formulae for $\cos(\theta + \phi)$ and $\sin(\theta + \phi)$. More generally

$$\begin{array}{c}\displaystyle r_{1}(\cos\theta_{1} + i\sin\theta_{1}) \times r_{2}(\cos\theta_{2} + i\sin\theta_{2}) \times \dots \times r_{n}(\cos\theta_{n} + i\sin\theta_{n})\\ \displaystyle = r_{1}r_{2} \dots r_{n} \{\cos(\theta_{1} + \theta_{2} + \dots + \theta_{n}) + i \sin(\theta_{1} + \theta_{2} + \dots + \theta_{n})\}. \end{array}$$

A particularly interesting case is that in which

$$r_{1} = r_{2} = \dots = r_{n} = 1, \quad \theta_{1} = \theta_{2} = \dots = \theta_{n} = \theta.$$

We then obtain the equation

$$(\cos\theta + i\sin\theta)^{n} = \cos n\theta + i\sin n\theta,$$

where $n$ is any positive integer: a result known as *De Moivre’s Theorem*.

Again, if

$$z = r(\cos\theta + i\sin\theta)$$

then

$$1/z = (\cos\theta - i\sin\theta)/r.$$

Thus the modulus of the reciprocal of $z$ is the reciprocal of the modulus of $z$, and the amplitude of the reciprocal is the negative of the amplitude of $z$. We can now state the theorems for quotients which correspond to (2) and (3).

(4) The modulus of the quotient of two complex numbers is equal to the quotient of their moduli.
''',
  'ch3-t6': r'''
We add some theorems concerning rational functions of complex numbers. A *rational function* of the complex variable $z$ is defined exactly as is a rational function of a real variable $x$, viz. as the quotient of two polynomials in $z$.

**Theorem 1..** Any rational function $R(z)$ can be reduced to the form $X + Yi$, where $X$ and $Y$ are rational functions of $x$ and $y$ with real coefficients.

In the first place it is evident that any polynomial $P(x + yi)$ can be reduced, in virtue of the definitions of addition and multiplication, to the form $A + Bi$, where $A$ and $B$ are polynomials in $x$ and $y$ with real coefficients. Similarly $Q(x + yi)$ can be reduced to the form $C + Di$. Hence

$$R(x + yi) = P(x + yi)/Q(x + yi)$$

can be expressed in the form

$$\begin{aligned} (A + Bi)/(C + Di) &= (A + Bi) (C - Di)/(C + Di) (C - Di)\\ &= \frac{AC + BD}{C^{2} + D^{2}} + \frac{BC - AD}{C^{2} + D^{2}} i, \end{aligned}$$

which proves the theorem.

**Theorem 2..** If $R(x + yi) = X + Yi$, $R$ denoting a rational function as before, but with **real** coefficients, then $R(x - yi) = X - Yi$.

In the first place this is easily verified for a power $(x + yi)^{n}$ by actual expansion. It follows by addition that the theorem is true for any polynomial with real coefficients. Hence, in the notation used above,

$$R(x - yi) = \frac{A - Bi}{C - Di} = \frac{AC + BD}{C^{2} + D^{2}} - \frac{BC - AD}{C^{2} + D^{2}}i,$$

the reduction being the same as before except that the sign of $i$ is changed throughout. It is evident that results similar to those of Theorems 1 and 2 hold for functions of any number of complex variables.

**Theorem 3..** The roots of an equation

$$a_{0}z^{n} + a_{1}z^{n-1} + \dots + a_{n} = 0,$$

whose coefficients are real, may, in so far as they are not themselves real, be arranged in conjugate pairs.

For it follows from Theorem 2 that if $x + yi$ is a root then so is $x - yi$. A particular case of this theorem is the result (§ 43) that the roots of a quadratic equation with real coefficients are either real or conjugate.
''',
  'ch3-t7': r'''
We have not, up to the present, attributed any meaning to symbols such as $\sqrt[n]{a}$, $a^{m/n}$, when $a$ is a complex number, and $m$ and $n$ integers. It is, however, natural to adopt the definitions which are given in elementary algebra for real values of $a$. Thus we define $\sqrt[n]{a}$ or $a^{1/n}$, where $n$ is a positive integer, as a number $z$ which satisfies the equation $z^{n} = a$; and $a^{m/n}$, where $m$ is an integer, as $(a^{1/n})^{m}$. These definitions do not prejudge the question as to whether there are or are not more than one (or any) roots of the equation.

**48. Solution of the equation $z^{n} = a$.**

Let

$$a = \rho(\cos\phi + i\sin\phi),$$

where $\rho$ is positive and $\phi$ is an angle such that $-\pi < \phi \leqq \pi$. If we put $z = r(\cos\theta + i\sin\theta)$, the equation takes the form

$$r^{n}(\cos n\theta + i\sin n\theta) = \rho(\cos\phi + i \sin\phi);$$

so that

$$r^{n} = \rho,\quad \cos n\theta = \cos\phi,\quad \sin n\theta = \sin\phi. \qquad\text{(1)}$$

The only possible value of $r$ is $\sqrt[n]{\rho}$, the ordinary arithmetical $n$th root of $\rho$; and in order that the last two equations should be satisfied it is necessary and sufficient that $n\theta = \phi + 2k\pi$, where $k$ is an integer, or

$$\theta = (\phi + 2k\pi)/n.$$

If $k = pn + q$, where $p$ and $q$ are integers, and $0 \leqq q < n$, the value of $\theta$ is $2p\pi + (\phi + 2q\pi)/n$, and in this the value of $p$ is a matter of indifference. Hence the equation

$$z^{n} = a = \rho(\cos\phi + i\sin\phi)$$

has $n$ roots and $n$ only, given by $z = r(\cos\theta + i\sin\theta)$, where

$$r = \sqrt[n]{\rho},\quad \theta = (\phi + 2q\pi)/n,\quad (q = 0,\ 1,\ 2,\ \dots, n - 1).$$

That these $n$ roots are in reality all distinct is easily seen by plotting them on Argand’s diagram. The particular root

$$\sqrt[n]{\rho}\{\cos(\phi/n) + i\sin(\phi/n)\}$$

is called the *principal value* of $\sqrt[n]{a}$.
''',
  'ch4-t1': r'''
In Chapter II we discussed the notion of a function of a real variable $x$, and illustrated the discussion by a large number of examples of such functions. And the reader will remember that there was one important particular with regard to which the functions which we took as illustrations differed very widely. Some were defined for *all* values of $x$, some for *rational* values only, some for *integral* values only, and so on.

Consider, for example, the following functions: (i) $x$, (ii) $\sqrt{x}$, (iii) the denominator of $x$, (iv) the square root of the product of the numerator and the denominator of $x$, (v) the largest prime factor of $x$, (vi) the product of $\sqrt{x}$ and the largest prime factor of $x$, (vii) the $x$th prime number, (viii) the height measured in inches of convict $x$ in Dartmoor prison.

Then the aggregates of values of $x$ for which these functions are defined or, as we may say, the *fields of definition* of the functions, consist of (i) *all* values of $x$, (ii) *all positive* values of $x$, (iii) *all rational* values of $x$, (iv) *all positive rational* values of $x$, (v) *all integral* values of $x$, (vi), (vii) *all positive integral* values of $x$, (viii) a certain number of positive integral values of $x$, viz., $1$, $2$, …, $N$, where $N$ is the total number of convicts at Dartmoor at a given moment of time.

Now let us consider a function, such as (vii) above, which is defined for all positive integral values of $x$ and no others. This function may be regarded from two slightly different points of view. We may consider it, as has so far been our custom, as a function of the real variable $x$ defined for some only of the values of $x$, viz. positive integral values, and say that for all other values of $x$ the definition fails. Or we may leave values of $x$ other than positive integral values entirely out of account, and regard our function as a function of the *positive integral variable $n$*, whose values are the positive integers

$$1,\ 2,\ 3,\ 4,\ \dots.$$

In this case we may write

$$y = \phi(n)$$

and regard $y$ now as a function of $n$ defined for all values of $n$.
''',
  'ch4-t2': r'''
The problem of determining a function of $x$ which shall assume, for all positive integral values of $x$, values agreeing with those of a given function of $n$, is of extreme importance in higher mathematics. It is called the *problem of functional interpolation*.

Were the problem however merely that of finding *some* function of $x$ to fulfil the condition stated, it would of course present no difficulty whatever. We could, as explained above, simply fill in the missing values as we pleased: we might indeed simply regard the given values of the function of $n$ as *all* the values of the function of $x$ and say that the definition of the latter function failed for all other values of $x$. But such purely theoretical solutions are obviously not what is usually wanted. What is usually wanted is some *formula* involving $x$ (of as simple a kind as possible) which assumes the given values for $x = 1$, $2$, ….

In some cases, especially when the function of $n$ is itself defined by a formula, there is an obvious solution. If for example $y = \phi(n)$, where $\phi(n)$ is a function of $n$, such as $n^{2}$ or $\cos n\pi$, which would have a meaning even were $n$ not a positive integer, we naturally take our function of $x$ to be $y = \phi(x)$. But even in this very simple case it is easy to write down other almost equally obvious solutions of the problem. For example

$$y = \phi(x) + \sin x\pi$$

assumes the value $\phi(n)$ for $x = n$, since $\sin n\pi = 0$.

In other cases $\phi(n)$ may be defined by a formula, such as $(-1)^{n}$, which ceases to define for some values of $x$ (as here in the case of fractional values of $x$ with even denominators, or irrational values). But it may be possible to transform the formula in such a way that it does define for all values of $x$. In this case, for example,

$$(-1)^{n} = \cos n\pi,$$

if $n$ is an integer, and the problem of interpolation is solved by the function $\cos x\pi$.
''',
  'ch4-t3': r'''
Before we proceed further it is necessary to make a few remarks about certain ideas of an abstract and logical nature which are of constant occurrence in Pure Mathematics.

In the first place, the reader is probably familiar with the notion of **a class**. It is unnecessary to discuss here any logical difficulties which may be involved in the notion of a ‘class’: roughly speaking we may say that a class is the aggregate or collection of all the entities or objects which possess a certain property, simple or complex. Thus we have the class of British subjects, or members of Parliament, or positive integers, or real numbers.

Moreover, the reader has probably an idea of what is meant by a **finite** or **infinite** class. Thus the class of *British subjects* is a finite class: the aggregate of all British subjects, past, present, and future, has a finite number $n$, though of course we cannot tell at present the actual value of $n$. The class of *present British subjects*, on the other hand, has a number $n$ which could be ascertained by counting, were the methods of the census effective enough.

On the other hand the class of positive integers is not finite but infinite. This may be expressed more precisely as follows. If $n$ is any positive integer, such as $1000$, $1,000,000$ or any number we like to think of, then there are more than $n$ positive integers. Thus, if the number we think of is $1,000,000$, there are obviously at least $1,000,001$ positive integers. Similarly the class of rational numbers, or of real numbers, is infinite. It is convenient to express this by saying that there are **an infinite number** of positive integers, or rational numbers, or real numbers. But the reader must be careful always to remember that by saying this we mean *simply* that the class in question has not a finite number of members such as $1000$ or $1,000,000$.
''',
  'ch4-t4': r'''
We may now return to the ‘functions of $n$’ which we were discussing in §§ 50–51. They have many points of difference from the functions of $x$ which we discussed in Chap. II\@. But there is one fundamental characteristic which the two classes of functions have in common: *the values of the variable for which they are defined form an infinite class*. It is this fact which forms the basis of all the considerations which follow and which, as we shall see in the next chapter, apply, *mutatis mutandis*, to functions of $x$ as well.

Suppose that $\phi(n)$ is any function of $n$, and that $P$ is any property which $\phi(n)$ may or may not have, such as that of being a positive integer or of being greater than $1$. Consider, for each of the values $n = 1$, $2$, $3$, …, whether $\phi(n)$ has the property $P$ or not. Then there are three possibilities:— (*a*) $\phi(n)$ may have the property $P$ for *all* values of $n$, or for all values of $n$ except a finite number $N$ of such values:

(*b*) $\phi(n)$ may have the property for *no* values of $n$, or only for a finite number $N$ of such values:

(*c*) neither (*a*) nor (*b*) may be true.

If (*b*) is true, the values of $n$ for which $\phi(n)$ has the property form a finite class. If (*a*) is true, the values of $n$ for which $\phi(n)$ has not the property form a finite class. In the third case neither class is finite. Let us consider some particular cases.

(1) Let $\phi(n) = n$, and let $P$ be the property of being a positive integer. Then $\phi(n)$ has the property $P$ for all values of $n$.

If on the other hand $P$ denotes the property of being a positive integer greater than or equal to $1000$, then $\phi(n)$ has the property for all values of $n$ except a finite number of values of $n$, viz. $1$, $2$, $3$, …, $999$. In either of these cases (*a*) is true.
''',
  'ch4-t5': r'''
After the discussion which precedes the reader should be in a position to appreciate the general notion of a *limit*. Roughly we may say that *$\phi(n)$ tends to a limit $l$ as $n$ tends to $\infty$ if $\phi(n)$ is nearly equal to $l$ when $n$ is large*. But although the meaning of this statement should be clear enough after the preceding explanations, it is not, as it stands, precise enough to serve as a strict mathematical definition. It is, in fact, equivalent to a whole class of statements of the type ‘*for sufficiently large values of $n$, $\phi(n)$ differs from $l$ by less than $\epsilon$*’. This statement has to be true for $\epsilon = .01$ or $.0001$ or *any* positive number; and for any such value of $\epsilon$ it has to be true for *any* value of $n$ after a certain definite value $n_{0}(\epsilon)$, though the smaller $\epsilon$ is the larger, as a rule, will be this value $n_{0}(\epsilon)$.

We accordingly frame the following formal definition:

**Definition I..** The function $\phi(n)$ is said to tend to the limit $l$ as $n$ tends to $\infty$, if, however small be the positive number $\epsilon$, $\phi(n)$ differs from $l$ by less than $\epsilon$ for sufficiently large values of $n$; that is to say if, however small be the positive number $\epsilon$, we can determine a number $n_{0}(\epsilon)$ corresponding to $\epsilon$, such that $\phi(n)$ differs from $l$ by less than $\epsilon$ for all values of $n$ greater than or equal to $n_{0}(\epsilon)$.

It is usual to denote the difference between $\phi(n)$ and $l$, taken positively, by $|\phi(n) - l|$. It is equal to $\phi(n) - l$ or to $l - \phi(n)$, whichever is positive, and agrees with the definition of the *modulus* of $\phi(n) - l$, as given in Chap. III, though at present we are only considering real values, positive or negative.

With this notation the definition may be stated more shortly as follows: ‘*if, given any positive number, $\epsilon$, however small, we can find $n_{0}(\epsilon)$ so that $|\phi(n) - l| < \epsilon$ when $n \geqq n_{0}(\epsilon)$, then we say that $\phi(n)$ tends to the limit $l$ as $n$ tends to $\infty$, and write*
''',
  'ch4-t6': r'''
**Definition.** When $\phi(n)$ does not tend to a limit, nor to $+\infty$, nor to $-\infty$, as $n$ tends to $\infty$, we say that $\phi(n)$ **oscillates** as $n$ tends to $\infty$.

A function $\phi(n)$ certainly oscillates if its values form, as in the case considered in the last example above, a continual repetition of a cycle of values. But of course it may oscillate without possessing this peculiarity. Oscillation is defined in a purely negative manner: a function oscillates when it does not do certain other things.

The simplest example of an oscillatory function is given by

$$\phi(n) = (-1)^{n},$$

which is equal to $+1$ when $n$ is even and to $-1$ when $n$ is odd. In this case the values recur cyclically. But consider

$$\phi(n) = (-1)^{n} + (1/n),$$

the values of which are

$$-1 + 1,\quad 1 + (1/2),\quad -1 + (1/3),\quad 1 + (1/4),\quad -1 + (1/5),\ \dots.$$

When $n$ is large every value is nearly equal to $+1$ or $-1$, and obviously $\phi(n)$ does not tend to a limit or to $+\infty$ or to $-\infty$, and therefore it oscillates: but the values do not recur. It is to be observed that in this case every value of $\phi(n)$ is numerically less than or equal to $3/2$. Similarly

$$\phi(n) = (-1)^{n} 100 + (1000/n)$$

oscillates. When $n$ is large, every value is nearly equal to $100$ or to $-100$. The numerically greatest value is $900$ (for $n = 1$). But now consider $\phi(n) = (-1)^{n}n$, the values of which are $-1$, $2$, $-3$, $4$, $-5$, …. This function oscillates, for it does not tend to a limit, nor to $+\infty$, nor to $-\infty$. And in this case we cannot assign any limit beyond which the numerical value of the terms does not rise. The distinction between these two examples suggests a further definition.

**Definition.** If $\phi(n)$ oscillates as $n$ tends to $\infty$, then $\phi(n)$ will be said to **oscillate finitely** or **infinitely** according as it is or is not possible to assign a number $K$ such that all the values of $\phi(n)$ are numerically less than $K$, *i.e.* $|\phi(n)| < K$ for all values of $n$.
''',
  'ch4-t7': r'''
**A. The behaviour of the sum of two functions whose behaviour is known.**

**Theorem I..** If $\phi(n)$ and $\psi(n)$ tend to limits $a$, $b$, then $\phi(n) + \psi(n)$ tends to the limit $a + b$.

This is almost obvious. The argument which the reader will at once form in his mind is roughly this: ‘when $n$ is large, $\phi(n)$ is nearly equal to $a$ and $\psi(n)$ to $b$, and therefore their sum is nearly equal to $a + b$’. It is well to state the argument quite formally, however.

Let $\epsilon$ be any assigned positive number (*e.g.* $.001$, $.000\,000\,1$, …). We require to show that a number $n_{0}$ can be found such that

$$|\phi(n) + \psi(n) - a - b| < \epsilon, \qquad\text{(1)}$$

when $n \geqq n_{0}$. Now by a proposition proved in Chap. III (more generally indeed than we need here) the modulus of the sum of two numbers is less than or equal to the sum of their moduli. Thus

$$|\phi(n) + \psi(n) - a - b| \leqq |\phi(n) - a| + |\psi(n) - b|.$$

It follows that the desired condition will certainly be satisfied if $n_{0}$ can be so chosen that

$$|\phi(n) - a| + |\psi(n) - b| < \epsilon, \qquad\text{(2)}$$

when $n \geqq n_{0}$. But this is certainly the case. For since $\lim\phi(n) = a$ we can, by the definition of a limit, find $n_{1}$ so that $|\phi(n) - a| < \epsilon'$ when $n \geqq n_{1}$, and this however small $\epsilon'$ may be. Nothing prevents our taking $\epsilon' = \frac{1}{2}\epsilon$, so that $|\phi(n) - a| < \frac{1}{2}\epsilon$ when $n \geqq n_{1}$. Similarly we can find $n_{2}$ so that $|\psi(n) - b| < \frac{1}{2}\epsilon$ when $n \geqq n_{2}$. Now take $n_{0}$ to be *the greater of the two numbers $n_{1}$, $n_{2}$*. Then $|\phi(n) - a| < \frac{1}{2}\epsilon$ and $|\psi(n) - b| < \frac{1}{2}\epsilon$ when $n \geqq n_{0}$, and therefore (2) is satisfied and the theorem is proved.

The argument may be concisely stated thus: since $\lim\phi(n) = a$ and $\lim\psi(n) = b$, we can choose $n_{1}$, $n_{2}$ so that

$$|\phi(n) - a| < \tfrac{1}{2}\epsilon\quad (n \geqq n_{1}),\qquad |\psi(n) - b| < \tfrac{1}{2}\epsilon\quad (n \geqq n_{2});$$

and then, if $n$ is not less than either $n_{1}$ or $n_{2}$,

$$|\phi(n) + \psi(n) - a - b| \leqq |\phi(n) - a| + |\psi(n) - b| < \epsilon;$$

and therefore

$$\lim\{\phi(n) + \psi(n)\} = a + b.$$

**64. Results subsidiary to Theorem I.**
''',
  'ch4-t8': r'''
A special but particularly important class of functions of $n$ is formed by those whose variation as $n$ tends to $\infty$ is always in the same direction, that is to say those which always increase (or always decrease) as $n$ increases. Since $-\phi(n)$ always increases if $\phi(n)$ always decreases, it is not necessary to consider the two kinds of functions separately; for theorems proved for one kind can at once be extended to the other.

**Definition.** The function $\phi(n)$ will be said to increase steadily with $n$ if $\phi(n + 1) \geqq \phi(n)$ for all values of $n$.

It is to be observed that we do not exclude the case in which $\phi(n)$ has the *same* value for several values of $n$; all we exclude is possible *decrease*. Thus the function

$$\phi(n) = 2n + (-1)^{n},$$

whose values for $n = 0$, $1$, $2$, $3$, $4$, … are

$$1,\ 1,\ 5,\ 5,\ 9,\ 9,\ \dots$$

is said to increase steadily with $n$. Our definition would indeed include even functions which remain constant from some value of $n$ onwards; thus $\phi(n) = 1$ steadily increases according to our definition. However, as these functions are extremely special ones, and as there can be no doubt as to their behaviour as $n$ tends to $\infty$, this apparent incongruity in the definition is not a serious defect.

There is one exceedingly important theorem concerning functions of this class.

**Theorem.** If $\phi(n)$ steadily increases with $n$, then either (i) $\phi(n)$ tends to a limit as $n$ tends to $\infty$, or (ii) $\phi(n)\to +\infty$.

That is to say, while there are in general *five* alternatives as to the behaviour of a function, there are *two* only for this special kind of function.

This theorem is a simple corollary of Dedekind’s Theorem (§ 17). We divide the real numbers $\xi$ into two classes $L$ and $R$, putting $\xi$ in $L$ or $R$ according as $\phi(n) \geqq \xi$ for some value of $n$ (and so of course for all greater values), or $\phi(n) < \xi$ for all values of $n$.
''',
  'ch4-t9': r'''
The results of § 69 enable us to give an alternative proof of the important theorem proved in § 19.

If we divide $PQ$ into two equal parts, one at least of them must contain infinitely many points of $S$. We select the one which does, or, if both do, we select the left-hand half; and we denote the selected half by $P_{1}Q_{1}$ (Fig. 28). If $P_{1}Q_{1}$ is the left-hand half, $P_{1}$ is the same point as $P$.

Similarly, if we divide $P_{1}Q_{1}$ into two halves, one at least of them must contain infinitely many points of $S$. We select the half $P_{2}Q_{2}$ which does so, or, if both do so, we select the left-hand half. Proceeding in this way we can define a sequence of intervals

$$PQ,\quad P_{1}Q_{1},\quad P_{2}Q_{2},\quad P_{3}Q_{3},\ \dots,$$

each of which is a half of its predecessor, and each of which contains infinitely many points of $S$.

The points $P$, $P_{1}$, $P_{2}$, … progress steadily from left to right, and so $P_{n}$ tends to a limiting position $T$. Similarly $Q_{n}$ tends to a limiting position $T'$. But $TT'$ is plainly less than $P_{n}Q_{n}$, whatever the value of $n$; and $P_{n}Q_{n}$, being equal to $PQ/2^{n}$, tends to zero. Hence $T'$ coincides with $T$, and $P_{n}$ and $Q_{n}$ both tend to $T$.

Then $T$ is a point of accumulation of $S$. For suppose that $\xi$ is its coordinate, and consider any interval of the type $[\xi - \epsilon, \xi + \epsilon]$. If $n$ is sufficiently large, $P_{n}Q_{n}$ will lie entirely inside this interval. Hence $[\xi - \epsilon, \xi + \epsilon]$ contains infinitely many points of $S$.
''',
  'ch4-t10': r'''
Let us apply the results of § 69 to the particularly important case in which $\phi(n) = x^{n}$. If $x = 1$ then $\phi(n) = 1$, $\lim\phi(n) = 1$, and if $x = 0$ then $\phi(n) = 0$, $\lim \phi(n) = 0$, so that these special cases need not detain us.

First, suppose $x$ positive. Then, since $\phi(n + 1) = x\phi(n)$, $\phi(n)$ increases with $n$ if $x > 1$, decreases as $n$ increases if $x < 1$.

If $x > 1$, then $x^{n}$ must tend either to a limit (which must obviously be greater than $1$) or to $+\infty$. Suppose it tends to a limit $l$. Then $\lim\phi(n + 1) = \lim\phi(n) = l$, by Exs. xxv. 7; but

$$\lim\phi(n + 1) = \lim x\phi(n) = x\lim\phi(n) = xl,$$

and therefore $l = xl$: and as $x$ and $l$ are both greater than $1$, this is impossible. Hence

$$x^{n} \to +\infty\quad (x > 1).$$

*Example.* The reader may give an alternative proof, showing by the binomial theorem that $x^{n} > 1 + n\delta$ if $\delta$ is positive and $x = 1 + \delta$, and so that

$$x^{n} \to +\infty.$$

On the other hand $x^{n}$ is a decreasing function if $x < 1$, and must therefore tend to a limit or to $-\infty$. Since $x^{n}$ is positive the second alternative may be ignored. Thus $\lim x^{n} = l$, say, and as above $l = xl$, so that $l$ must be zero. Hence

$$\lim x^{n} = 0\quad (0 < x < 1).$$

*Example.* Prove as in the preceding example that $(1/x)^{n}$ tends to $+\infty$ if $0 < x < 1$, and deduce that $x^{n}$ tends to $0$.
''',
  'ch4-t11': r'''
A more difficult problem which can be solved by the help of § 69 arises when $\phi(n) = \{1 + 1/n\}^{n}$.

It follows from the binomial theorem that

$$\begin{array}{c}\displaystyle \begin{aligned} \biggl(1 + \frac{1}{n}\biggr)^{n} &= 1 + n \cdot \frac{1}{n} + \frac{n(n - 1)}{1\cdot 2}\, \frac{1}{n^{2}} + \dots + \frac{n(n - 1)\dots (n - n + 1)}{1\cdot 2\dots n}\, \frac{1}{n^{n}}\\ \displaystyle &= 1 + 1 + \frac{1}{1\cdot 2} \biggl(1 - \frac{1}{n}\biggr) + \frac{1}{1\cdot 2\cdot 3} \biggl(1 - \frac{1}{n}\biggr) \biggl(1- \frac{2}{n}\biggr) + \dots\\ \displaystyle \end{aligned} \\ \displaystyle + \frac{1}{1\cdot 2\dots n} \biggl(1 - \frac{1}{n}\biggr) \biggl(1 - \frac{2}{n}\biggr)\dots \biggl(1 - \frac{n - 1}{n}\biggr). \end{array}$$

The $(p + 1)$th term in this expression, viz.

$$\frac{1}{1\cdot 2\dots p} \left(1 - \frac{1}{n}\right) \left(1 - \frac{2}{n}\right)\dots \left(1 - \frac{p - 1}{n}\right),$$

is positive and an increasing function of $n$, and the number of terms also increases with $n$. Hence $\left(1 + \dfrac{1}{n}\right)^{n}$ increases with $n$, and so tends to a limit or to $+\infty$, as $n \to \infty$.

But

$$\begin{aligned} \left(1 + \frac{1}{n}\right)^{n} &< 1 + 1 + \frac{1}{1\cdot 2} + \frac{1}{1\cdot 2\cdot 3} + \dots + \frac{1}{1\cdot 2\cdot 3 \dots n}\\ &< 1 + 1 + \frac{1}{2} + \frac{1}{2^{2}} + \dots + \frac{1}{2^{n-1}} < 3. \end{aligned}$$

Thus $\left(1 + \dfrac{1}{n}\right)^{n}$ cannot tend to $+\infty$, and so

$$\lim_{n \to\infty} \left(1 + \frac{1}{n}\right)^{n} = e,$$

where $e$ is a number such that $2 < e \leqq 3$.
''',
  'ch4-t12': r'''
It will be convenient to prove at this stage a number of elementary inequalities which will be useful to us later on.

(i) It is evident that if $\alpha > 1$ and $r$ is a positive integer then

$$r\alpha^{r} > \alpha^{r-1} + \alpha^{r-2} + \dots + 1.$$

Multiplying both sides of this inequality by $\alpha - 1$, we obtain

$$r\alpha^{r}(\alpha - 1) > \alpha^{r} - 1;$$

and adding $r(\alpha^{r} - 1)$ to each side, and dividing by $r(r + 1)$, we obtain

$$\frac{\alpha^{r+1} - 1}{r + 1} > \frac{\alpha^{r} - 1}{r}\quad (\alpha > 1). \qquad\text{(1)}$$

Similarly we can prove that

$$\frac{1 - \beta^{r+1}}{r + 1} < \frac{1 - \beta^{r}}{r}\quad (0 < \beta < 1). \qquad\text{(2)}$$

It follows that if $r$ and $s$ are positive integers, and $r > s$, then

$$\frac{\alpha^{r} - 1}{r} > \frac{a^{s} - 1}{s},\quad \frac{1 - \beta^{r}}{r} < \frac{1 - \beta^{s}}{s}. \qquad\text{(3)}$$

Here $0 < \beta < 1 < \alpha$. In particular, when $s = 1$, we have

$$\alpha^{r} - 1 > r(\alpha - 1),\quad 1 - \beta^{r} < r(1 - \beta). \qquad\text{(4)}$$

(ii) The inequalities (3) and (4) have been proved on the supposition that $r$ and $s$ are positive integers. But it is easy to see that they hold under the more general hypothesis that $r$ and $s$ are any positive rational numbers. Let us consider, for example, the first of the inequalities (3). Let $r = a/b$, $s = c/d$, where $a$, $b$, $c$, $d$ are positive integers; so that $ad > bc$. If we put $\alpha = \gamma^{bd}$, the inequality takes the form

$$(\gamma^{ad} - 1)/ad > (\gamma^{bc} - 1)/bc;$$

and this we have proved already. The same argument applies to the remaining inequalities; and it can evidently be proved in a similar manner that

$$\alpha^{s} - 1 < s(\alpha - 1),\quad 1 - \beta^{s} > s(1 - \beta), \qquad\text{(5)}$$

if $s$ is a positive rational number less than $1$.
''',
  'ch4-t13': r'''
If in the first inequality (3) of § 74 we put $r = 1/(n - 1)$, $s = 1/n$, we see that

$$(n - 1)(\sqrt[n-1]{\alpha} - 1) > n(\sqrt[n]{\alpha} - 1)$$

when $\alpha > 1$. Thus if $\phi(n) = n(\sqrt[n]{\alpha} - 1)$ then $\phi(n)$ decreases steadily as $n$ increases. Also $\phi(n)$ is always positive. Hence $\phi(n)$ tends to a limit $l$ as $n \to \infty$, and $l \geqq 0$.

Again if, in the first inequality (7) of § 74, we put $s = 1/n$, we obtain

$$n(\sqrt[n]{\alpha} - 1) > \sqrt[n]{\alpha}\left(1 - \frac{1}{\alpha}\right) > 1 - \frac{1}{\alpha}.$$

Thus $l \geqq 1 - (1/\alpha) > 0$. Hence, if $\alpha > 1$, we have

$$\lim_{n \to \infty} n(\sqrt[n]{\alpha} - 1) = f(\alpha),$$

where $f(\alpha) > 0$.

Next suppose $\beta < 1$, and let $\beta = 1/\alpha$; then $n(\sqrt[n]{\beta} - 1) = -n(\sqrt{\alpha} - 1)/\sqrt[n]{\alpha}$. Now $n(\sqrt[n]{\alpha} - 1) \to f(\alpha)$, and (Exs. xxvii. 10)

$$\sqrt[n]{\alpha} \to 1.$$

Hence, if $\beta = 1/\alpha < 1$, we have

$$n(\sqrt[n]{\beta} - 1) \to -f(\alpha).$$

Finally, if $x = 1$, then $n(\sqrt[n]{x} - 1) = 0$ for all values of $n$.

Thus we arrive at the result: the limit

$$\lim n(\sqrt[n]{x} - 1)$$

defines a function of $x$ for all positive values of $x$. This function $f(x)$ possesses the properties

$$f(1/x) = -f(x),\quad f(1) = 0,$$

and is positive or negative according as $x > 1$ or $x < 1$. Later on we shall be able to identify this function with the *Napierian logarithm* of $x$.
''',
  'ch4-t14': r'''
Suppose that $u(n)$ is any function of $n$ defined for all values of $n$. If we add up the values of $u(\nu)$ for $\nu = 1$, $2$, … $n$, we obtain another function of $n$, viz.

$$s(n) = u(1) + u(2) + \dots + u(n),$$

also defined for all values of $n$. It is generally most convenient to alter our notation slightly and write this equation in the form

$$s_{n} = u_{1} + u_{2} + \dots + u_{n},$$

or, more shortly,

$$s_{n} = \sum_{\nu=1}^{n} u_{\nu}.$$

If now we suppose that $s_{n}$ tends to a limit $s$ when $n$ tends to $\infty$, we have

$$\lim_{n\to\infty} \sum_{\nu=1}^{n} u_{\nu} = s.$$

This equation is usually written in one of the forms

$$\sum_{\nu=1}^{\infty} u_{\nu} = s,\quad u_{1} + u_{2} + u_{3} + \dots = s,$$

the dots denoting the indefinite continuance of the series of $u$’s.

The meaning of the above equations, expressed roughly, is that by adding more and more of the $u$’s together we get nearer and nearer to the limit $s$. More precisely, if any small positive number $\epsilon$ is chosen, we can choose $n_{0}(\epsilon)$ so that the sum of the first $n_{0}(\epsilon)$ terms, or any of greater number of terms, lies between $s - \epsilon$ and $s + \epsilon$; or in symbols

$$s - \epsilon < s_{n} < s + \epsilon,$$

if $n \geqq n_{0}(\epsilon)$. In these circumstances we shall call the series

$$u_{1} + u_{2} + \dots$$

a **convergent infinite series**, and we shall call $s$ the *sum* of the series, or the *sum of all the terms* of the series.

Thus to say that the series $u_{1} + u_{2} + \dots$ *converges and has the sum $s$*, or *converges to the sum $s$* or simply *converges to $s$*, is merely another way of stating that the sum $s_{n} = u_{1} + u_{2} + \dots + u_{n}$ of the first $n$ terms tends to the limit $s$ as $n \to \infty$, and the consideration of such infinite series introduces no new ideas beyond those with which the early part of this chapter should already have made the reader familiar. In fact the sum $s_{n}$ is merely a function $\phi(n)$, such as we have been considering, expressed in a particular form. Any function $\phi(n)$ may be expressed in this form, by writing

$$\phi(n) = \phi(1) + \{\phi(2) - \phi(1)\} + \dots + \{\phi(n) - \phi(n - 1)\};$$

and it is sometimes convenient to say that $\phi(n)$ *converges* (instead of ‘tends’) to the limit $l$, say, as $n \to \infty$.
''',
  'ch4-t15': r'''
We shall now consider the ‘geometrical’ series, whose general term is $u_{n} = r^{n-1}$. In this case

$$s_{n} = 1 + r + r^{2} + \dots + r^{n-1} = (1 - r^{n})/(1 - r),$$

except in the special case in which $r = 1$, when

$$s_{n} = 1 + 1 + \dots + 1 = n.$$

In the last case $s_{n} \to +\infty$. In the general case $s_{n}$ will tend to a limit if and only if $r^{n}$ does so. Referring to the results of § 72 we see that the series $1 + r + r^{2} + \dots$ is convergent and has the sum $1/(1 - r)$ if and only if $-1 < r < 1$.

If $r \geqq 1$, then $s_{n} \geqq n$, and so $s_{n} \to +\infty$; *i.e.* the series diverges to $+\infty$. If $r = -1$, then $s_{n} = 1$ or $s_{n} = 0$ according as $n$ is odd or even: *i.e.* $s_{n}$ oscillates finitely. If $r < -1$, then $s_{n}$ oscillates infinitely. Thus, to sum up, the series $1 + r + r^{2} + \dots$ diverges to $+\infty$ if $r \geqq 1$, converges to $1/(1 - r)$ if $-1 < r < 1$, oscillates finitely if $r = -1$, and oscillates infinitely if $r < -1$.
''',
  'ch4-t16': r'''
In the preceding sections we have frequently been concerned with limits such as

$$\lim_{n \to \infty} \phi_{n}(x),$$

and series such as

$$u_{1}(x) + u_{2}(x) + \dots = \lim_{n \to \infty}\{u_{1}(x) + u_{2}(x) + \dots + u_{n}(x)\},$$

in which the function of $n$ whose limit we are seeking involves, besides $n$, another variable $x$. In such cases the limit is of course a function of $x$. Thus in § 75 we encountered the function

$$f(x) = \lim_{n \to \infty} n(\sqrt[n]{x} - 1):$$

and the sum of the geometrical series $1 + x + x^{2} + \dots$ is a function of $x$, viz. the function which is equal to $1/(1 - x)$ if $-1 < x < 1$ and is undefined for all other values of $x$.

Many of the apparently ‘arbitrary’ or ‘unnatural’ functions considered in Ch. II are capable of a simple representation of this kind, as will appear from the following examples.
''',
  'ch4-t17': r'''
Let $S$ be any system or aggregate of real numbers $s$. If there is a number $K$ such that $s \leqq K$ for every $s$ of $S$, we say that $S$ is *bounded above*. If there is a number $k$ such that $s \geqq k$ for every $s$, we say that $S$ is *bounded below*. If $S$ is both bounded above and bounded below, we say simply that $S$ is *bounded*.

Suppose first that $S$ is bounded above (but not necessarily below). There will be an infinity of numbers which possess the property possessed by $K$; any number greater than $K$, for example, possesses it. We shall prove that *among these numbers there is a least*, which we shall call $M$. This number $M$ is not exceeded by any member of $S$, but every number less than $M$ is exceeded by at least one member of $S$.

We divide the real numbers $\xi$ into two classes $L$ and $R$, putting $\xi$ into $L$ or $R$ according as it is or is not exceeded by members of $S$. Then every $\xi$ belongs to one and one only of the classes $L$ and $R$. Each class exists; for any number less than any member of $S$ belongs to $L$, while $K$ belongs to $R$. Finally, any member of $L$ is less than some member of $S$, and therefore less than any member of $R$. Thus the three conditions of Dedekind’s Theorem (§ 17) are satisfied, and there is a number $M$ dividing the classes.

The number $M$ is the number whose existence we had to prove. In the first place, $M$ cannot be exceeded by any member of $S$. For if there were such a member $s$ of $S$, we could write $s = M + \eta$, where $\eta$ is positive. The number $M + \frac{1}{2}\eta$ would then belong to $L$, because it is less than $s$, and to $R$, because it is greater than $M$; and this is impossible. On the other hand, any number less than $M$ belongs to $L$, and is therefore exceeded by at least one member of $S$. Thus $M$ has all the properties required.
''',
  'ch4-t18': r'''
Suppose that $\phi(n)$ is a function of the positive integral variable $n$. The aggregate of all the values $\phi(n)$ defines a set $S$, to which we may apply all the arguments of § 80. If $S$ is bounded above, or bounded below, or bounded, we say that $\phi(n)$ is bounded above, or bounded below, or bounded. If $\phi(n)$ is bounded above, that is to say if there is a number $K$ such that $\phi(n) \leqq K$ for all values of $n$, then there is a number $M$ such that (i) *$\phi(n) \leqq M$ for all values of $n$*;

(ii) *if $\epsilon$ is any positive number then $\phi(n) > M - \epsilon$ for at least one value of $n$.* This number $M$ we call the **upper bound** of $\phi(n)$. Similarly, if $\phi(n)$ is bounded below, that is to say if there is a number $k$ such that $\phi(n) \leqq k$ for all values of $n$, then there is a number $m$ such that (i) *$\phi(n) \geqq m$ for all values of $n$*;

(ii) *if $\epsilon$ is any positive number then $\phi(n) < m + \epsilon$ for at least one value of $n$.* This number $m$ we call the **lower bound** of $\phi(n)$.
''',
  'ch4-t19': r'''
Suppose that $\phi(n)$ is a bounded function, and $M$ and $m$ its upper and lower bounds. Let us take any real number $\xi$, and consider now the relations of inequality which may hold between $\xi$ and the values assumed by $\phi(n)$ for *large* values of $n$. There are three mutually exclusive possibilities:

(1) $\xi \geqq \phi(n)$ for all sufficiently large values of $n$;

(2) $\xi \leqq \phi(n)$ for all sufficiently large values of $n$;

(3) $\xi < \phi(n)$ for an infinity of values of $n$, and also $\xi > \phi(n)$ for an infinity of values of $n$.

In case (1) we shall say that $\xi$ is a *superior* number, in case (2) that it is an *inferior* number, and in case (3) that it is an *intermediate* number. It is plain that no superior number can be less than $m$, and no inferior number greater than $M$.

Let us consider the aggregate of all superior numbers. It is bounded below, since none of its members are less than $m$, and has therefore a lower bound, which we shall denote by $\Lambda$. Similarly the aggregate of inferior numbers has an upper bound, which we denote by $\lambda$.

We call $\Lambda$ and $\lambda$ respectively the *upper and lower limits of indetermination of $\phi(n)$ as $n$ tends to infinity*; and write

$$\Lambda = \limsup \phi(n),\quad \lambda = \liminf \phi(n).$$

These numbers have the following properties:

(1) $m \leqq \lambda \leqq \Lambda \leqq M$;

(2) $\Lambda$ and $\lambda$ are the upper and lower bounds of the aggregate of intermediate numbers, if any such exist;

(3) if $\epsilon$ is any positive number, then $\phi(n) < \Lambda + \epsilon$ for all sufficiently large values of $n$, and $\phi(n) > \Lambda - \epsilon$ for an infinity of values of $n$;

(4) similarly $\phi(n) > \lambda - \epsilon$ for all sufficiently large values of $n$, and $\phi(n) < \lambda + \epsilon$ for an infinity of values of $n$;

(5) the necessary and sufficient condition that $\phi(n)$ should tend to a limit is that $\Lambda = \lambda$, and in this case the limit is $l$, the common value of $\lambda$ and $\Lambda$.
''',
  'ch4-t20': r'''
The results of the preceding sections enable us to formulate a very important necessary and sufficient condition that a bounded function $\phi(n)$ should tend to a limit, a condition usually referred to as *the general principle of convergence* to a limit.

**Theorem 1..** The necessary and sufficient condition that a bounded function $\phi(n)$ should tend to a limit is that, when any positive number $\epsilon$ is given, it should be possible to find a number $n_{0}(\epsilon)$ such that

$$|\phi(n_{2}) - \phi(n_{1})| < \epsilon$$

for all values of $n_{1}$ and $n_{2}$ such that $n_{2} > n_{1} \geqq n_{0}(\epsilon)$.

In the first place, the condition is *necessary*. For if $\phi(n) \to l$ then we can find $n_{0}$ so that

$$l - \tfrac{1}{2}\epsilon < \phi(n) < l + \tfrac{1}{2}\epsilon$$

when $n \geqq n_{0}$, and so

$$|\phi(n_{2}) - \phi(n_{1})| < \epsilon \qquad\text{(1)}$$

when $n_{1} \geqq n_{0}$ and $n_{2} \geqq n_{0}$.

In the second place, the condition is *sufficient*. In order to prove this we have only to show that it involves $\lambda = \Lambda$. But if $\lambda < \Lambda$ then there are, however small $\epsilon$ may be, infinitely many values of $n$ such that $\phi(n) < \lambda + \epsilon$ and infinitely many such that $\phi(n) > \Lambda - \epsilon$; and therefore we can find values of $n_{1}$ and $n_{2}$, each greater than any assigned number $n_{0}$, and such that

$$\phi(n_{2}) - \phi(n_{1}) > \Lambda - \lambda - 2\epsilon,$$

which is greater than $\frac{1}{2}(\Lambda - \lambda)$ if $\epsilon$ is small enough. This plainly contradicts the inequality (1). Hence $\lambda = \Lambda$, and so $\phi(n)$ tends to a limit.

**84. Unbounded functions.**

So far we have restricted ourselves to bounded functions; but the ‘general principle of convergence’ is the same for unbounded as for bounded functions, and the words ‘*a bounded function*’ may be omitted from the enunciation of Theorem 1.

In the first place, if $\phi(n)$ tends to a limit $l$ then it is certainly bounded; for all but a finite number of its values are less than $l + \epsilon$ and greater than $l - \epsilon$.
''',
  'ch4-t21': r'''
In this chapter we have, up to the present, concerned ourselves only with real functions of $n$ and series all of whose terms are real. There is however no difficulty in extending our ideas and definitions to the case in which the functions or the terms of the series are complex.

Suppose that $\phi(n)$ is complex and equal to

$$\rho(n) + i\sigma(n),$$

where $\rho(n)$, $\sigma(n)$ are real functions of $n$. Then *if $\rho(n)$ and $\sigma(n)$ converge respectively to limits $r$ and $s$ as $n \to \infty$, we shall say that $\phi(n)$ converges to the limit $l = r + is$, and write*

$$\lim\phi(n) = l.$$

Similarly, when $u_{n}$ is complex and equal to $v_{n} + iw_{n}$, we shall say that the series

$$u_{1} + u_{2} + u_{3} + \dots$$

is convergent and has the sum $l = r + is$, if the series

$$v_{1} + v_{2} + v_{3} + \dots,\quad w_{1} + w_{2} + w_{3} + \dots$$

are convergent and have the sums $r$, $s$ respectively.

To say that $u_{1} + u_{2} + u_{3} + \dots$ is convergent and has the sum $l$ is of course the same as to say that the sum

$$s_{n} = u_{1} + u_{2} + \dots + u_{n} = (v_{1} + v_{2} + \dots + v_{n}) + i(w_{1} + w_{2} + \dots + w_{n})$$

converges to the limit $l$ as $n \to \infty$.

In the case of real functions and series we also gave definitions of *divergence* and *oscillation*, *finite* or *infinite*. But in the case of complex functions and series, where we have to consider the behaviour both of $\rho(n)$ and of $\sigma(n)$, there are so many possibilities that this is hardly worth while. When it is necessary to make further distinctions of this kind, we shall make them by stating the way in which the real or imaginary parts behave when taken separately.

**86.**

The reader will find no difficulty in proving such theorems as the following, which are obvious extensions of theorems already proved for real functions and series.
''',
  'ch4-t22': r'''
Let us consider the important case in which $\phi(n) = z^{n}$. This problem has already been discussed for real values of $z$ in § 72.

If $z^{n} \to l$ then $z^{n+1} \to l$, by (1) of § 86. But, by (4) of § 86,

$$z^{n+1} = zz^{n} \to zl,$$

and therefore $l = zl$, which is only possible if (*a*) $l = 0$ or (*b*) $z = 1$. If $z = 1$ then $\lim z^{n} = 1$. Apart from this special case the limit, if it exists, can only be zero.

Now if $z = r(\cos\theta + i\sin\theta)$, where $r$ is positive, then

$$z^{n} = r^{n} (\cos n\theta + i\sin n\theta),$$

so that $|z^{n}| = r^{n}$. Thus $|z^{n}|$ tends to zero if and only if $r < 1$; and it follows from (10) of § 86 that

$$\lim z^{n} = 0$$

if and only if $r < 1$. In no other case does $z^{n}$ converge to a limit, except when $z = 1$ and $z^n \to 1$.

**88. The geometric series $1 + z + z^{2} + \dots$ when $z$ is complex.**

Since

$$s_{n} = 1 + z + z^{2} + \dots + z^{n-1} = (1 - z^{n})/(1 - z),$$

unless $z = 1$, when the value of $s_{n}$ is $n$, it follows that *the series $1 + z + z^{2} + \dots$ is convergent if and only if $r = |z| < 1$. And its sum when convergent is $1/(1 - z)$*.

Thus if $z = r(\cos\theta + i\sin\theta) = r{\operatorname{Cis}}\theta$, and $r < 1$, we have

$$\begin{aligned} 1 + z + z^{2} + \dots &= 1/(1 - r{\operatorname{Cis}}\theta), \\ \text{or} \\ 1 + r {\operatorname{Cis}}\theta + r^{2} {\operatorname{Cis}} 2\theta + \dots &= 1/(1 - r{\operatorname{Cis}}\theta)\\ &= (1 - r\cos\theta + ir\sin\theta)/(1 - 2r\cos\theta + r^{2}). \end{aligned}$$

Separating the real and imaginary parts, we obtain

$$\begin{aligned} 1 + r\cos\theta + r^{2}\cos 2\theta + \dots &= (1 - r\cos\theta)/(1 - 2r\cos\theta + r^{2}),\\ r\sin\theta + r^{2}\sin 2\theta + \dots &= r\sin\theta/(1 - 2r\cos\theta + r^{2}), \end{aligned}$$

provided $r < 1$. If we change $\theta$ into $\theta + \pi$, we see that these results hold also for negative values of $r$ numerically less than $1$. Thus they hold when $-1 < r < 1$.
''',
  'ch5-t1': r'''
We shall now return to functions of a continuous real variable. We shall confine ourselves entirely to *one-valued* functions, and we shall denote such a function by $\phi(x)$. We suppose $x$ to assume successively all values corresponding to points on our fundamental straight line $\Lambda$, starting from some definite point on the line and progressing always to the right. In these circumstances we say that *$x$ tends to infinity*, or *to $\infty$*, and write $x \to \infty$. The only difference between the ‘tending of $n$ to $\infty$’ discussed in the last chapter, and this ‘tending of $x$ to $\infty$’, is that $x$ assumes all values as it tends to $\infty$, *i.e.* that the point $P$ which corresponds to $x$ coincides in turn with every point of $\Lambda$ to the right of its initial position, whereas $n$ tended to $\infty$ by a series of jumps. We can express this distinction by saying that $x$ tends *continuously* to $\infty$.

As we explained at the beginning of the last chapter, there is a very close correspondence between functions of $x$ and functions of $n$. Every function of $n$ may be regarded as a selection from the values of a function of $x$. In the last chapter we discussed the peculiarities which may characterise the behaviour of a function $\phi(n)$ as $n$ tends to $\infty$. Now we are concerned with the same problem for a function $\phi(x)$; and the definitions and theorems to which we are led are practically repetitions of those of the last chapter. Thus corresponding to Def. 1 of § 58 we have:

**Definition 1..** The function $\phi(x)$ is said to tend to the limit $l$ as $x$ tends to $\infty$ if, when any positive number $\epsilon$, however small, is assigned, a number $x_{0}(\epsilon)$ can be chosen such that, for all values of $x$ equal to or greater than $x_{0}(\epsilon)$, $\phi(x)$ differs from $l$ by less than $\epsilon$, *i.e.* if

$$|\phi(x) - l| < \epsilon$$

when $x \geqq x_{0}(\epsilon)$.
''',
  'ch5-t2': r'''
Let $\phi(x)$ be such a function of $x$ that $\lim\limits_{x \to \infty} \phi(x) = l$, and let $y = 1/x$. Then

$$\phi(x) = \phi(1/y) = \psi(y),$$

say. As $x$ tends to $\infty$, $y$ tends to the limit $0$, and $\psi(y)$ tends to the limit $l$.

Let us now dismiss $x$ and consider $\psi(y)$ simply as a function of $y$. We are for the moment concerned only with those values of $y$ which correspond to large positive values of $x$, that is to say with small positive values of $y$. And $\psi(y)$ has the property that by making $y$ sufficiently small we can make $\psi(y)$ differ by as little as we please from $l$. To put the matter more precisely, the statement expressed by $\lim\phi(x) = l$ means that, when any positive number $\epsilon$, however small, is assigned, we can choose $x_{0}$ so that $|\phi(x) - l| < \epsilon$ for all values of $x$ greater than or equal to $x_{0}$. But this is the same thing as saying that we can choose $y_{0} = 1/x_{0}$ so that $|\psi(y) - l| < \epsilon$ for all positive values of $y$ less than or equal to $y_{0}$.

We are thus led to the following definitions:

A. If, when any positive number $\epsilon$, however small, is assigned, we can choose $y_{0}(\epsilon)$ so that

$$|\phi(y) - l| < \epsilon$$

when $0 < y \leqq y_{0}(\epsilon)$, then we say that $\phi(y)$ tends to the limit $l$ as $y$ tends to $0$ by positive values, and we write

$$\lim_{y \to +0} \phi(y) = l.$$

B. If, when any number $\Delta$, however large, is assigned, we can choose $y_{0}(\Delta)$ so that

$$\phi(y) > \Delta$$

when $0 < y \leqq y_{0}(\Delta)$, then we say that $\phi(y)$ tends to $\infty$ as $y$ tends to $0$ by positive values, and we write

$$\phi(y) \to \infty.$$

We define in a similar way the meaning of ‘$\phi(y)$ tends to the limit $l$ as $y$ tends to $0$ by negative values’, or ‘$\lim\phi(y) = l$ when $y \to -0$’. We have in fact only to alter $0 < y \leqq y_{0}(\epsilon)$ to $-y_{0}(\epsilon) \leqq y < 0$ in definition A\@. There is of course a corresponding analogue of definition B, and similar definitions in which

$$\phi(y) \to -\infty$$

as $y \to +0$ or $y \to -0$.
''',
  'ch5-t3': r'''
The reader has no doubt some idea as to what is meant by a *continuous curve*. Thus he would call the curve $C$ in Fig. 29 continuous, the curve $C'$ generally continuous but discontinuous for $x = \xi'$ and $x = \xi''$.

Either of these curves may be regarded as the graph of a function $\phi(x)$. It is natural to call a function *continuous* if its graph is a continuous curve, and otherwise discontinuous. Let us take this as a provisional definition and try to distinguish more precisely some of the properties which are involved in it.

In the first place it is evident that the property of the function $y = \phi(x)$ of which $C$ is the graph may be analysed into some property possessed by the curve at each of its points. To be able to define continuity *for all values of $x$* we must first define continuity *for any particular value of $x$*. Let us therefore fix on some particular value of $x$, say the value $x = \xi$ corresponding to the point $P$ of the graph. What are the characteristic properties of $\phi(x)$ associated with this value of $x$?

In the first place *$\phi(x)$ is defined for $x = \xi$*. This is obviously essential. If $\phi(\xi)$ were not defined there would be a point missing from the curve.

Secondly *$\phi(x)$ is defined for all values of $x$ near $x = \xi$*; *i.e.* we can find an interval, including $x = \xi$ in its interior, for all points of which $\phi(x)$ is defined.

Thirdly *if $x$ approaches the value $\xi$ from either side then $\phi(x)$ approaches the limit $\phi(\xi)$*.

The properties thus defined are far from exhausting those which are possessed by the curve as pictured by the eye of common sense. This picture of a curve is a generalisation from particular curves such as straight lines and circles. But they are the simplest and most fundamental properties: and the graph of any function which has these properties would, so far as drawing it is practically possible, satisfy our geometrical feeling of what a continuous curve should be. We therefore select these properties as embodying the mathematical notion of continuity. We are thus led to the following

**Definition.** The function $\phi(x)$ is said to be continuous for $x = \xi$ if it tends to a limit as $x$ tends to $\xi$ from either side, and each of these limits is equal to $\phi(\xi)$.
''',
  'ch5-t4': r'''
It may perhaps be thought that the analysis of the idea of a continuous curve given in § 98 is not the simplest or most natural possible. Another method of analysing our idea of continuity is the following. Let $A$ and $B$ be two points on the graph of $\phi(x)$ whose coordinates are $x_{0}$, $\phi(x_{0})$ and $x_{1}$, $\phi(x_{1})$ respectively. Draw any straight line $\lambda$ which passes between $A$ and $B$. Then common sense certainly declares that if the graph of $\phi(x)$ is continuous it must cut $\lambda$.

If we consider this property as an intrinsic geometrical property of continuous curves it is clear that there is no real loss of generality in supposing $\lambda$ to be parallel to the axis of $x$. In this case the ordinates of $A$ and $B$ cannot be equal: let us suppose, for definiteness, that $\phi(x_{1}) > \phi(x_{0})$. And let $\lambda$ be the line $y = \eta$, where $\phi(x_{0}) < \eta < \phi(x_{1})$. Then to say that the graph of $\phi(x)$ must cut $\lambda$ is the same thing as to say that there is a value of $x$ between $x_{0}$ and $x_{1}$ for which $\phi(x) = \eta$.

We conclude then that a continuous function $\phi(x)$ must possess the following property: if

$$\phi(x_{0}) = y_{0},\quad \phi(x_{1}) = y_{1},$$

and $y_{0} < \eta < y_{1}$, then there is a value of $x$ between $x_{0}$ and $x_{1}$ for which $\phi(x) = \eta$. In other words *as $x$ varies from $x_{0}$ to $x_{1}$, $y$ must assume at least once every value between $y_{0}$ and $y_{1}$*.

We shall now prove that if $\phi(x)$ is a continuous function of $x$ in the sense defined in § 98 then it does in fact possess this property. There is a certain range of values of $x$, to the right of $x_{0}$, for which $\phi(x) < \eta$. For $\phi(x_{0}) < \eta$, and so $\phi(x)$ is certainly less than $\eta$ if $\phi(x) - \phi(x_{0})$ is numerically less than $\eta - \phi(x_{0})$. But since $\phi(x)$ is continuous for $x = x_{0}$, this condition is certainly satisfied if $x$ is near enough to $x_{0}$. Similarly there is a certain range of values, to the left of $x_{1}$, for which $\phi(x) > \eta$.
''',
  'ch5-t5': r'''
We shall now proceed to prove some theorems concerning the oscillation of a function which are of a somewhat abstract character but of very great importance, particularly, as we shall see later, in the theory of integration. These theorems depend upon a general theorem concerning intervals on a line.

Suppose that we are given a *set of intervals* in a straight line, that is to say an aggregate each of whose members is an interval $[\alpha, \beta]$. We make no restriction as to the nature of these intervals; they may be finite or infinite in number; they may or may not overlap; and any number of them may be included in others.

It is worth while in passing to give a few examples of sets of intervals to which we shall have occasion to return later.

(i) If the interval $[0, 1]$ is divided into $n$ equal parts then the $n$ intervals thus formed define a finite set of non-overlapping intervals which just cover up the line.

(ii) We take every point $\xi$ of the interval $[0, 1]$, and associate with $\xi$ the interval $[\xi - \delta, \xi + \delta]$, where $\delta$ is a positive number less than $1$, except that with $0$ we associate $[0, \delta]$ and with $1$ we associate $[1 - \delta, 1]$, and in general we reject any part of any interval which projects outside the interval $[0, 1]$. We thus define an infinite set of intervals, and it is obvious that many of them overlap with one another.

(iii) We take the rational points $p/q$ of the interval $[0, 1]$, and associate with $p/q$ the interval

$$\left[\frac{p}{q} - \frac{\delta}{q^{3}}, \frac{p}{q} + \frac{\delta}{q^{3}}\right],$$

where $\delta$ is positive and less than $1$. We regard $0$ as $0/1$ and $1$ as $1/1$: in these two cases we reject the part of the interval which lies outside $[0, 1]$. We obtain thus an infinite set of intervals, which plainly overlap with one another, since there are an infinity of rational points, other than $p/q$, in the interval associated with $p/q$.
''',
  'ch5-t6': r'''
The notions of continuity and discontinuity may be extended to functions of several independent variables (Ch. II, §§ 31 *et seq.*). Their application to such functions however, raises questions much more complicated and difficult than those which we have considered in this chapter. It would be impossible for us to discuss these questions in any detail here; but we shall, in the sequel, require to know what is meant by a continuous function of two variables, and we accordingly give the following definition. It is a straightforward generalisation of the last form of the definition of § 98.

The function $\phi(x, y)$ of the two variables $x$ and $y$ is said to be **continuous** for $x = \xi$, $y = \eta$ if, given any positive number $\epsilon$, however small, we can choose $\delta(\epsilon)$ so that

$$|\phi(x, y) - \phi(\xi, \eta) | < \epsilon$$

when $0 \leqq |x - \xi| \leqq \delta(\epsilon)$ and $0 \leqq |y - \eta| \leqq \delta(\epsilon)$; that is to say if we can draw a square, whose sides are parallel to the axes of coordinates and of length $2\delta(\epsilon)$, whose centre is the point $(\xi, \eta)$, and which is such that the value of $\phi(x, y)$ at any point inside it or on its boundary differs from $\phi(\xi, \eta)$ by less than $\epsilon$.

This definition of course presupposes that $\phi(x, y)$ is defined at all points of the square in question, and in particular at the point $(\xi, \eta)$. Another method of stating the definition is this: *$\phi(x, y)$ is continuous for $x = \xi$, $y = \eta$ if $\phi(x, y) \to \phi(\xi, \eta)$ when $x \to \xi$, $y \to \eta$ in any manner*. This statement is apparently simpler; but it contains phrases the precise meaning of which has not yet been explained and can only be explained by the help of inequalities like those which occur in our original statement.

It is easy to prove that the sums, the products, and in general the quotients of continuous functions of two variables are themselves continuous. A polynomial in two variables is continuous for all values of the variables; and the ordinary functions of $x$ and $y$ which occur in every-day analysis are *generally* continuous, *i.e.*\ are continuous except for pairs of values of $x$ and $y$ connected by special relations.
''',
  'ch5-t7': r'''
We have already, in Ch. II, met with the idea of an *implicit function*. Thus, if $x$ and $y$ are connected by the relation

$$y^{5} - xy - y - x = 0, \qquad\text{(1)}$$

then $y$ is an ‘implicit function’ of $x$.

But it is far from obvious that such an equation as this does really define a function $y$ of $x$, or several such functions. In Ch. II we were content to take this for granted. We are now in a position to consider whether the assumption we made then was justified.

We shall find the following terminology useful. Suppose that it is possible to surround a point $(a, b)$, as in § 107, with a square throughout which a certain condition is satisfied. We shall call such a square a *neighbourhood* of $(a, b)$, and say that the condition in question is satisfied *in the neighbourhood of $(a, b)$*, or *near $(a, b)$*, meaning by this simply that it is possible to find *some* square throughout which the condition is satisfied. It is obvious that similar language may be used when we are dealing with a single variable, the square being replaced by an interval on a line.

**Theorem.** If (i) $f(x, y)$ is a continuous function of $x$ and $y$ in the neighbourhood of $(a, b)$, (ii) $f(a, b) = 0$, (iii) $f(x, y)$ is, for all values of $x$ in the neighbourhood of $a$, a steadily increasing function of $y$, in the stricter sense of § 95, then (1) there is a unique function $y = \phi(x)$ which, when substituted in the equation $f(x, y) = 0$, satisfies it identically for all values of $x$ in the neighbourhood of $a$, (2) $\phi(x)$ is continuous for all values of $x$ in the neighbourhood of $a$.

In the figure the square represents a ‘neighbourhood’ of $(a, b)$ throughout which the conditions (i) and (iii) are satisfied, and $P$ the point $(a, b)$. If we take $Q$ and $R$ as in the figure, it follows from (iii) that $f(x, y)$ is positive at $Q$ and negative at $R$. This being so, and $f(x, y)$ being continuous at $Q$ and at $R$, we can draw lines $QQ'$ and $RR'$ parallel to $OX$, so that $R'Q'$ is parallel to $OY$ and $f(x, y)$ is positive at all points of $QQ'$ and negative at all points of $RR'$. In particular $f(x, y)$ is positive at $Q'$ and negative at $R'$, and therefore, in virtue of (iii) and § 100, vanishes once and only once at a point $P'$ on $R'Q'$. The same construction gives us a unique point at which $f(x, y) = 0$ on each ordinate between $RQ$ and $R'Q'$. It is obvious, moreover, that the same construction can be carried out to the left of $RQ$. The aggregate of points such as $P'$ gives us the graph of the required function $y = \phi(x)$.
''',
  'ch6-t1': r'''
Let us return to the consideration of the properties which we naturally associate with the notion of a curve. The first and most obvious property is, as we saw in the last chapter, that which gives a curve its appearance of connectedness, and which we embodied in our definition of a continuous function.

The ordinary curves which occur in elementary geometry, such as straight lines, circles and conic sections, have of course many other properties of a general character. The simplest and most noteworthy of these is perhaps that they have a definite *direction* at every point, or what is the same thing, that at every point of the curve we can draw a *tangent* to it. The reader will probably remember that in elementary geometry the tangent to a curve at $P$ is defined to be ‘the limiting position of the chord $PQ$, when $Q$ moves up towards coincidence with $P$’. Let us consider what is implied in the assumption of the existence of such a limiting position.

In the figure (Fig. 36) $P$ is a fixed point on the curve, and $Q$ a variable point; $PM$, $QN$ are parallel to $OY$ and $PR$ to $OX$. We denote the coordinates of $P$ by $x$, $y$ and those of $Q$ by $x + h$, $y + k$: $h$ will be positive or negative according as $N$ lies to the right or left of $M$.

We have assumed that there is a tangent to the curve at $P$, or that there is a definite ‘limiting position’ of the chord $PQ$. Suppose that $PT$, the tangent at $P$, makes an angle $\psi$ with $OX$. Then to say that $PT$ is the limiting position of $PQ$ is equivalent to saying that the limit of the angle $QPR$ is $\psi$, when $Q$ approaches $P$ along the curve from either side. We have now to distinguish two cases, a general case and an exceptional one.
''',
  'ch6-t2': r'''
Throughout the theorems which follow we assume that the functions $f(x)$ and $F(x)$ have derivatives $f'(x)$ and $F'(x)$ for the values of $x$ considered.

(1) If $\phi(x) = f(x) + F(x)$, then $\phi(x)$ has a derivative

$$\phi'(x) = f'(x) + F'(x).$$

(2) If $\phi(x) = kf(x)$, where $k$ is a constant, then $\phi(x)$ has a derivative

$$\phi'(x) = kf'(x).$$

We leave it as an exercise to the reader to deduce these results from the general theorems stated in Ex. xxxv. 1.

(3) If $\phi(x) = f(x)F(x)$, then $\phi(x)$ has a derivative

$$\phi'(x) = f(x)F'(x) + f'(x)F(x).$$

For

$$\begin{aligned} \phi'(x) &= \lim\frac{f(x + h)F(x + h) - f(x)F(x)}{h}\\ &= \lim\left\{f(x + h)\frac{F(x + h) - F(x)}{h} + F(x)\frac{f(x + h) - f(x)}{h}\right\}\\ &=f(x)F'(x) + F(x)f'(x). \end{aligned}$$

(4) If $\phi(x) = \dfrac{1}{f(x)}$, then $\phi(x)$ has a derivative

$$\phi'(x) = -\frac{f'(x)}{\{f(x)\}^{2}}.$$

In this theorem we of course suppose that $f(x)$ is not equal to zero for the particular value of $x$ under consideration. Then

$$\phi'(x) = \lim \frac{1}{h} \left\{\frac{f(x) - f(x + h)}{f(x + h)f(x)}\right\} = -\frac{f'(x)}{\{f(x)\}^{2}}.$$

(5) If $\phi(x) = \dfrac{f(x)}{F(x)}$, then $\phi(x)$ has a derivative

$$\phi'(x) = \frac{f'(x)F(x) - f(x)F'(x)}{\{F(x)\}^{2}}.$$

This follows at once from (3) and (4).

(6) If $\phi(x) = F\{f(x)\}$, then $\phi(x)$ has a derivative

$$\phi'(x) = F'\{f(x)\} f'(x).$$

For let

$$f(x) = y,\quad f(x + h) = y + k.$$

Then $k \to 0$ as $h \to 0$, and $k/h \to f'(x)$. And

$$\begin{aligned} \phi'(x) & = \lim \frac{F\{f(x + h)\} - F\{f(x)\}}{h}\\ & = \lim \left\{\frac{F(y + k) - F(y)}{k}\right\} \times \lim \left(\frac{k}{h}\right)\\ & = F'(y)f'(x). \end{aligned}$$

This theorem includes (2) and (4) as special cases, as we see on taking $F(x) = kx$ or $F(x) = 1/x$. Another interesting special case is that in which $f(x) = ax + b$: the theorem then shows that the derivative of $F(ax + b)$ is $aF'(ax + b)$.

Our last theorem requires a few words of preliminary explanation. Suppose that $x = \psi(y)$, where $\psi(y)$ is continuous and steadily increasing (or decreasing), in the stricter sense of § 95, in a certain interval of values of $y$. Then we may write $y = \phi(x)$, where $\phi$ is the ‘inverse’ function (§ 109) of $\psi$.
''',
  'ch6-t3': r'''
So far we have supposed that $y = \phi(x)$ is a purely *real* function of $x$. If $y$ is a complex function $\phi(x) + i\psi(x)$, then we define the derivative of $y$ as being $\phi'(x) + i\psi'(x)$. The reader will have no difficulty in seeing that Theorems (1)–(5) above retain their validity when $\phi(x)$ is complex. Theorems (6) and (7) have also analogues for complex functions, but these depend upon the general notion of a ‘function of a complex variable’, a notion which we have encountered at present only in a few particular cases.
''',
  'ch6-t4': r'''
We have already explained that what we call a *derivative* is often called a *differential coefficient*. Not only a different name but a different notation is often used; the derivative of the function $y = \phi(x)$ is often denoted by one or other of the expressions

$$D_{x}y,\quad \frac{dy}{dx}.$$

Of these the last is the most usual and convenient: the reader must however be careful to remember that $dy/dx$ does not mean ‘a certain number $dy$ divided by another number $dx$’: it means ‘the result of a certain operation $D_{x}$ or $d/dx$ applied to $y = \phi(x)$’, the operation being that of forming the quotient $\{\phi(x + h) - \phi(x)\}/h$ and making $h \to 0$.

Of course a notation at first sight so peculiar would not have been adopted without some reason, and the reason was as follows. The denominator $h$ of the fraction $\{\phi(x + h) - \phi(x)\}/h$ is the difference of the values $x+h$, $x$ of the independent variable $x$; similarly the numerator is the difference of the corresponding values $\phi(x + h)$, $\phi(x)$ of the dependent variable $y$. These differences may be called the *increments* of $x$ and $y$ respectively, and denoted by $\delta x$ and $\delta y$. Then the fraction is $\delta y/\delta x$, and it is for many purposes convenient to denote the limit of the fraction, which is the same thing as $\phi'(x)$, by $dy/dx$. But this notation must for the present be regarded as purely symbolical. The $dy$ and $dx$ which occur in it cannot be separated, and standing by themselves they would mean nothing: in particular $dy$ and $dx$ do not mean $\lim\delta y$ and $\lim\delta x$, these limits being simply equal to zero. The reader will have to become familiar with this notation, but so long as it puzzles him he will be wise to avoid it by writing the differential coefficient in the form $D_{x}y$, or using the notation $\phi(x)$, $\phi'(x)$, as we have done in the preceding sections of this chapter.
''',
  'ch6-t5': r'''
We shall now investigate more systematically the forms of the derivatives of a few of the the simplest types of functions.

**A. Polynomials.** If $\phi(x) = a_{0}x^{n} + a_{1}x^{n-1} + \dots + a_{n}$, then

$$\phi'(x) = na_{0}x^{n-1} + (n - 1)a_{1}x^{n-2} + \dots + a_{n-1}.$$

It is sometimes more convenient to use for the standard form of a polynomial of degree $n$ in $x$ what is known as the *binomial form*, viz.
''',
  'ch6-t6': r'''
**B. Rational Functions.** If

$$R(x) = \frac{P(x)}{Q(x)},$$

where $P$ and $Q$ are polynomials, it follows at once from § 113, (5) that

$$R'(x) = \frac{P'(x)Q(x) - P(x)Q'(x)}{\{Q(x)\}^{2}},$$

and this formula enables us to write down the derivative of any rational function. The form in which we obtain it, however, may or may not be the simplest possible. It will be the simplest possible if $Q(x)$ and $Q'(x)$ have no common factor, *i.e.* if $Q(x)$ has no repeated factor. But if $Q(x)$ has a repeated factor then the expression which we obtain for $R'(x)$ will be capable of further reduction.

It is very often convenient, in differentiating a rational function, to employ the method of partial fractions. We shall suppose that $Q(x)$, as in § 116, is expressed in the form

$$a_{0}(x - \alpha_{1})^{m_{1}} (x - \alpha_{2})^{m_{2}}\dots (x - \alpha_{\nu})^{m_{\nu}}.$$

Then it is proved in treatises on Algebra that $R(x)$ can be expressed in the form

$$\begin{aligned} \Pi(x) &+ \frac{A_{1, 1}}{x - \alpha_{1}} + \frac{A_{1, 2}}{(x - \alpha_{1})^{2}} + \dots + \frac{A_{1, m_{1}}}{(x - \alpha_{1})^{m_{1}}}\\ &+ \frac{A_{2, 1}}{x - \alpha_{2}} + \frac{A_{2, 2}}{(x - \alpha_{2})^{2}} + \dots + \frac{A_{2, m_{2}}}{(x - \alpha_{2})^{m_{2}}} + \dots, \end{aligned}$$

where $\Pi(x)$ is a polynomial; *i.e.* as the sum of a polynomial and the sum of a number of terms of the type

$$\frac{A}{(x - \alpha)^{p}},$$

where $\alpha$ is a root of $Q(x) = 0$. We know already how to find the derivative of the polynomial: and it follows at once from Theorem (4) of § 113, or, if $\alpha$ is complex, from its extension indicated in § 114, that the derivative of the rational function last written is

$$-\frac{pA(x -\alpha)^{p-1}}{(x - \alpha)^{2p}} = -\frac{pA}{(x - \alpha)^{p+1}}.$$

We are now able to write down the derivative of the general rational function $R(x)$, in the form

$$\Pi'(x) - \frac{A_{1, 1}}{(x - \alpha_{1})^{2}} - \frac{2A_{1, 2}}{(x - \alpha_{1})^{3}} - \dots - \frac{A_{2, 1}}{(x - \alpha_{2})^{2}} - \frac{2A_{2, 2}}{(x - \alpha_{2})^{3}} - \dots.$$

Incidentally we have proved that *the derivative of $x^{m}$ is $mx^{m-1}$, for all integral values of $m$ positive or negative*.

The method explained in this section is particularly useful when we have to differentiate a rational function several times (see Exs. xlv).
''',
  'ch6-t7': r'''
**C. Algebraical Functions.** The results of the preceding sections, together with Theorem (6) of § 113, enable us to obtain the derivative of any explicit algebraical function whatsoever.

The most important such function is $x^{m}$, where $m$ is a rational number. We have seen already (§ 117) that the derivative of this function is $mx^{m-1}$ when $m$ is an integer positive or negative; and we shall now prove that this result is true for all rational values of $m$. Suppose that $y = x^{m} = x^{p/q}$, where $p$ and $q$ are integers and $q$ positive; and let $z = x^{1/q}$, so that $x = z^{q}$ and $y = z^{p}$. Then

$$\frac{dy}{dx} = \biggl(\frac{dy}{dz}\biggr) \bigg/ \biggl(\frac{dx}{dz}\biggr) = \frac{p}{q} z^{p-q} = mx^{m-1}.$$

This result may also be deduced as a corollary from Ex. xxxvi. 3. For, if $\phi(x) = x^{m}$, we have

$$\begin{aligned} \phi'(x) &= \lim_{h \to 0} \frac{(x + h)^{m} - x^{m}}{h}\\ &= \lim_{\xi \to x} \frac{\xi^{m} - x^{m}}{\xi - x} = mx^{m-1}. \end{aligned}$$

It is clear that the more general formula

$$\frac{d}{dx} (ax + b)^{m} = ma(ax + b)^{m-1}$$

holds also for all rational values of $m$.
''',
  'ch6-t8': r'''
**D. Transcendental Functions.** We have already proved (Ex. xxxix. 4) that

$$D_{x} \sin x = \cos x, \quad D_{x} \cos x = -\sin x.$$

By means of Theorems (4) and (5) of § 113, the reader will easily verify that

$$\begin{alignedat}{2} D_{x} \tan x &= \sec^{2} x, & D_{x} \cot x &= -{\operatorname{cosec}}^{2} x,\\ D_{x} \sec x &= \tan x \sec x, \quad & D_{x} {\operatorname{cosec}} x &= -\cot x{\operatorname{cosec}} x. \end{alignedat}$$

And by means of Theorem (7) we can determine the derivatives of the ordinary inverse trigonometrical functions. The reader should verify the following formulae:

$$\begin{alignedat}{2} D_{x} {\operatorname{arc\,sin}} x &= \pm 1/\sqrt{1 - x^{2}}, & D_{x} {\operatorname{arc\,cos}} x &= \mp 1/\sqrt{1 - x^{2}},\\ D_{x} {\operatorname{arc\,tan}} x &= 1/(1 + x^{2}), & D_{x} {\operatorname{arc\,cot}} x &= -1/(1 + x^{2}),\\ D_{x} {\operatorname{arc\,sec}} x &= \pm 1/\{x\sqrt{x^{2} - 1}\}, \quad & D_{x} {\operatorname{arc\,cosec}} x &= \mp 1/\{x\sqrt{x^{2} - 1}\}. \end{alignedat}$$

In the case of the inverse sine and cosecant the ambiguous sign is the same as that of $\cos({\operatorname{arc\,sin}} x)$, in the case of the inverse cosine and secant the same as that of $\sin({\operatorname{arc\,cos}} x)$.

The more general formulae

$$D_{x} {\operatorname{arc\,sin}}(x/a) = \pm 1/\sqrt{a^{2} - x^{2}},\quad D_{x} {\operatorname{arc\,tan}}(x/a) = a/(x^{2} + a^{2}),$$

which are also easily derived from Theorem (7) of § 113, are also of considerable importance. In the first of them the ambiguous sign is the same as that of $a\cos\{{\operatorname{arc\,sin}}(x/a)\}$, since

$$a\sqrt{1 - (x^{2}/a^{2})} = \pm \sqrt{a^{2} - x^{2}}$$

according as $a$ is positive or negative.

Finally, by means of Theorem (6) of § 113, we are enabled to differentiate composite functions involving symbols both of algebraical and trigonometrical functionality, and so to write down the derivative of any such function as occurs in the following examples.
''',
  'ch6-t9': r'''
We may form a new function $\phi''(x)$ from $\phi'(x)$ just as we formed $\phi'(x)$ from $\phi(x)$. This function is called the *second derivative* or *second differential coefficient* of $\phi(x)$. The second derivative of $y = \phi(x)$ may also be written in any of the forms

$$D_{x}^{2}y,\quad \left(\frac{d}{dx}\right)^{2}y,\quad \frac{d^{2}y}{dx^{2}}.$$

In exactly the same way we may define the *$n$th derivative or $n$th differential coefficient of $y = \phi(x)$*, which may be written in any of the forms

$$\phi^{(n)}(x),\quad D_{x}^{n}y,\quad \left(\frac{d}{dx}\right)^{n}y,\quad \frac{d^{n}y}{dx^{n}}.$$

But it is only in a few cases that it is easy to write down a general formula for the $n$th differential coefficient of a given function. Some of these cases will be found in the examples which follow.
''',
  'ch6-t10': r'''
In all that follows we suppose that $\phi(x)$ is a function of $x$ which has a derivative $\phi'(x)$ for all values of $x$ in question. This assumption of course involves the continuity of $\phi(x)$.

If $\phi'(x_{0}) > 0$ then $\phi(x) < \phi(x_{0})$ for all values of $x$ less than $x_{0}$ but sufficiently near to $x_{0}$, and $\phi(x) > \phi(x_{0})$ for all values of $x$ greater than $x_{0}$ but sufficiently near to $x_{0}$.

For $\{\phi(x_{0} + h) - \phi(x_{0})\}/h$ converges to a positive limit $\phi'(x_{0})$ as $h \to 0$. This can only be the case if $\phi(x_{0} + h) - \phi(x_{0})$ and $h$ have the same sign for sufficiently small values of $h$, and this is precisely what the theorem states. Of course from a geometrical point of view the result is intuitive, the inequality $\phi'(x) > 0$ expressing the fact that the tangent to the curve $y = \phi(x)$ makes a positive acute angle with the axis of $x$. The reader should formulate for himself the corresponding theorem for the case in which $\phi'(x) < 0$.

An immediate deduction from Theorem A is the following important theorem, generally known as Rolle’s Theorem. In view of the great importance of this theorem it may be well to repeat that its truth depends on the assumption of the existence of the derivative $\phi'(x)$ for all values of $x$ in question.

**Theorem B\@..** If $\phi(a) = 0$ and $\phi(b) = 0$, then there must be at least one value of $x$ which lies between $a$ and $b$ and for which $\phi'(x) = 0$.

There are two possibilities: the first is that $\phi(x)$ is equal to zero throughout the whole interval $[a, b]$. In this case $\phi'(x)$ is also equal to zero throughout the interval. If on the other hand $\phi(x)$ is not always equal to zero, then there must be values of $x$ for which $\phi(x)$ is positive or negative. Let us suppose, for example, that $\phi(x)$ is sometimes positive. Then, by Theorem 2 of § 102, there is a value $\xi$ of $x$, not equal to $a$ or $b$, and such that $\phi(\xi)$ is at least as great as the value of $\phi(x)$ at any other point in the interval. And $\phi'(\xi)$ must be equal to zero. For if it were positive then $\phi(x)$ would, by Theorem A, be greater than $\phi(\xi)$ for values of $x$ greater than $\xi$ but sufficiently near to $\xi$, so that there would certainly be values of $\phi(x)$ greater than $\phi(\xi)$. Similarly we can show that $\phi'(\xi)$ cannot be negative.
''',
  'ch6-t11': r'''
We shall say that the value $\phi(\xi)$ assumed by $\phi(x)$ when $x = \xi$ is a *maximum* if $\phi(\xi)$ is greater than any other value assumed by $\phi(x)$ in the immediate neighbourhood of $x = \xi$, *i.e.* if we can find an interval $[\xi - \delta, \xi + \delta]$ of values of $x$ such that $\phi(\xi) > \phi(x)$ when $\xi - \delta < x < \xi$ and when $\xi < x < \xi + \delta$; and we define a *minimum* in a similar manner. Thus in the figure the points $A$ correspond to maxima, the points $B$ to minima of the function whose graph is there shown. It is to be observed that the fact that $A_{3}$ corresponds to a maximum and $B_{1}$ to a minimum is in no way inconsistent with the fact that the value of the function is greater at $B_{1}$ than at $A_{3}$.

**Theorem C\@..** A **necessary** condition for a maximum or minimum value of $\phi(x)$ at $x = \xi$ is that $\phi'(\xi) = 0$.

This follows at once from Theorem A\@. That the condition is not *sufficient* is evident from a glance at the point $C$ in the figure. Thus if $y = x^{3}$ then $\phi'(x) = 3x^{2}$, which vanishes when $x = 0$. But $x = 0$ does not give either a maximum or a minimum of $x^{3}$, as is obvious from the form of the graph of $x^{3}$ (Fig. 10, p. 45).

But *there will certainly be a maximum at $x = \xi$ if $\phi'(\xi) = 0$, $\phi'(x) > 0$ for all values of $x$ less than but near to $\xi$, and $\phi'(x) < 0$ for all values of $x$ greater than but near to $\xi$*: and if the signs of these two inequalities are reversed there will certainly be a minimum. For then we can (by Cor. 3 of § 121) determine an interval $[\xi - \delta, \xi]$ throughout which $\phi(x)$ increases with $x$, and an interval $[\xi, \xi + \delta]$ throughout which it decreases as $x$ increases: and obviously this ensures that $\phi(\xi)$ shall be a maximum.
''',
  'ch6-t12': r'''
We can proceed now to the proof of another general theorem of extreme importance, a theorem commonly known as ‘*The Mean Value Theorem*’ or ‘*The Theorem of the Mean*’.

**Theorem.** If $\phi(x)$ has a derivative for all values of $x$ in the interval $[a, b]$, then there is a value $\xi$ of $x$ between $a$ and $b$, such that

$$\phi(b) - \phi(a) = (b - a)\phi'(\xi).$$

Before we give a strict proof of this theorem, which is perhaps the most important theorem in the Differential Calculus, it will be well to point out its obvious geometrical meaning. This is simply (see Fig. 43) that if the curve $APB$ has a tangent at all points of its length then there must be a point, such as $P$, where the tangent is parallel to $AB$. For $\phi'(\xi)$ is the tangent of the angle which the tangent at $P$ makes with $OX$, and $\{\phi(b) - \phi(a)\}/(b - a)$ the tangent of the angle which $AB$ makes with $OX$.

It is easy to give a strict analytical proof. Consider the function

$$\phi(b) - \phi(x) - \frac{b - x}{b - a}\{\phi(b) - \phi(a)\},$$

which vanishes when $x = a$ and $x = b$. It follows from Theorem B of § 121 that there is a value $\xi$ for which its derivative vanishes. But this derivative is

$$\frac{\phi(b) - \phi(a)}{b - a} - \phi'(x);$$

which proves the theorem. It should be observed that it has not been assumed in this proof that $\phi'(x)$ is continuous.

It is often convenient to express the Mean Value Theorem in the form

$$\phi(b) = \phi(a) + (b - a) \phi'\{a + \theta(b - a)\},$$

where $\theta$ is a number lying between $0$ and $1$. Of course $a + \theta(b - a)$ is merely another way of writing ‘some number $\xi$ between $a$ and $b$’. If we put $b = a + h$ we obtain

$$\phi(a + h) = \phi(a) + h\phi'(a + \theta h),$$

which is the form in which the theorem is most often quoted.
''',
  'ch6-t13': r'''
We have in this chapter seen how we can find the derivative of a given function $\phi(x)$ in a variety of cases, including all those of the commonest occurrence. It is natural to consider the converse question, that of *determining a function whose derivative is a given function*.

Suppose that $\psi(x)$ is the given function. Then we wish to determine a function such that $\phi'(x) = \psi(x)$. A little reflection shows us that this question may really be analysed into three parts.

(1) In the first place we want to know whether such a function as $\phi(x)$ *actually exists*. This question must be carefully distinguished from the question as to whether (supposing that there is such a function) we can find any simple formula to express it.

(2) We want to know whether it is possible that more than one such function should exist, *i.e.* we want to know whether our problem is one which admits of a *unique* solution or not; and if not, we want to know whether there is any simple relation between the different solutions which will enable us to express all of them in terms of any particular one.

(3) If there is a solution, we want to know *how to find an actual expression for it*.

It will throw light on the nature of these three distinct questions if we compare them with the three corresponding questions which arise with regard to the differentiation of functions.

(1) A function $\phi(x)$ may have a derivative for all values of $x$, like $x^{m}$, where $m$ is a positive integer, or $\sin x$. It may generally, but not always have one, like $\sqrt[3]{x}$ or $\tan x$ or $\sec x$. Or again it may never have one: for example, the function considered in Ex. xxxvii. 20, which is nowhere continuous, has obviously no derivative for any value of $x$. Of course during this chapter we have confined ourselves to functions which are continuous except for some special values of $x$. The example of the function $\sqrt[3]{x}$, however, shows that a continuous function may not have a derivative for some special value of $x$, in this case $x = 0$. Whether there are continuous functions which *never* have derivatives, or continuous curves which never have tangents, is a further question which is at present beyond us. Common-sense says *No*: but, as we have already stated in § 111, this is one of the cases in which higher mathematics has proved common-sense to be mistaken.
''',
  'ch6-t14': r'''
All the general theorems of § 113 may of course also be stated as theorems in integration. Thus we have, to begin with, the formulae

$$\begin{array}{c}\displaystyle \int \{f(x) + F(x)\}\, dx = \int f(x) dx + \int F(x)\, dx, \qquad\text{(1)}\\ \displaystyle \int kf(x)\, dx = k\int f(x)\, dx. \qquad\text{(2)} \end{array}$$

Here it is assumed, of course, that the arbitrary constants are adjusted properly. Thus the formula (1) asserts that the sum of *any* integral of $f(x)$ and *any* integral of $F(x)$ is *an* integral of $f(x) + F(x)$.
''',
  'ch6-t15': r'''
After integrating polynomials it is natural to turn our attention next to *rational functions*. Let us suppose $R(x)$ to be any rational function expressed in the standard form of § 117, viz. as the sum of a polynomial $\Pi(x)$ and a number of terms of the form $A/(x - \alpha)^{p}$.

We can at once write down the integrals of the polynomial and of all the other terms except those for which $p = 1$, since

$$\int \frac{A}{(x - \alpha)^{p}}\, dx = -\frac{A}{p - 1}\, \frac{1}{(x - \alpha)^{p-1}},$$

whether $\alpha$ be real or complex (§ 117).

The terms for which $p = 1$ present rather more difficulty. It follows immediately from Theorem (6) of § 113 that

$$\int F'\{f(x)\}\, f'(x)\, dx = F\{f(x)\}. \qquad\text{(3)}$$

In particular, if we take $f(x) = ax + b$, where $a$ and $b$ are real, and write $\phi(x)$ for $F(x)$ and $\psi(x)$ for $F'(x)$, so that $\phi(x)$ is an integral of $\psi(x)$, we obtain

$$\int \psi(ax + b)\, dx = \frac{1}{a}\phi(ax + b). \qquad\text{(4)}$$

Thus, for example,

$$\int \frac{dx}{ax + b} = \frac{1}{a} \log|ax + b|,$$

and in particular, if $\alpha$ is real,

$$\int \frac{dx}{x - \alpha} = \log|x - \alpha|.$$

We can therefore write down the integrals of all the terms in $R(x)$ for which $p = 1$ and $\alpha$ is real. There remain the terms for which $p = 1$ and $\alpha$ is complex.

In order to deal with these we shall introduce a restrictive hypothesis, viz. that all the coefficients in $R(x)$ are real. Then if $\alpha = \gamma + \delta i$ is a root of $Q(x) = 0$, of multiplicity $m$, so is its conjugate $\bar{\alpha} = \gamma - \delta i$; and if a partial fraction $A_{p}/(x - \alpha)^{p}$ occurs in the expression of $R(x)$, so does $\bar{A}_{p}/(x - \bar{\alpha})^{p}$, where $\bar{A}_{p}$ is conjugate to $A_{p}$. This follows from the nature of the algebraical processes by means of which the partial fractions can be found, and which are explained at length in treatises on Algebra.
''',
  'ch6-t16': r'''
We naturally pass on next to the question of the integration of *algebraical* functions. We have to consider the problem of integrating $y$, where $y$ is an algebraical function of $x$. It is however convenient to consider an apparently more general integral, viz.

$$\int R(x, y)\, dx,$$

where $R(x, y)$ is any rational function of $x$ and $y$. The greater generality of this form is only apparent, since (Ex. xiv. 6) the function $R(x, y)$ is itself an algebraical function of $x$. The choice of this form is in fact dictated simply by motives of convenience: such a function as

$$\frac{px + q + \sqrt{ax^{2} + 2bx + c}} {px + q - \sqrt{ax^{2} + 2bx + c}}$$

is far more conveniently regarded as a rational function of $x$ and the simple algebraical function $\sqrt{ax^{2} + 2bx + c}$, than directly as itself an algebraical function of $x$.

**133. Integration by substitution and rationalisation.**

It follows from equation (3) of § 130 that if $\displaystyle \int \psi(x)\, dx = \phi(x)$ then

$$\int \psi\{f(t)\}\, f'(t)\, dt = \phi\{f(t)\}. \qquad\text{(1)}$$

This equation supplies us with a method for determining the integral of $\psi(x)$ in a large number of cases in which the form of the integral is not directly obvious. It may be stated as a rule as follows: *put $x = f(t)$, where $f(t)$ is any function of a new variable $t$ which it may be convenient to choose; multiply by $f'(t)$, and determine (if possible) the integral of $\psi\{f(t)\}\, f'(t)$; express the result in terms of $x$*. It will often be found that the function of $t$ to which we are led by the application of this rule is one whose integral can easily be calculated. This is always so, for example, if it is a rational function, and it is very often possible to choose the relation between $x$ and $t$ so that this shall be the case. Thus the integral of $R(\sqrt{x})$, where $R$ denotes a rational function, is reduced by the substitution $x = t^{2}$ to the integral of $2tR(t^{2})$, *i.e.* to the integral of a rational function of $t$. This method of integration is called **integration by rationalisation**, and is of extremely wide application.
''',
  'ch6-t17': r'''
Owing to the immense variety of the different classes of transcendental functions, the theory of their integration is a good deal less systematic than that of the integration of rational or algebraical functions. We shall consider in order a few classes of transcendental functions whose integrals can always be found.

**141. Polynomials in cosines and sines of multiples of $x$.**

We can always integrate any function which is the sum of a finite number of terms such as

$$A\cos^{m} ax \sin^{m'} ax \cos^{n} bx \sin^{n'} bx\dots,$$

where $m$, $m'$, $n$, $n'$, … are positive integers and $a$, $b$, … any real numbers whatever. For such a term can be expressed as the sum of a finite number of terms of the types

$$\alpha\cos\{(pa + qb + \dots)x\},\quad \beta \sin\{(pa + qb + \dots)x\}$$

and the integrals of these terms can be written down at once.

**142. The integrals $\displaystyle \int x^{n}\cos x\, dx$, $\displaystyle \int x^{n}\sin x\, dx$ and associated integrals.**

The method of integration by parts enables us to generalise the preceding results. For

$$\begin{alignedat}{3} \int x^{n}\cos x\, dx &= & &x^{n}\sin x &&- n\int x^{n-1}\sin x\, dx,\\ \int x^{n}\sin x\, dx &= &-&x^{n}\cos x &&+ n\int x^{n-1}\cos x\, dx, \end{alignedat}$$

and clearly the integrals can be calculated completely by a repetition of this process whenever $n$ is a positive integer. It follows that we can always calculate $\displaystyle \int x^{n}\cos ax\, dx$ and $\displaystyle \int x^{n}\sin ax\, dx$ if $n$ is a positive integer; and so, by a process similar to that of the preceding paragraph, we can calculate

$$\int P(x, \cos ax, \sin ax, \cos bx, \sin bx, \dots)\, dx,$$

where $P$ is any polynomial.

**143. Rational Functions of $\cos x$ and $\sin x$.**

The integral of any rational function of $\cos x$ and $\sin x$ may be calculated by the substitution $\tan \frac{1}{2}x = t$. For

$$\cos x = \frac{1 - t^{2}}{1 + t^{2}},\quad \sin x = \frac{2t}{1 + t^{2}},\quad \frac{dx}{dt} = \frac{2}{1 + t^{2}},$$

so that the substitution reduces the integral to that of a rational function of $t$.

**144. Integrals involving ${\operatorname{arc\,sin}} x$, ${\operatorname{arc\,tan}} x$, and $\log x$.**

The integrals of the inverse sine and tangent and of the logarithm can easily be calculated by integration by parts. Thus

$$\begin{aligned} \int {\operatorname{arc\,sin}} x\, dx &= x{\operatorname{arc\,sin}} x - \int \frac{x\, dx}{\sqrt{1 - x^{2}}} = x{\operatorname{arc\,sin}} x + \sqrt{1 - x^{2}},\\ \int {\operatorname{arc\,tan}} x\, dx &= x{\operatorname{arc\,tan}} x - \int \frac{x\, dx}{1 + x^{2}} = x{\operatorname{arc\,tan}} x - \tfrac{1}{2} \log(1 + x^{2}),\\ \int \log x\, dx &= x\log x - \int dx = x(\log x - 1). \end{aligned}$$

It is easy to see that if we can find the integral of $y = f(x)$ then we can always find that of $x = \phi(y)$, where $\phi$ is the function inverse to $f$. For on making the substitution $y = f(x)$ we obtain

$$\int \phi(y)\, dy = \int xf'(x)\, dx = xf(x) - \int f(x)\, dx.$$

The reader should evaluate the integrals of ${\operatorname{arc\,sin}} y$ and ${\operatorname{arc\,tan}} y$ in this way.
''',
  'ch6-t18': r'''
One of the most important applications of the processes of integration which have been explained in the preceding sections is to the calculation of *areas* of plane curves. Suppose that $P_{0}PP'$ (Fig. 44) is the graph of a continuous curve $y = \phi(x)$ which lies wholly above the axis of $x$, $P$ being the point $(x, y)$ and $P'$ the point $(x + h, y + k)$, and $h$ being either positive or negative (positive in the figure).

The reader is of course familiar with the idea of an ‘area’, and in particular with that of an area such as $ONPP_{0}$. This idea we shall at present take for granted. It is indeed one which needs and has received the most careful mathematical analysis: later on we shall return to it and explain precisely what is meant by ascribing an ‘area’ to such a region of space as $ONPP_{0}$. For the present we shall simply assume that any such region has associated with it a definite positive number $(ONPP_{0})$ which we call its area, and that these areas possess the obvious properties indicated by common sense, *e.g.* that

$$(PRP') + (NN'RP) = (NN'P'P),\quad (N_{1}NPP_{1}) < (ONPP_{0}),$$

and so on.

Taking all this for granted it is obvious that the area $ONPP_{0}$ is a function of $x$; we denote it by $\Phi(x)$. Also $\Phi(x)$ is a *continuous* function. For

$$\begin{aligned} \Phi(x + h) - \Phi(x) &= (NN'P'P)\\ &= (NN'RP) + (PRP') = h\phi(x) + (PRP'). \end{aligned}$$

As the figure is drawn, the area $PRP'$ is less than $hk$. This is not however necessarily true in general, because it is not necessarily the case (see for example Fig. 44a) that the arc $PP'$ should rise or fall steadily from $P$ to $P'$. But the area $PRP'$ is always less than $|h|\lambda(h)$, where $\lambda(h)$ is the greatest distance of any point of the arc $PP'$ from $PR$. Moreover, since $\phi(x)$ is a continuous function, $\lambda(h) \to 0$ as $h \to 0$. Thus we have

$$\Phi(x + h) - \Phi(x) = h\{\phi(x) + \mu(h)\},$$

where $|\mu(h)| < \lambda(h)$ and $\lambda(h) \to 0$ as $h \to 0$. From this it follows at once that $\Phi(x)$ is continuous. Moreover

$$\Phi'(x) = \lim_{h \to 0} \frac{\Phi(x + h) - \Phi(x)}{h} = \lim_{h \to 0} \{\phi(x) + \mu(h)\} = \phi(x).$$

Thus *the ordinate of the curve is the derivative of the area, and the area is the integral of the ordinate*.
''',
  'ch6-t19': r'''
The notion of the length of a curve, other than a straight line, is in reality a more difficult one even than that of an area. In fact the assumption that $P_{0}P$ (Fig. 44) has a definite length, which we may denote by $S(x)$, does not suffice for our purposes, as did the corresponding assumption about areas. We cannot even prove that $S(x)$ is continuous, *i.e.* that $\lim\{S(P') - S(P)\} = 0$. This looks obvious enough in the larger figure, but less so in such a case as is shown in the smaller figure. Indeed it is not possible to proceed further, with any degree of rigour, without a careful analysis of precisely what is meant by the length of a curve.
''',
  'ch7-t1': r'''
In the preceding chapter (§ 125) we proved that if $f(x)$ has a derivative $f'(x)$ throughout the interval $[a, b]$ then

$$f(b) - f(a) = (b - a) f'(\xi),$$

where $a < \xi < b$; or that, if $f(x)$ has a derivative throughout $[a, a + h]$, then

$$f(a + h) - f(a) = hf'(a + \theta_{1} h), \qquad\text{(1)}$$

where $0 < \theta_{1} < 1$. This we proved by considering the function

$$f(b) - f(x) - \frac{b - x}{b - a} \{f(b) - f(a)\}$$

which vanishes when $x = a$ and when $x = b$.

Let us now suppose that $f(x)$ has also a second derivative $f''(x)$ throughout $[a, b]$, an assumption which of course involves the continuity of the first derivative $f'(x)$, and consider the function

$$f(b) - f(x) - (b - x) f'(x) - \left(\frac{b - x}{b - a}\right)^{2} \{f(b) - f(a) - (b - a)f'(a)\}.$$

This function also vanishes when $x = a$ and when $x = b$; and its derivative is

$$\frac{2(b - x)}{(b - a)^{2}} \{f(b) - f(a) - (b - a) f'(a) - \tfrac{1}{2}(b - a)^{2}f''(x)\},$$

and this must vanish (§ 121) for some value of $x$ between $a$ and $b$ (exclusive of $a$ and $b$). Hence there is a value $\xi$ of $x$, between $a$ and $b$, and therefore capable of representation in the form $a + \theta_{2}(b - a)$, where $0 < \theta_{2} < 1$, for which

$$f(b) = f(a) + (b - a)f'(a) + \tfrac{1}{2}(b - a)^{2}f''(\xi).$$

If we put $b = a + h$ we obtain the equation

$$f(a + h) = f(a) + hf'(a) + \tfrac{1}{2}h^{2} f''(a + \theta_{2}h), \qquad\text{(2)}$$

which is the standard form of what may be called the *Mean Value Theorem of the second order*.

The analogy suggested by (1) and (2) at once leads us to formulate the following theorem:

If $f(x)$ is a function of $x$ which has derivatives of the first $n$ orders throughout the interval $[a, b]$, then

$$\begin{array}{c}\displaystyle f(b) = f(a) + (b - a)f'(a) + \frac{(b - a)^{2}}{2!} f''(a) + \dots\\ \displaystyle + \frac{(b - a)^{n-1}}{(n - 1)!} f^{(n-1)}(a) + \frac{(b - a)^{n}}{n!}f^{(n)}(\xi), \end{array}$$

where $a < \xi < b$; and if $b = a + h$ then

$$\begin{array}{c}\displaystyle f(a + h) = f(a) + hf'(a) + \tfrac{1}{2} h^{2}f''(a) + \dots\\ \displaystyle + \frac{h^{n-1}}{(n - 1)!} f^{(n-1)}(a) + \frac{h^{n}}{n!} f^{(n)}(a + \theta_{n}h), \end{array}$$

where $0 < \theta_{n} < 1$.
''',
  'ch7-t2': r'''
Suppose that $f(x)$ is a function all of whose differential coefficients are continuous in an interval $[a - \eta, a + \eta]$ surrounding the point $x = a$. Then, if $h$ is numerically less than $\eta$, we have

$$f(a + h) = f(a) + hf'(a) + \dots + \frac{h^{n-1}}{(n - 1)!} f^{(n-1)}(a) + \frac{h^{n}}{n!} f^{(n)}(a + \theta_{n} h),$$

where $0 < \theta_{n} < 1$, for all values of $n$. Or, if

$$S_{n} = \sum_{0}^{n-1} \frac{h^{\nu}}{\nu!} f^{(\nu)}(a),\quad R_{n} = \frac{h^{n}}{n!} f^{(n)}(a + \theta_{n} h),$$

we have

$$f(a + h) - S_{n} = R_{n}.$$

Now let us suppose, in addition, that we can prove that $R_{n} \to 0$ as $n \to \infty$. Then

$$f(a + h) = \lim_{n\to\infty} S_{n} = f(a) + hf'(a) + \frac{h^{2}}{2!} f''(a) + \dots.$$

This expansion of $f(a + h)$ is known as **Taylor’s Series**. When $a = 0$ the formula reduces to

$$f(h) = f(0) + hf'(0) + \frac{h^{2}}{2!} f''(0) + \dots,$$

which is known as **Maclaurin’s Series**. The function $R_{n}$ is known as **Lagrange’s form of the remainder**.

The reader should be careful to guard himself against supposing that the continuity of all the derivatives of $f(x)$ is a sufficient condition for the validity of Taylor’s series. A direct discussion of the behaviour of $R_{n}$ is always essential.
''',
  'ch7-t3': r'''
**A. Maxima and minima.** Taylor’s Theorem may be applied to give greater theoretical completeness to the tests of Ch. VI, §§ 122–123, though the results are not of much practical importance. It will be remembered that, assuming that $\phi(x)$ has derivatives of the first two orders, we stated the following as being sufficient conditions for a maximum or minimum of $\phi(x)$ at $x = \xi$: *for a maximum*, $\phi'(\xi) = 0$, $\phi''(\xi) < 0$; *for a minimum*, $\phi'(\xi) = 0$, $\phi''(\xi) > 0$. It is evident that these tests fail if $\phi''(\xi)$ as well as $\phi'(\xi)$ is zero.

Let us suppose that the first $n$ derivatives

$$\phi'(x),\quad \phi''(x),\ \dots,\quad \phi^{(n)}(x)$$

are continuous, and that all save the last vanish when $x = \xi$. Then, for sufficiently small values of $h$,

$$\phi(\xi + h) - \phi(\xi) = \frac{h^{n}}{n!} \phi^{(n)} (\xi + \theta_{n} h).$$

In order that there should be a maximum or a minimum this expression must be of constant sign for all sufficiently small values of $h$, positive or negative. This evidently requires that $n$ should be even. And if $n$ is even there will be a maximum or a minimum according as $\phi^{(n)}(\xi)$ is negative or positive.

Thus we obtain the test:

if there is to be a maximum or minimum the first derivative which does not vanish must be an even derivative, and there will be a maximum if it is negative, a minimum if it is positive.
''',
  'ch7-t4': r'''
**B. The calculation of certain limits.** Suppose that $f(x)$ and $\phi(x)$ are two functions of $x$ whose derivatives $f'(x)$ and $\phi'(x)$ are continuous for $x = \xi$ and that $f(\xi)$ and $\phi(\xi)$ are both equal to zero. Then the function

$$\psi(x) = f(x)/\phi(x)$$

is not defined when $x = \xi$. But of course it may well tend to a limit as $x \to \xi$.

Now

$$f(x) = f(x) - f(\xi) = (x - \xi)f'(x_{1}),$$

where $x_{1}$ lies between $\xi$ and $x$; and similarly $\phi(x) = (x - \xi)\phi'(x_{2})$, where $x_{2}$ also lies between $\xi$ and $x$. Thus

$$\psi(x) = f'(x_{1})/\phi'(x_{2}).$$

We must now distinguish four cases.

(1) If neither $f'(\xi)$ nor $\phi'(\xi)$ is zero, then

$$f(x)/\phi(x) \to f'(\xi)/\phi'(\xi).$$

(2) If $f'(\xi) = 0$, $\phi'(\xi) \neq 0$, then

$$f(x)/\phi(x) \to 0.$$

(3) If $f'(\xi) \neq 0$, $\phi'(\xi)= 0$, then $f(x)/\phi(x)$ becomes numerically very large as $x \to \xi$: but whether $f(x)/\phi(x)$ tends to $\infty$ or $-\infty$, or is sometimes large and positive and sometimes large and negative, we cannot say, without further information as to the way in which $\phi'(x) \to 0$ as $x \to \xi$.

(4) If $f'(\xi) = 0$, $\phi'(\xi) = 0$, then we can as yet say nothing about the behaviour of $f(x)/\phi(x)$ as $x \to 0$.

But in either of the last two cases it may happen that $f(x)$ and $\phi(x)$ have continuous second derivatives. And then

$$\begin{aligned} f(x) &= f(x) - f(\xi) - (x - \xi)f'(\xi) = \tfrac{1}{2}(x - \xi)^{2} f''(x_{1}),\\ \phi(x) &= \phi(x) - \phi(\xi) - (x - \xi)\phi'(\xi) = \tfrac{1}{2}(x - \xi)^{2} \phi''(x_{2}), \end{aligned}$$

where again $x_{1}$ and $x_{2}$ lie between $\xi$ and $x$; so that

$$\psi(x)= f''(x_{1})/\phi''(x_{2}).$$

We can now distinguish a variety of cases similar to those considered above. In particular, if neither second derivative vanishes for $x = \xi$, we have

$$f(x)/\phi(x) \to f''(\xi)/\phi''(\xi).$$

It is obvious that this argument can be repeated indefinitely, and we obtain the following theorem:

suppose that $f(x)$ and $\phi(x)$ and their derivatives, so far as may be wanted, are continuous for $x = \xi$. Suppose further that $f^{(p)}(x)$ and $\phi^{(q)}(x)$ are the first derivatives of $f(x)$ and $\phi(x)$ which do not vanish when $x = \xi$. Then (1) if $p = q$, $f(x)/\phi(x) \to f^{(p)}(\xi)/\phi^{(p)}(\xi)$;

(2) if $p > q$, $f(x)/\phi(x) \to 0$;

(3) if $p < q$, and $q - p$ is even, either $f(x)/\phi(x) \to +\infty$ or $f(x)/\phi(x) \to -\infty$, the sign being the same as that of $f^{(p)}(\xi)/\phi^{(q)}(\xi)$;

(4) if $p < q$ and $q - p$ is odd, either $f(x)/\phi(x) \to +\infty$ or $f(x)/\phi(x) \to -\infty$, as $x \to \xi+0$, the sign being the same as that of $f^{(p)}(\xi)/\phi^{(q)}(\xi)$, while if $x \to \xi - 0$ the sign must be reversed.
''',
  'ch7-t5': r'''
**C. The contact of plane curves.** Two curves are said to *intersect* (or *cut*) at a point if the point lies on each of them. They are said to *touch* at the point if they have the same tangent at the point.

Let us suppose now that $f(x)$, $\phi(x)$ are two functions which possess derivatives of all orders continuous for $x = \xi$, and let us consider the curves $y = f(x)$, $y = \phi(x)$. In general $f(\xi)$ and $\phi(\xi)$ will not be equal. In this case the abscissa $x = \xi$ does not correspond to a point of intersection of the curves. If however $f(\xi) = \phi(\xi)$, the curves intersect in the point $x = \xi$, $y = f(\xi) = \phi(\xi)$. Let us suppose this to be the case. Then in order that the curves should not only cut but touch at this point it is obviously necessary and sufficient that the first derivatives $f'(x)$, $\phi'(x)$ should also have the same value when $x = \xi$.

The contact of the curves in this case may be regarded from a different point of view. In the figure the two curves are drawn touching at $P$, and $QR$ is equal to $\phi(\xi + h) - f(\xi + h)$, or, since $\phi(\xi) = f(\xi)$, $\phi'(\xi) = f'(\xi)$, to

$$\tfrac{1}{2} h^{2}\{\phi''(\xi + \theta h) - f''(\xi + \theta h)\},$$

where $\theta$ lies between $0$ and $1$. Hence

$$\lim \frac{QR}{h^{2}} = \tfrac{1}{2}\{\phi''(\xi) - f''(\xi)\},$$

when $h \to 0$. In other words, when the curves touch at the point whose abscissa is $\xi$, *the difference of their ordinates at the point whose abscissa is $\xi + h$ is at least of the second order of smallness when $h$ is small*.

The reader will easily verify that $\lim (QR/h) = \phi'(\xi) - f'(\xi)$ when the curves cut and do not touch, so that $QR$ is then of the first order of smallness only.

It is evident that the degree of smallness of $QR$ may be taken as a kind of measure of the *closeness of the contact* of the curves. It is at once suggested that if the first $n - 1$ derivatives of $f$ and $\phi$ have equal values when $x = \xi$, then $QR$ will be of $n$th order of smallness; and the reader will have no difficulty in proving that this is so and that

$$\lim \frac{QR}{h^{n}} = \frac{1}{n!}\{\phi^{(n)}(\xi) - f^{(n)}(\xi)\}.$$

We are therefore led to frame the following definition:

**Contact of the $n$th order.** If $f(\xi) = \phi(\xi)$, $f'(\xi) = \phi'(\xi)$, …, $f^{(n)}(\xi) = \phi^{(n)}(\xi)$, but $f^{(n+1)}(\xi) \neq \phi^{(n+1)}(\xi)$, then the curves $y = f(x)$, $y = \phi(x)$ will be said to have contact of the $n$th order at the point whose abscissa is $\xi$.
''',
  'ch7-t6': r'''
So far we have been concerned exclusively with functions of a single variable $x$, but there is nothing to prevent us applying the notion of differentiation to functions of several variables $x$, $y$, ….

Suppose then that $f(x, y)$ is a function of two real variables $x$ and $y$, and that the limits

$$\lim_{h\to 0}\frac{f(x + h, y) - f(x, y)}{h},\quad \lim_{k\to 0}\frac{f(x, y + k) - f(x, y)}{k}$$

exist for all values of $x$ and $y$ in question, that is to say that $f(x, y)$ possesses a derivative $df/dx$ or $D_{x}f(x, y)$ with respect to $x$ and a derivative $df/dy$ or $D_{y}f(x, y)$ with respect to $y$. It is usual to call these derivatives the *partial differential coefficients* of $f$, and to denote them by

$$\frac{\partial f}{\partial x},\quad \frac{\partial f}{\partial y}$$

or

$$f_{x}'(x, y),\quad f_{y}'(x, y)$$

or simply $f_{x}'$, $f_{y}'$ or $f_{x}$, $f_{y}$. The reader must not suppose, however, that these new notations imply any essential novelty of idea: ‘partial differentiation’ with respect to $x$ is exactly the same process as ordinary differentiation, the only novelty lying in the presence in $f$ of a second variable $y$ independent of $x$.

In what precedes we have supposed $x$ and $y$ to be two real variables entirely independent of one another. If $x$ and $y$ were connected by a relation the state of affairs would be very different. In this case our definition of $f_{x}'$ would fail entirely, as we could not change $x$ into $x + h$ without at the same time changing $y$. But then $f(x, y)$ would not really be a function of two variables at all. A function of two variables, as we defined it in Ch. II, is essentially a function of two *independent* variables. If $y$ depends on $x$, $y$ is a function of $x$, say $y = \phi(x)$; and then

$$f(x, y) = f\{x, \phi(x)\}$$

is really a function of the single variable $x$. Of course we may also represent it as a function of the single variable $y$. Or, as is often most convenient, we may regard $x$ and $y$ as functions of a third variable $t$, and then $f(x, y)$, which is of the form $f\{\phi(t), \psi(t)\}$, is a function of the single variable $t$.
''',
  'ch7-t7': r'''
In the applications of the Calculus, especially in geometry, it is usually most convenient to work with equations expressed not, like equation (1) of § 154, in terms of the increments $\delta x$, $\delta y$, $\delta z$ of the functions $x$, $y$, $z$, but in terms of what are called their *differentials* $dx$, $dy$, $dz$.

Let us return for a moment to a function $y = f(x)$ of a single variable $x$. If $f'(x)$ is continuous then

$$\delta y = \{f'(x) + \epsilon\}\, \delta x, \qquad\text{(1)}$$

where $\epsilon \to 0$ as $\delta x \to 0$: in other words the equation

$$\delta y = f'(x)\, \delta x \qquad\text{(2)}$$

is ‘approximately’ true. We have up to the present attributed no meaning of any kind to the symbol $dy$ standing by itself. We now agree to *define* $dy$ by the equation

$$dy = f'(x)\, \delta x. \qquad\text{(3)}$$

If we choose for $y$ the particular function $x$, we obtain

$$dx = \delta x, \qquad\text{(4)}$$

so that

$$dy = f'(x)\, dx. \qquad\text{(5)}$$

If we divide both sides of (5) by $dx$ we obtain

$$\frac{dy}{dx} = f'(x), \qquad\text{(6)}$$

where $dy/dx$ denotes not, as heretofore, the differential coefficient of $y$, but the quotient of the differentials $dy$, $dx$. The symbol $dy/dx$ thus acquires a double meaning; but there is no inconvenience in this, since (6) is true whichever meaning we choose.

The equation (5) has two apparent advantages over (2). It is exact and not merely approximate, and its truth does not depend on any assumption as to the continuity of $f'(x)$. On the other hand it is precisely the fact that we can, under certain conditions, pass from the exact equation (5) to the approximate equation (2), which gives the former its importance. The advantages of the ‘differential’ notation are in reality of a purely technical character. These technical advantages are however so great, especially when we come to deal with functions of several variables, that the use of the notation is almost inevitable.
''',
  'ch7-t8': r'''
It will be remembered that, in Ch. VI, § 145, we assumed that, if $f(x)$ is a continuous function of $x$, and $PQ$ is the graph of $y = f(x)$, then the region $PpqQ$ shown in Fig. 47 has associated with it a definite number which we call its *area*. It is clear that, if we denote $Op$ and $Oq$ by $a$ and $x$, and allow $x$ to vary, this area is a function of $x$, which we denote by $F(x)$.

Making this assumption, we proved in § 145 that $F'(x) = f(x)$, and we showed how this result might be used in the calculation of the areas of particular curves. But we have still to justify the fundamental assumption that there is such a number as the area $F(x)$.

We know indeed what is meant by the area of a *rectangle*, and that it is measured by the product of its sides. Also the properties of triangles, parallelograms, and polygons proved by Euclid enable us to attach a definite meaning to the areas of such figures. But nothing which we know so far provides us with a direct definition of the area of a figure bounded by curved lines. We shall now show how to give a definition of $F(x)$ which will enable us to *prove* its existence.

Let us suppose $f(x)$ continuous throughout the interval $[a, b]$, and let us divide up the interval into a number of sub-intervals by means of the points of division $x_{0}$, $x_{1}$, $x_{2}$, …, $x_{n}$, where

$$a = x_{0} < x_{1} < \dots < x_{n-1} < x_{n} = b.$$

Further, let us denote by $\delta_{\nu}$ the interval $[x_{\nu}, x_{\nu+1}]$, and by $m_{\nu}$ the lower bound (§ 102) of $f(x)$ in $\delta_{\nu}$, and let us write

$$s = m_{0}\delta_{0} + m_{1}\delta_{1} + \dots + m_{n}\delta_{n} = \textstyle\sum m_{\nu}\delta_{\nu},$$

say.

It is evident that, if $M$ is the upper bound of $f(x)$ in $[a, b]$, then $s \leqq M(b - a)$. The aggregate of values of $s$ is therefore, in the language of § 80, bounded above, and possesses an upper bound which we will denote by $j$. No value of $s$ exceeds $j$, but there are values of $s$ which exceed any number less than $j$.
''',
  'ch7-t9': r'''
We shall now give the alternative form of the proof of Taylor’s Theorem to which we alluded in § 147.

Let $f(x)$ be a function whose first $n$ derivatives are continuous, and let

$$F_{n}(x) = f(b) - f(x) - (b - x)f'(x) - \dots - \frac{(b - x)^{n-1}}{(n - 1)!} f^{(n-1)}(x).$$

Then

$$F_{n}'(x) = -\frac{(b - x)^{n-1}}{(n - 1)!} f^{(n)}(x),$$

and so

$$F_{n}(a) = F_{n}(b) - \int_{a}^{b}F_{n}'(x)\, dx = \frac{1}{(n - 1)!} \int_{a}^{b} (b - x)^{n-1} f^{(n)}(x)\, dx.$$

If now we write $a + h$ for $b$, and transform the integral by putting $x = a + th$, we obtain

$$f(a + h) = f(a) + hf'(a) + \dots + \frac{h^{n-1}}{(n - 1)!} f^{(n-1)}(a) + R_{n}, \qquad\text{(1)}$$

where

$$R_{n} = \frac{h^{n}}{(n - 1)!} \int_{0}^{1} (1 - t)^{n-1} f^{(n)}(a + th)\, dt. \qquad\text{(2)}$$

Now, if $p$ is any positive integer not greater than $n$, we have, by Theorem (9) of § 160,

$$\begin{aligned} \int_{0}^{1} (1 - t)^{n-1} f^{(n)}(a + th)\, dt &= \int_{0}^{1}(1 - t)^{n-p} (1 - t)^{p-1} f^{(n)}(a + th)\, dt \\ &= (1 - \theta)^{n-p} f^{(n)}(a + \theta h) \int_{0}^{1} (1 - t)^{p-1}\, dt, \end{aligned}$$

where $0 < \theta < 1$. Hence

$$R_{n} = \frac{(1 - \theta)^{n-p} f^{(n)}(a + \theta h)h^{n}}{p(n - 1)!}. \qquad\text{(3)}$$

If we take $p = n$ we obtain Lagrange’s form of $R_{n}$ (§ 148). If on the other hand we take $p = 1$ we obtain **Cauchy’s form**, viz.
''',
  'ch7-t10': r'''
If $f(x) = (1 + x)^{m}$, where $m$ is not a positive integer, then Cauchy’s form of the remainder is

$$R_{n} = \frac{m(m - 1)\dots (m - n + 1)}{1\cdot 2\dots (n - 1)}\, \frac{(1 - \theta )^{n-1} x^{n}}{(1 + \theta x)^{n-m}}.$$

Now $(1 - \theta)/(1 + \theta x)$ is less than unity, so long as $-1 < x < 1$, whether $x$ is positive or negative; and $(1 + \theta x)^{m-1}$ is less than a constant $K$ for all values of $n$, being in fact less than $(1 + |x|)^{m-1}$ if $m > 1$ and than $(1 - |x|)^{m-1}$ if $m < 1$. Hence

$$|R_{n}| < K |m| \left|\binom{m - 1}{n - 1}\right| |x^{n}| = \rho_{n},$$

say. But $\rho_{n} \to 0$ as $n \to \infty$, by Ex. xxvii. 13, and so $R_{n} \to 0$. The truth of the Binomial Theorem is thus established for all rational values of $m$ and all values of $x$ between $-1$ and $1$. It will be remembered that the difficulty in using Lagrange’s form, in Ex. lvi. 2, arose in connection with negative values of $x$.
''',
  'ch7-t11': r'''
So far we have always supposed that the subject of integration in a definite integral is real. We define the integral of a complex function $f(x) = \phi(x) + i\psi(x)$ of the real variable $x$, between the limits $a$ and $b$, by the equations

$$\int_{a}^{b} f(x)\, dx = \int_{a}^{b} \{\phi(x) + i\psi(x)\}\, dx = \int_{a}^{b} \phi(x)\, dx + i \int_{a}^{b} \psi(x)\, dx;$$

and it is evident that the properties of such integrals may be deduced from those of the real integrals already considered.

There is one of these properties that we shall make use of later on. It is expressed by the inequality

$$\left|\int_{a}^{b} f(x)\, dx\right| \leqq \int_{a}^{b} |f(x)|\, dx. \qquad\text{(1)}$$

This inequality may be deduced without difficulty from the definitions of §§ 156 and 157. If $\delta_{\nu}$ has the same meaning as in § 156, $\phi_{\nu}$ and $\psi_{\nu}$ are the values of $\phi$ and $\psi$ at a point of $\delta_{\nu}$, and $f_{\nu} = \phi_{\nu} + i\psi_{\nu}$, then we have

$$\begin{aligned} \int_{a}^{b} f\, dx = \int_{a}^{b} \phi\, dx + i \int_{a}^{b} \psi\, dx &= \lim \textstyle\sum \phi_{\nu}\, \delta_{\nu} + i \lim \textstyle\sum \psi_{\nu}\, \delta_{\nu} \\ &= \lim \textstyle\sum (\phi_{\nu} + i\psi_{\nu})\, \delta_{\nu} = \lim \textstyle\sum f_{\nu}\, \delta_{\nu}, \end{aligned}$$

and so

$$\int_{a}^{b} f\, dx = |\lim \textstyle\sum f_{\nu}\, \delta_{\nu}| = \lim |\textstyle\sum f_{\nu}\, \delta_{\nu}|;$$

while

$$\int_{a}^{b} |f|\, dx = \lim \textstyle\sum |f_{\nu}|\, \delta_{\nu}.$$

The result now follows at once from the inequality

$$|\textstyle\sum f_{\nu}\, \delta_{\nu}| \leqq \textstyle\sum |f_{\nu}|\, \delta_{\nu}.$$

It is evident that the formulae (1) and (2) of § 162 remain true when $f$ is a complex function $\phi + i\psi$.
''',
  'ch8-t1': r'''
In Ch. IV we explained what was meant by saying that an infinite series is *convergent*, *divergent*, or *oscillatory*, and illustrated our definitions by a few simple examples, mainly derived from the geometrical series

$$1 + x + x^{2} + \dots$$

and other series closely connected with it. In this chapter we shall pursue the subject in a more systematic manner, and prove a number of theorems which enable us to determine when the simplest series which commonly occur in analysis are convergent.

We shall often use the notation

$$u_{m} + u_{m+1} + \dots + u_{n} = \sum_{m}^{n} \phi(\nu),$$

and write $\sum\limits_{0}^{\infty} u_{n}$, or simply $\sum u_{n}$, for the infinite series $u_{0} + u_{1} + u_{2} + \dots$.

**166. Series of Positive Terms.**

The theory of the convergence of series is comparatively simple when all the terms of the series considered are positive. We shall consider such series first, not only because they are the easiest to deal with, but also because the discussion of the convergence of a series containing negative or complex terms can often be made to depend upon a similar discussion of a series of positive terms only.

When we are discussing the convergence or divergence of a series we may disregard any finite number of terms. Thus, when a series contains a finite number only of negative or complex terms, we may omit them and apply the theorems which follow to the remainder.

**167.**

It will be well to recall the following fundamental theorems established in § 77.

A. A series of positive terms must be convergent or diverge to $\infty$, and cannot oscillate.

B. The necessary and sufficient condition that $\sum u_{n}$ should be convergent is that there should be a number $K$ such that

$$u_{0} + u_{1} + \dots + u_{n} < K$$

for all values of $n$.

**C. The comparison theorem.** If $\sum u_{n}$ is convergent, and $v_{n} \leqq u_{n}$ for all values of $n$, then $\sum v_{n}$ is convergent, and $\sum v_{n} \leqq \sum u_{n}$. More generally, if $v_{n} \leqq Ku_{n}$, where $K$ is a constant, then $\sum v_{n}$ is convergent and $\sum v_{n} \leqq K \sum u_{n}$. And if $\sum u_{n}$ is divergent, and $v_{n} \geqq Ku_{n}$, then $\sum v_{n}$ is divergent.
''',
  'ch8-t2': r'''
Before proceeding further in the investigation of tests of convergence and divergence, we shall prove an important general theorem concerning series of positive terms.

The sum of a series of positive terms is the same in whatever order the terms are taken.

This theorem asserts that if we have a convergent series of positive terms, $u_{0} + u_{1} + u_{2} + \dots$ say, and form any other series

$$v_{0} + v_{1} + v_{2} + \dots$$

out of the same terms, by taking them in any new order, then the second series is convergent and has the same sum as the first. Of course no terms must be omitted: every $u$ must come somewhere among the $v'$s, and *vice versa*.

The proof is extremely simple. Let $s$ be the sum of the series of $u'$s. Then the sum of any number of terms, selected from the $u'$s, is not greater than $s$. But every $v$ is a $u$, and therefore the sum of any number of terms selected from the $v'$s is not greater than $s$. Hence $\sum v_{n}$ is convergent, and its sum $t$ is not greater than $s$. But we can show in exactly the same way that $s \leqq t$. Thus $s = t$.
''',
  'ch8-t3': r'''
An immediate corollary from Dirichlet’s Theorem is the following theorem:

if $u_{0} + u_{1} + u_{2} + \dots$ and $v_{0} + v_{1} + v_{2} + \dots$ are two convergent series of positive terms, and $s$ and $t$ are their respective sums, then the series

$$u_{0} v_{0} + (u_{1} v_{0} + u_{0} v_{1}) + (u_{2} v_{0} + u_{1} v_{1} + u_{0} v_{2}) + \dots$$

is convergent and has the sum $st$.

Arrange all the possible products of pairs $u_{m}v_{n}$ in the form of a doubly infinite array

$$\begin{array}{c|c|c|c|cc} u_{0}v_{0}& u_{1}v_{0}& u_{2}v_{0}& u_{3}v_{0}& \dots \\ u_{0}v_{1}& u_{1}v_{1}& u_{2}v_{1}& u_{3}v_{1}& \dots \\ u_{0}v_{2}& u_{1}v_{2}& u_{2}v_{2}& u_{3}v_{2}& \dots \\ u_{0}v_{3}& u_{1}v_{3}& u_{2}v_{3}& u_{3}v_{3}& \dots \\ \dots& \dots& \dots& \dots& \dots\;. \end{array}$$

We can rearrange these terms in the form of a simply infinite series in a variety of ways. Among these are the following.

(1) We begin with the single term $u_{0}v_{0}$ for which $m + n = 0$; then we take the two terms $u_{1}v_{0}$, $u_{0}v_{1}$ for which $m + n = 1$; then the three terms $u_{2}v_{0}$, $u_{1}v_{1}$, $u_{0}v_{2}$ for which $m + n = 2$; and so on. We thus obtain the series

$$u_{0}v_{0} + (u_{1}v_{0} + u_{0}v_{1}) + (u_{2}v_{0} + u_{1}v_{1} + u_{0}v_{2}) + \dots$$

of the theorem.

(2) We begin with the single term $u_{0}v_{0}$ for which both suffixes are zero; then we take the terms $u_{1}v_{0}$, $u_{1}v_{1}$, $u_{0}v_{1}$ which involve a suffix $1$ but no higher suffix; then the terms $u_{2}v_{0}$, $u_{2}v_{1}$, $u_{2}v_{2}$, $u_{1}v_{2}$, $u_{0}v_{2}$ which involve a suffix $2$ but no higher suffix; and so on. The sums of these groups of terms are respectively equal to

$$\begin{array}{c}\displaystyle u_{0}v_{0},\quad (u_{0} + u_{1})(v_{0} + v_{1}) - u_{0}v_{0},\\ \displaystyle (u_{0} + u_{1} + u_{2})(v_{0} + v_{1} + v_{2}) - (u_{0} + u_{1})(v_{0} + v_{1}),\ \dots \end{array}$$

and the sum of the first $n + 1$ groups is

$$(u_{0} + u_{1} + \dots + u_{n})(v_{0} + v_{1} + \dots + v_{n}),$$

and tends to $st$ as $n \to \infty$. When the sum of the series is formed in this manner the sum of the first one, two, three, … groups comprises all the terms in the first, second, third, … rectangles indicated in the diagram above.

The sum of the series formed in the second manner is $st$. But the first series is (when the brackets are removed) a rearrangement of the second; and therefore, by Dirichlet’s Theorem, it converges to the sum $st$. Thus the theorem is proved.
''',
  'ch8-t4': r'''
The examples on pp. [ref]311–[ref]313 suffice to show that there are simple and interesting types of series of positive terms which cannot be dealt with by the general tests of § 168. In fact, if we consider the simplest type of series, in which $u_{n+1}/u_{n}$ tends to a limit as $n \to \infty$, *the tests of § 168 generally fail when this limit is $1$*. Thus in Ex. lxvii. 5 these tests failed, and we had to fall back upon a special device, which was in essence that of using the series of Ex. lxvii. 4 as our comparison series, instead of the geometric series.

The fact is that the geometric series, by comparison with which the tests of § 168 were obtained, is not only convergent but *very rapidly* convergent, far more rapidly than is necessary in order to ensure convergence. The tests derived from comparison with it are therefore naturally very crude, and much more delicate tests are often wanted.

We proved in Ex. xxvii. 7 that $n^{k}r^{n} \to 0$ as $n \to \infty$, provided $r < 1$, whatever value $k$ may have; and in Ex. lxvii. 1 we proved more than this, viz. that the series $\sum n^{k}r^{n}$ is convergent. It follows that the sequence $r$, $r^{2}$, $r^{3}$, …, $r^{n}$, …, where $r < 1$, diminishes more rapidly than the sequence $1^{-k}$, $2^{-k}$, $3^{-k}$, …, $n^{-k}$, …. This seems at first paradoxical if $r$ is not much less than unity, and $k$ is large. Thus of the two sequences

$$\tfrac{2}{3},\quad \tfrac{4}{9},\quad \tfrac{8}{27},\ \dots;\qquad 1,\quad \tfrac{1}{4096},\quad \tfrac{1}{531,441},\ \dots$$

whose general terms are $(\frac{2}{3})^{n}$ and $n^{-12}$, the second seems at first sight to decrease far more rapidly. But this is far from being the case; if only we go far enough into the sequences we shall find the terms of the first sequence very much the smaller. For example,

$$(2/3)^{4} = 16/81 < 1/5,\quad (2/3)^{12} < (1/5)^{3} < (1/10)^{2},\quad (2/3)^{1000} < (1/10)^{166},$$

while

$$1000^{-12} = 10^{-36};$$

so that the $1000$th term of the first sequence is less than the $10^{130}$th part of the corresponding term of the second sequence. Thus the series $\sum (2/3)^{n}$ is far more rapidly convergent than the series $\sum n^{-12}$, and even this series is very much more rapidly convergent than $\sum n^{-2}$.
''',
  'ch8-t5': r'''
By far the most important application of the Integral Test is to the series

$$1^{-s} + 2^{-s} + 3^{-s} + \dots + n^{-s} + \dots,$$

where $s$ is any rational number. We have seen already (§ 77 and Exs. lxvii. 14, lxix. 1) that the series is divergent when $s = 1$.

If $s \leqq 0$ then it is obvious that the series is divergent. If $s > 0$ then $u_{n}$ decreases as $n$ increases, and we can apply the test. Here

$$\Phi(\xi) = \int_{1}^{\xi} \frac{dx}{x^{s}} = \frac{\xi^{1-s} - 1}{1 - s},$$

unless $s = 1$. If $s > 1$ then $\xi^{1-s} \to 0$ as $\xi \to \infty$, and

$$\Phi(\xi) \to \frac{1}{(s - 1)} = l,$$

say. And if $s < 1$ then $\xi^{1-s} \to \infty$ as $\xi \to \infty$, and so $\Phi(\xi) \to \infty$. Thus the series $\sum n^{-s}$ is convergent if $s > 1$, divergent if $s \leqq 1$, and in the first case its sum is less than $s/(s - 1)$.

So far as divergence for $s < 1$ is concerned, this result might have been derived at once from comparison with $\sum (1/n)$, which we already know to be divergent.

It is however interesting to see how the Integral Test may be applied to the series $\sum (1/n)$, when the preceding analysis fails. In this case

$$\Phi(\xi) = \int_{1}^{\xi} \frac{dx}{x},$$

and it is easy to see that $\Phi(\xi) \to \infty$ as $\xi \to \infty$. For if $\xi > 2^{n}$ then

$$\Phi(\xi) > \int_{1}^{2^{n}} \frac{dx}{x} = \int_{1}^{2} \frac{dx}{x} + \int_{2}^{4} \frac{dx}{x} + \dots + \int_{2^{n-1}}^{2^{n}} \frac{dx}{x}.$$

But by putting $x = 2^{r}u$ we obtain

$$\int_{2^{r}}^{2^{r+1}} \frac{dx}{x} = \int_{1}^{2} \frac{du}{u},$$

and so $\displaystyle \Phi(\xi) > n\int_{1}^{2} \frac{du}{u}$, which shows that $\Phi(\xi) \to \infty$ as $\xi \to \infty$.
''',
  'ch8-t6': r'''
The second of the two tests mentioned in § 172 is as follows:

if $u_{n} = \phi(n)$ is a decreasing function of $n$, then the series $\sum \phi(n)$ is convergent or divergent according as $\sum 2^{n}\phi(2^{n})$ is convergent or divergent.

We can prove this by an argument which we have used already (§ 77) in the special case of the series $\sum(1/n)$. In the first place

$$\begin{array}{c}\displaystyle \phi(3) + \phi(4) \geqq 2\phi(4), \\ \displaystyle \phi(5) + \phi(6) + \dots + \phi(8) \geqq 4\phi(8), \\ \displaystyle \cdots\cdots\cdots \\ \displaystyle \phi(2^{n} + 1) + \phi(2^{n} + 2) + \dots + \phi(2^{n+1}) \geqq 2^{n}\phi(2^{n+1}). \end{array}$$

If $\sum 2^{n}\phi(2^{n})$ diverges then so do $\sum 2^{n+1}\phi(2^{n+1})$ and $\sum 2^{n}\phi(2^{n+1})$, and then the inequalities just obtained show that $\sum\phi(n)$ diverges.

On the other hand

$$\phi(2) + \phi(3) \leqq 2\phi(2),\quad \phi(4) + \phi(5) + \dots + \phi(7) \leqq 4\phi(4),$$

and so on. And from this set of inequalities it follows that if $\sum 2^{n}\phi(2^{n})$ converges then so does $\sum \phi(n)$. Thus the theorem is established.

For our present purposes the field of application of this test is practically the same as that of the Integral Test. It enables us to discuss the series $\sum n^{-s}$ with equal ease. For $\sum n^{-s}$ will converge or diverge according as $\sum 2^{n}2^{-ns}$ converges or diverges, *i.e.* according as $s > 1$ or $s \leqq 1$.
''',
  'ch8-t7': r'''
The Integral Test of § 174 shows that, if $\phi(x)$ is a positive and decreasing function of $x$, then the series $\sum \phi(n)$ is convergent or divergent according as the integral function $\Phi(x)$ does or does not tend to a limit as $x \to \infty$. Let us suppose that it does tend to a limit, and that

$$\lim_{x \to \infty} \int_{1}^{x} \phi(t)\, dt = l.$$

Then we shall say that the integral

$$\int_{1}^{\infty} \phi(t)\, dt$$

is **convergent**, and has the value $l$; and we shall call the integral an **infinite integral**.

So far we have supposed $\phi(t)$ positive and decreasing. But it is natural to extend our definition to other cases. Nor is there any special point in supposing the lower limit to be unity. We are accordingly led to formulate the following definition:

If $\phi(t)$ is a function of $t$ continuous when $t \geqq a$, and

$$\lim_{x \to \infty} \int_{a}^{x} \phi(t)\, dt = l,$$

then we shall say that the infinite integral

$$\int_{a}^{\infty}\phi(t)\, dt \qquad\text{(1)}$$

is convergent and has the value $l$.

The ordinary integral between limits $a$ and $A$, as defined in Ch. VII, we shall sometimes call in contrast a **finite** integral.

On the other hand, when

$$\int_{a}^{x}\phi(t)\, dt \to \infty,$$

we shall say that the integral *diverges* to $\infty$, and we can give a similar definition of divergence to $-\infty$. Finally, when none of these alternatives occur, we shall say that the integral *oscillates*, *finitely* or *infinitely*, as $x \to \infty$.

These definitions suggest the following remarks.

(i) If we write

$$\int_{a}^{x}\phi(t)\, dt = \Phi(x),$$

then the integral converges, diverges, or oscillates according as $\Phi(x)$ tends to a limit, tends to $\infty$ (or to $-\infty$), or oscillates, as $x \to \infty$. If $\Phi(x)$ tends to a limit, which we may denote by $\Phi(\infty)$, then the value of the integral is $\Phi(\infty)$. More generally, if $\Phi(x)$ is any integral function of $\phi(x)$, then the value of the integral is $\Phi(\infty) - \Phi(a)$.
''',
  'ch8-t8': r'''
Our definitions of the sum of an infinite series, and the value of an infinite integral, whether of the first or the second kind, apply to series of terms or integrals of functions whose values may be either positive or negative. But the special tests for convergence or divergence which we have established in this chapter, and the examples by which we have illustrated them, have had reference almost entirely to the case in which all these values are positive. Of course the case in which they are all negative is not essentially different, as it can be reduced to the former by changing $u_{n}$ into $-u_{n}$ or $\phi(x)$ into $-\phi(x)$.

In the case of a series it has always been explicitly or tacitly assumed that any conditions imposed upon $u_{n}$ may be violated for a finite number of terms: all that is necessary is that such a condition (*e.g.* that all the terms are positive) should be satisfied *from some definite term onwards*. Similarly in the case of an infinite integral the conditions have been supposed to be satisfied *for all values of $x$ greater than some definite value*, or for all values of $x$ within some definite interval $[a, a + \delta]$ which includes the value $a$ near which the subject of integration tends to infinity. Thus our tests apply to such a series as

$$\sum \frac{n^{2} - 10}{n^{4}},$$

since $n^{2} - 10 > 0$ when $n \geqq 4$, and to such integrals as

$$\int_{1}^{\infty} \frac{3x - 7}{(x + 1)^{3}}\, dx,\quad \int_{0}^{1} \frac{1 - 2x}{\sqrt{x}}\, dx,$$

since $3x - 7 > 0$ when $x > \frac{7}{3}$, and $1 - 2x > 0$ when $0 < x < \frac{1}{2}$.

But when the changes of sign of $u_{n}$ *persist throughout the series*, *i.e.* when the number of both positive and negative terms is infinite, as in the series $1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} + \dots$; or when $\phi(x)$ continually changes sign as $x \to \infty$, as in the integral

$$\int_{1}^{\infty} \frac{\sin x}{x^{s}}\, dx,$$

or as $x \to a$, where $a$ is a point of discontinuity of $\phi(x)$, as in the integral

$$\int_{a}^{A} \sin\left(\frac{1}{x - a}\right) \frac{dx}{x - a};$$

then the problem of discussing convergence or divergence becomes more difficult. For now we have to consider the possibility of oscillation as well as of convergence or divergence.
''',
  'ch8-t9': r'''
Let us then consider a series $\sum u_{n}$ in which any term may be either positive or negative. Let

$$|u_{n}| = \alpha_{n},$$

so that $\alpha_{n} = u_{n}$ if $u_{n}$ is positive and $\alpha_{n} = -u_{n}$ if $u_{n}$ is negative. Further, let $v_{n} = u_{n}$ or $v_{n} = 0$, according as $u_{n}$ is positive or negative, and $w_{n} = -u_{n}$ or $w_{n} = 0$, according as $u_{n}$ is negative or positive; or, what is the same thing, let $v_{n}$ or $w_{n}$ be equal to $\alpha_{n}$ according as $u_{n}$ is positive or negative, the other being in either case equal to zero. Then it is evident that $v_{n}$ and $w_{n}$ are always positive, and that

$$u_{n} = v_{n} - w_{n},\quad \alpha_{n} = v_{n} + w_{n}.$$

If, for example, our series is $1 - (1/2)^{2} + (1/3)^{2} - \dots$, then $u_{n} = (-1)^{n-1}/n^{2}$ and $\alpha_{n} = 1/n^{2}$, while $v_{n} = 1/n^{2}$ or $v_{n} = 0$ according as $n$ is odd or even and $w_{n} = 1/n^{2}$ or $w_{n} = 0$ according as $n$ is even or odd.

We can now distinguish two cases.

A. Suppose that the series $\sum \alpha_{n}$ is convergent. This is the case, for instance, in the example above, where $\sum \alpha_{n}$ is

$$1 + (1/2)^{2} + (1/3)^{2} + \dots.$$

Then both $\sum v_{n}$ and $\sum w_{n}$ are convergent: for (Ex. xxx. 18) any series selected from the terms of a convergent series of positive terms is convergent. And hence, by theorem (6) of § 77, $\sum u_{n}$ or $\sum(v_{n} - w_{n})$ is convergent and equal to $\sum v_{n} - \sum w_{n}$.

We are thus led to formulate the following definition.

**Definition.** When $\sum \alpha_{n}$ or $\sum |u_{n}|$ is convergent, the series $\sum u_{n}$ is said to be **absolutely convergent**.

And what we have proved above amounts to this:

if $\sum u_{n}$ is absolutely convergent then it is convergent; so are the series formed by its positive and negative terms taken separately; and the sum of the series is equal to the sum of the positive terms plus the sum of the negative terms.
''',
  'ch8-t10': r'''
B. We have now to consider the second case indicated above, viz. that in which the series of moduli $\sum \alpha_{n}$ diverges to $\infty$.

**Definition.** If $\sum u_{n}$ is convergent, but $\sum |u_{n}|$ divergent, the original series is said to be **conditionally convergent**.

In the first place we note that, if $\sum u_{n}$ is conditionally convergent, then the series $\sum v_{n}$, $\sum w_{n}$ of § 184 must both diverge to $\infty$. For they obviously cannot both converge, as this would involve the convergence of $\sum(v_{n} + w_{n})$ or $\sum \alpha_{n}$. And if one of them, say $\sum w_{n}$, is convergent, and $\sum v_{n}$ divergent, then

$$\sum_{0}^{N} u_{n} = \sum_{0}^{N} v_{n} - \sum_{0}^{N} w_{n}, \qquad\text{(1)}$$

and therefore tends to $\infty$ with $N$, which is contrary to the hypothesis that $\sum u_{n}$ is convergent.

Hence $\sum v_{n}$, $\sum w_{n}$ are both divergent. It is clear from equation (1) above that the sum of a conditionally convergent series is the limit of the difference of two functions each of which tends to $\infty$ with $n$. It is obvious too that $\sum u_{n}$ no longer possesses the property of convergent series of positive terms (Ex. xxx. 18), and all absolutely convergent series (Ex. lxxvii. 5), that any selection from the terms itself forms a convergent series. And it seems more than likely that the property prescribed by Dirichlet’s Theorem will not be possessed by conditionally convergent series; at any rate the proof of § 185 fails completely, as it depended essentially on the convergence of $\sum v_{n}$ and $\sum w_{n}$ separately. We shall see in a moment that this conjecture is well founded, and that the theorem is not true for series such as we are now considering.

**187. Tests of convergence for conditionally convergent series.**

It is not to be expected that we should be able to find tests for conditional convergence as simple and general as those of §§ 167 *et seq.* It is naturally a much more difficult matter to formulate tests of convergence for series whose convergence, as is shown by equation (1) above, depends essentially on the cancelling of the positive by the negative terms. In the first instance *there are no comparison tests for convergence of conditionally convergent series*.
''',
  'ch8-t11': r'''
The simplest and most common conditionally convergent series are what is known as *alternating series*, series whose terms are alternately positive and negative. The convergence of the most important series of this type is established by the following theorem.

If $\phi(n)$ is a positive function of $n$ which tends **steadily** to zero as $n \to \infty$, then the series

$$\phi(0) - \phi(1) + \phi(2) - \dots$$

is convergent, and its sum lies between $\phi(0)$ and $\phi(0) - \phi(1)$.

Let us write $\phi_{0}$, $\phi_{1}$, … for $\phi(0)$, $\phi(1)$, …; and let

$$s_{n} = \phi_{0} - \phi_{1} + \phi_{2} - \dots + (-1)^{n}\phi_{n}.$$

Then

$$s_{2n+1} - s_{2n-1} = \phi_{2n} - \phi_{2n+1}\geqq 0,\quad s_{2n} - s_{2n-2} = -(\phi_{2n-1} - \phi_{2n}) \leqq 0.$$

Hence $s_{0}$, $s_{2}$, $s_{4}$, …, $s_{2n}$, … is a decreasing sequence, and therefore tends to a limit or to $-\infty$, and $s_{1}$, $s_{3}$, $s_{5}$, …, $s_{2n+1}$, … is an increasing sequence, and therefore tends to a limit or to $\infty$. But $\lim (s_{2n+1} - s_{2n}) = \lim (-1)^{2n+1} \phi_{2n+1} = 0$, from which it follows that both sequences must tend to limits, and that the two limits must be the same. That is to say, the sequence $s_{0}$, $s_{1}$, …, $s_{n}$, … tends to a limit. Since $s_{0} = \phi_{0}$, $s_{1} = \phi_{0} - \phi_{1}$, it is clear that this limit lies between $\phi_{0}$ and $\phi_{0} - \phi_{1}$.
''',
  'ch8-t12': r'''
A more general test, which includes the test of § 188 as a particular test case, is the following.

If $\phi_{n}$ satisfies the same conditions as in § 188, and $\sum a_{n}$ is any series which converges or oscillates finitely, then the series

$$a_{0}\phi_{0} + a_{1}\phi_{1} + a_{2}\phi_{2} + \dots$$

is convergent.

The reader will easily verify the identity

$$a_{0}\phi_{0} + a_{1}\phi_{1} + \dots + a_{n}\phi_{n} = s_{0}(\phi_{0} - \phi_{1}) + s_{1}(\phi_{1} - \phi_{2}) + \dots + s_{n-1}(\phi_{n-1} - \phi_{n}) + s_{n}\phi_{n},$$

where $s_{n} = a_{0} + a_{1} + \dots + a_{n}$. Now the series $(\phi_{0} - \phi_{1}) + (\phi_{1} - \phi_{2}) + \dots$ is convergent, since the sum to $n$ terms is $\phi_{0} - \phi_{n}$ and $\lim \phi_{n} = 0$; and all its terms are positive. Also since $\sum a_{n}$, if not actually convergent, at any rate oscillates finitely, we can determine a constant $K$ so that $|s_{\nu}| < K$ for all values of $\nu$. Hence the series

$$\textstyle\sum s_{\nu}(\phi_{\nu} - \phi_{\nu+1})$$

is absolutely convergent, and so

$$s_{0}(\phi_{0} - \phi_{1}) + s_{1}(\phi_{1} - \phi_{2}) + \dots + s_{n-1}(\phi_{n-1} - \phi_{n})$$

tends to a limit as $n \to \infty$. Also $\phi_{n}$, and therefore $s_{n}\phi_{n}$, tends to zero. And therefore

$$a_{0}\phi_{0} + a_{1}\phi_{1} + \dots + a_{n}\phi_{n}$$

tends to a limit, *i.e.* the series $\sum a_{\nu}\phi_{\nu}$ is convergent.

**Abel’s Test.** There is another test, due to Abel, which, though of less frequent application than Dirichlet’s, is sometimes useful.

Suppose that $\phi_{n}$, as in Dirichlet’s Test, is a positive and decreasing function of $n$, but that its limit as $n \to \infty$ is not necessarily zero. Thus we postulate less about $\phi_{n}$, but to make up for this we postulate more about $\sum a_{n}$, viz. that it is *convergent*. Then we have the theorem:

if $\phi_{n}$ is a positive and decreasing function of $n$, and $\sum a_{n}$ is convergent, then $\sum a_{n}\phi_{n}$ is convergent.

For $\phi_{n}$ has a limit as $n \to \infty$, say $l$: and $\lim (\phi_{n} - l) = 0$. Hence, by Dirichlet’s Test, $\sum a_{n}(\phi_{n} - l)$ is convergent; and as $\sum{a_{n}}$ is convergent it follows that $\sum a_{n}\phi_{n}$ is convergent.
''',
  'ch8-t13': r'''
So far we have confined ourselves to series all of whose terms are real. We shall now consider the series

$$\textstyle\sum u_{n} = \textstyle\sum (v_{n} + iw_{n}),$$

where $v_{n}$ and $w_{n}$ are real. The consideration of such series does not, of course, introduce anything really novel. The series is convergent if, and only if, the series

$$\textstyle\sum v_{n},\quad \textstyle\sum w_{n}$$

are separately convergent. There is however one class of such series so important as to require special treatment. Accordingly we give the following definition, which is an obvious extension of that of § 184.

**Definition.** The series $\sum u_{n}$, where $u_{n} = v_{n} + iw_{n}$, is said to be **absolutely convergent** if the series $\sum v_{n}$ and $\sum w_{n}$ are absolutely convergent.

**Theorem.** The necessary and sufficient condition for the absolute convergence of $\sum u_{n}$ is the convergence of $\sum |u_{n}|$ or $\sum \sqrt{v_{n}^{2} + w_{n}^{2}}$.

For if $\sum u_{n}$ is absolutely convergent, then both of the series $\sum |v_{n}|$, $\sum |w_{n}|$ are convergent, and so $\sum \{|v_{n}| + |w_{n}|\}$ is convergent: but

$$|u_{n}| = \sqrt{v_{n}^{2} + w_{n}^{2}} \leqq |v_{n}| + |w_{n}|,$$

and therefore $\sum |u_{n}|$ is convergent. On the other hand

$$|v_{n}| \leqq \sqrt{v_{n}^{2} + w_{n}^{2}},\quad |w_{n}| \leqq \sqrt{v_{n}^{2} + w_{n}^{2}},$$

so that $\sum |v_{n}|$ and $\sum |w_{n}|$ are convergent whenever $\sum |u_{n}|$ is convergent.

It is obvious that *an absolutely convergent series is convergent*, since its real and imaginary parts converge separately. And Dirichlet’s Theorem (§§ 169, 185) may be extended at once to absolutely convergent complex series by applying it to the separate series $\sum v_{n}$ and $\sum w_{n}$.

The convergence of an absolutely convergent series may also be deduced directly from the general principle of convergence (cf. Ex. lxxvii. 1). We leave this as an exercise to the reader.
''',
  'ch8-t14': r'''
One of the most important parts of the theory of the ordinary functions which occur in elementary analysis (such as the sine and cosine, and the logarithm and exponential, which will be discussed in the next chapter) is that which is concerned with their expansion in series of the form $\sum a_{n}x^{n}$. Such a series is called a **power series** in $x$. We have already come across some cases of expansion in series of this kind in connection with Taylor’s and Maclaurin’s series (§ 148). There, however, we were concerned only with a real variable $x$. We shall now consider a few general properties of power series in $z$, where $z$ is a complex variable.

A. A power series $\sum a_{n}z^{n}$ may be convergent for all values of $z$, for a certain region of values, or for no values except $z = 0$.

It is sufficient to give an example of each possibility.

1. *The series $\sum \dfrac{z^{n}}{n!}$ is convergent for all values of $z$.* For if $u_{n} = \dfrac{z^{n}}{n!}$ then

$$|u_{n+1}|/|u_{n}| = |z|/(n + 1) \to 0$$

as $n \to \infty$, whatever value $z$ may have. Hence, by d’Alembert’s Test, $\sum |u_{n}|$ is convergent for all values of $z$, and the original series is absolutely convergent for all values of $z$. We shall see later on that a power series, when convergent, is *generally* absolutely convergent.

2. *The series $\sum n!\, z^{n}$ is not convergent for any value of $z$ except $z = 0$.* For if $u_{n} = n!\, z^{n}$ then $|u_{n+1}|/|u_{n}| = (n + 1)|z|$, which tends to $\infty$ with $n$, unless $z = 0$. Hence (cf. Exs. xxvii. 1, 2, 5) the modulus of the $n$th term tends to $\infty$ with $n$; and so the series cannot converge, except when $z = 0$. It is obvious that any power series converges when $z = 0$.

3. *The series $\sum z^{n}$ is always convergent when $|z| < 1$, and never convergent when $|z| \geqq 1$.* This was proved in § 88. Thus we have an actual example of each of the three possibilities.
''',
  'ch8-t15': r'''
We saw in § 170 that if $\sum u_{n}$ and $\sum v_{n}$ are two convergent series of positive terms, then $\sum u_{n} \times \sum v_{n} = \sum w_{n}$, where

$$w_{n} = u_{0}v_{n} + u_{1}v_{n-1} + \dots + u_{n}v_{0}.$$

We can now extend this result to all cases in which $\sum u_{n}$ and $\sum v_{n}$ are *absolutely* convergent; for our proof was merely a simple application of Dirichlet’s Theorem, which we have already extended to all absolutely convergent series.
''',
  'ch9-t1': r'''
The number of essentially different types of functions with which we have been concerned in the foregoing chapters is not very large. Among those which have occurred the most important for ordinary purposes are polynomials, rational functions, algebraical functions, explicit or implicit, and trigonometrical functions, direct or inverse.

We are however far from having exhausted the list of functions which are important in mathematics. The gradual expansion of the range of mathematical knowledge has been accompanied by the introduction into analysis of one new class of function after another. These new functions have generally been introduced because it appeared that some problem which was occupying the attention of mathematicians was incapable of solution by means of the functions already known. The process may fairly be compared with that by which the irrational and complex numbers were first introduced, when it was found that certain algebraical equations could not be solved by means of the numbers already recognised. One of the most fruitful sources of new functions has been the problem of *integration*. Attempts have been made to integrate some function $f(x)$ in terms of functions already known. These attempts have failed; and after a certain number of failures it has begun to appear probable that the problem is insoluble. Sometimes it has been *proved* that this is so; but as a rule such a strict proof has not been forthcoming until later on. Generally it has happened that mathematicians have taken the impossibility for granted as soon as they have become reasonably convinced of it, and have introduced a new function $F(x)$ *defined* by its possessing the required property, viz. that $F'(x) = f(x)$. Starting from this definition, they have investigated the properties of $F(x)$; and it has then appeared that $F(x)$ has properties which no finite combination of the functions previously known could possibly have; and thus the correctness of the assumption that the original problem could not possibly be solved has been established. One such case occurred in the preceding pages, when in Ch. VI we defined the function $\log x$ by means of the equation

$$\log x = \int \frac{dx}{x}.$$

Let us consider what grounds we have for supposing $\log x$ to be a really new function. We have seen already (Ex. xlii. 4) that it cannot be a rational function, since the derivative of a rational function is a rational function whose denominator contains only repeated factors. The question whether it can be an algebraical or trigonometrical function is more difficult. But it is very easy to become convinced by a few experiments that differentiation will never get rid of algebraical irrationalities. For example, the result of differentiating $\sqrt{1 + x}$ any number of times is always the product of $\sqrt{1 + x}$ by a rational function, and so generally. The reader should test the correctness of the statement by experimenting with a number of examples. Similarly, if we differentiate a function which involves $\sin x$ or $\cos x$, one or other of these functions persists in the result.
''',
  'ch9-t2': r'''
*The function $\log x$ satisfies the functional equation*

$$f(xy) = f(x) + f(y). \qquad\text{(1)}$$

For, making the substitution $t = yu$, we see that

$$\begin{aligned} \log xy &= \int_{1}^{xy} \frac{dt}{t} = \int_{1/y}^{x} \frac{du}{u} = \int_{1}^{x} \frac{du}{u} - \int_{1}^{1/y} \frac{du}{u}\\ &= \log x - \log(1/y) = \log x + \log y, \end{aligned}$$

which proves the theorem.
''',
  'ch9-t3': r'''
It will be remembered that in Ex. xxxvi. 6 we defined certain different ways in which a function of $x$ may tend to infinity with $x$, distinguishing between functions which, when $x$ is large, are of the first, second, third, … orders of greatness. A function $f(x)$ was said to be of the $k$th order of greatness when $f(x)/x^{k}$ tends to a limit different from zero as $x$ tends to infinity.

It is easy to define a whole series of functions which tend to infinity with $x$, but whose order of greatness is smaller than the first. Thus $\sqrt{x}$, $\sqrt[3]{x}$, $\sqrt[4]{x}$, … are such functions. We may say generally that $x^{\alpha}$, where $\alpha$ is any positive rational number, is of the $\alpha$th order of greatness when $x$ is large. We may suppose $\alpha$ as small as we please, *e.g.* less than $.000\,000\,1$. And it might be thought that by giving $\alpha$ all possible values we should exhaust the possible ‘orders of infinity’ of $f(x)$. At any rate it might be supposed that if $f(x)$ tends to infinity with $x$, however slowly, we could always find a value of $\alpha$ so small that $x^{\alpha}$ would tend to infinity more slowly still; and, conversely, that if $f(x)$ tends to infinity with $x$, however rapidly, we could always find a value of $\alpha$ so great that $x^{\alpha}$ would tend to infinity more rapidly still.

Perhaps the most interesting feature of the function $\log x$ is its behaviour as $x$ tends to infinity. It shows that the presupposition stated above, which seems so natural, is unfounded. *The logarithm of $x$ tends to infinity with $x$, but more slowly than **any** positive power of $x$, integral or fractional.* In other words $\log x \to \infty$ but

$$\frac{\log x}{x^{\alpha}} \to 0$$

for *all* positive values of $\alpha$. This fact is sometimes expressed loosely by saying that the ‘order of infinity of $\log x$ is infinitely small’; but the reader will hardly require at this stage to be warned against such modes of expression.
''',
  'ch9-t4': r'''
Let us consider once more the series of functions

$$x,\quad \sqrt{x},\quad \sqrt[3]{x},\ \dots,\quad \sqrt[n]{x},\ \dots,$$

which possesses the property that, if $f(x)$ and $\phi(x)$ are any two of the functions contained in it, then $f(x)$ and $\phi(x)$ both tend to $\infty$ as $x \to \infty$, while $f(x)/\phi(x)$ tends to $0$ or to $\infty$ according as $f(x)$ occurs to the right or the left of $\phi(x)$ in the series. We can now continue this series by the insertion of new terms to the right of all those already written down. We can begin with $\log x$, which tends to infinity more slowly than any of the old terms. Then $\sqrt{\log x}$ tends to $\infty$ more slowly than $\log x$, $\sqrt[3]{\log x}$ than $\sqrt{\log x}$, and so on. Thus we obtain a series

$$x,\quad \sqrt{x},\quad \sqrt[3]{x},\ \dots,\quad \sqrt[n]{x},\ \dots\quad \log x,\quad \sqrt{\log x},\quad \sqrt[3]{\log x},\ \dots\quad \sqrt[n]{\log x},\ \dots$$

formed of two simply infinite series arranged one after the other. But this is not all. Consider the function $\log\log x$, the logarithm of $\log x$. Since $(\log x)/x^{\alpha} \to 0$, for all positive values of $\alpha$, it follows on putting $x = \log y$ that

$$(\log\log y)/(\log y)^{\alpha} = (\log x)/x^{\alpha} \to 0.$$

Thus $\log\log y$ tends to $\infty$ with $y$, but more slowly than any power of $\log y$. Hence we may continue our series in the form

$$\begin{array}{c}\displaystyle x,\quad \sqrt{x},\quad \sqrt[3]{x},\ \dots\qquad \log x,\quad \sqrt{\log x},\quad \sqrt[3]{\log x},\ \dots\\ \displaystyle \log\log x,\quad \sqrt{\log\log x},\ \dots\quad \sqrt[n]{\log\log x},\ \dots; \end{array}$$

and it will by now be obvious that by introducing the functions $\log\log\log x$, $\log\log\log\log x$, … we can prolong the series to any extent we like. By putting $x = 1/y$ we obtain a similar scale of infinity for functions of $y$ which tend to $\infty$ as $y$ tends to $0$ by positive values.
''',
  'ch9-t5': r'''
We shall now introduce a number, usually denoted by $e$, which is of immense importance in higher mathematics. It is, like $\pi$, one of the fundamental constants of analysis.

We define $e$ as *the number whose logarithm is $1$*. In other words $e$ is defined by the equation

$$1 = \int_{1}^{e} \frac{dt}{t}.$$

Since $\log x$ is an increasing function of $x$, in the stricter sense of § 95, it can only pass once through the value $1$. Hence our definition does in fact define one definite number.

Now $\log xy = \log x + \log y$ and so

$$\log x^{2} = 2\log x,\quad \log x^{3} = 3\log x,\ \dots,\quad \log x^{n} = n\log x,$$

where $n$ is any positive integer. Hence

$$\log e^{n} = n\log e = n.$$

Again, if $p$ and $q$ are any positive integers, and $e^{p/q}$ denotes the positive $q$th root of $e^{p}$, we have

$$p = \log e^{p} = \log(e^{p/q})^{q} = q\log e^{p/q},$$

so that $\log e^{p/q} = p/q$. Thus, if $y$ has any positive rational value, and $e^{y}$ denotes the positive $y$th power of $e$, we have

$$\log e^{y} = y, \qquad\text{(1)}$$

and $\log e^{-y} = -\log e^{y} = -y$. Hence the equation (1) is true for all rational values of $y$, positive or negative. In other words the equations

$$y = \log x,\quad x = e^{y} \qquad\text{(2)}$$

are consequences of one another so long as $y$ is rational and $e^{y}$ has its positive value. At present we have not given any definition of a power such as $e^{y}$ in which the index is irrational, and the function $e^{y}$ is defined for rational values of $y$ only.
''',
  'ch9-t6': r'''
We now define the *exponential function* $e^{y}$ for all real values of $y$ as the inverse of the logarithmic function. In other words we write

$$x = e^{y}$$

if $y = \log x$.

We saw that, as $x$ varies from $0$ towards $\infty$, $y$ increases steadily, in the stricter sense, from $-\infty$ towards $\infty$. Thus to one value of $x$ corresponds one value of $y$, and conversely. Also $y$ is a continuous function of $x$, and it follows from § 109 that $x$ is likewise a continuous function of $y$.

It is easy to give a direct proof of the continuity of the exponential function. For if $x = e^{y}$ and $x + \xi = e^{y+\eta}$ then

$$\eta = \int_{x}^{x+\xi} \frac{dt}{t}.$$

Thus $|\eta|$ is greater than $\xi/(x + \xi)$ if $\xi > 0$, and than $|\xi|/x$ if $\xi < 0$; and if $\eta$ is very small $\xi$ must also be very small.

Thus $e^{y}$ is a positive and continuous function of $y$ which increases steadily from $0$ towards $\infty$ as $y$ increases from $-\infty$ towards $\infty$. Moreover $e^{y}$ is the positive $y$th power of the number $e$, in accordance with the elementary definitions, whenever $y$ is a rational number. In particular $e^{y} = 1$ when $y = 0$. The general form of the graph of $e^{y}$ is as shown in Fig. 53.

**205. The principal properties of the exponential function.**

(1) If $x = e^{y}$, so that $y = \log x$, then $dy/dx = 1/x$ and

$$\frac{dx}{dy} = x = e^{y}.$$

Thus *the derivative of the exponential function is equal to the function itself*. More generally, if $x = e^{ay}$ then $dx/dy = ae^{ay}$.

(2) *The exponential function satisfies the functional equation*

$$f(y + z) = f(y)f(z).$$

This follows, when $y$ and $z$ are rational, from the ordinary rules of indices. If $y$ or $z$, or both, are irrational then we can choose two sequences $y_{1}$, $y_{2}$, …, $y_{n}$, … and $z_{1}$, $z_{2}$, …, $z_{n}$, … of rational numbers such that $\lim y_{n} = y$, $\lim z_{n} = z$. Then, since the exponential function is continuous, we have

$$e^{y} \times e^{z} = \lim e^{y_{n}} \times \lim e^{z_{n}} = \lim e^{y_{n}+z_{n}} = e^{y+z}.$$

In particular $e^{y} \times e^{-y} = e^{0} = 1$, or $e^{-y} = 1/e^{y}$.
''',
  'ch9-t7': r'''
The function $a^{x}$ has been defined only for rational values of $x$, except in the particular case when $a = e$. We shall now consider the case in which $a$ is any positive number. Suppose that $x$ is a positive rational number $p/q$. Then the positive value $y$ of the power $a^{p/q}$ is given by $y^{q} = a^{p}$; from which it follows that

$$q\log y = p\log a,\quad \log y = (p/q)\log a = x\log a,$$

and so

$$y = e^{x\log a}.$$

We take this as our *definition* of $a^{x}$ when $x$ is irrational. Thus $10^{\sqrt{2}} = e^{\sqrt{2}\log 10}$. It is to be observed that $a^{x}$, when $x$ is irrational, is defined only for positive values of $a$, and is itself essentially positive; and that $\log a^{x} = x\log a$. The most important properties of the function $a^{x}$ are as follows.

(1) Whatever value $a$ may have, $a^{x} \times a^{y} = a^{x+y}$ and $(a^{x})^{y} = a^{xy}$. In other words the laws of indices hold for irrational no less than for rational indices. For, in the first place,

$$a^{x} \times a^{y} = e^{x\log a} \times e^{y\log a} = e^{(x+y)\log a} = a^{x+y};$$

and in the second

$$(a^{x})^{y} = e^{y\log a^{x}} = e^{xy\log a} = a^{xy}.$$

(2) If $a > 1$ then $a^{x} = e^{x\log a} = e^{\alpha x}$, where $\alpha$ is positive. The graph of $a^{x}$ is in this case similar to that of $e^{x}$, and $a^{x} \to \infty$ as $x \to \infty$, more rapidly than any power of $x$.

If $a < 1$ then $a^{x} = e^{x\log a} = e^{-\beta x}$, where $\beta$ is positive. The graph of $a^{x}$ is then similar in shape to that of $e^{x}$, but reversed as regards right and left, and $a^{x} \to 0$ as $x \to \infty$, more rapidly than any power of $1/x$.

(3) $a^{x}$ is a continuous function of $x$, and

$$D_{x} a^{x} = D_{x} e^{x\log a} = e^{x\log a} \log a = a^{x} \log a.$$

(4) $a^{x}$ is also a continuous function of $a$, and

$$D_{a} a^{x} = D_{a} e^{x\log a} = e^{x\log a} (x/a) = xa^{x-1}.$$

(5) $(a^{x} - 1)/x \to \log a$ as $x \to 0$. This of course is a mere corollary from the fact that $D_{x}a^{x} = a^{x}\log a$, but the particular form of the result is often useful; it is of course equivalent to the result (Ex. lxxxv. 3) that $(e^{\alpha x} - 1)/x \to \alpha$ as $x \to 0$.
''',
  'ch9-t8': r'''
In Ch. IV, § 73, we proved that $\{1 + (1/n)\}^{n}$ tends, as $n \to \infty$, to a limit which we denoted provisionally by $e$. We shall now identify this limit with the number $e$ of the preceding sections. We can however establish a more general result, viz. that expressed by the equations

$$\lim_{n\to\infty} \left(1 + \frac{x}{n}\right)^{n} = \lim_{n\to\infty} \left(1 - \frac{x}{n}\right)^{-n} = e^{x}. \qquad\text{(1)}$$

As the result is of very great importance, we shall indicate alternative lines of proof.

(1) Since

$$\frac{d}{dt} \log(1 + xt) = \frac{x}{1 + xt},$$

it follows that

$$\lim_{h\to 0} \frac{\log(1 + xh)}{h} = x.$$

If we put $h = 1/\xi$, we see that

$$\lim \xi \log\left(1 + \frac{x}{\xi}\right) = x$$

as $\xi \to \infty$ or $\xi \to -\infty$. Since the exponential function is continuous it follows that

$$\left(1 + \frac{x}{\xi}\right)^{\xi} = e^{\xi\log\{1+(x/\xi)\}} \to e^{x}$$

as $\xi \to \infty$ or $\xi \to -\infty$: *i.e.* that

$$\lim_{\xi\to\infty} \left(1 + \frac{x}{\xi}\right)^{\xi} = \lim_{\xi\to -\infty} \left(1 + \frac{x}{\xi}\right)^{\xi} = e^{x}. \qquad\text{(2)}$$

If we suppose that $\xi \to \infty$ or $\xi \to -\infty$ through integral values only, we obtain the result expressed by the equations (1).

(2) If $n$ is any positive integer, however large, and $x > 1$, we have

$$\int_{1}^{x} \frac{dt}{t^{1+(1/n)}} < \int_{1}^{x} \frac{dt}{t} < \int_{1}^{x} \frac{dt}{t^{1-(1/n)}},$$

or

$$n(1 - x^{-1/n}) < \log x < n(x^{1/n} - 1). \qquad\text{(3)}$$

Writing $y$ for $\log x$, so that $y$ is positive and $x = e^{y}$, we obtain, after some simple transformations,

$$\left(1 + \frac{y}{n}\right)^{n} < x < \left(1 - \frac{y}{n}\right)^{-n}. \qquad\text{(4)}$$

Now let

$$1 + \frac{y}{n} = \eta_{1},\quad 1 - \frac{y}{n} = \frac{1}{\eta_{2}}.$$

Then $0 < \eta_{1} < \eta_{2}$, at any rate for sufficiently large values of $n$; and, by (9) of § 74,

$$\eta_{2}^{n} - \eta_{1}^{n} < n\eta_{2}^{n-1} (\eta_{2} - \eta_{1}) = y^{2}\eta_{2}^{n}/n,$$

which evidently tends to $0$ as $n \to \infty$. The result now follows from the inequalities (4). The more general result (2) may be proved in the same way, if we replace $1/n$ by a continuous variable $h$.
''',
  'ch9-t9': r'''
We can also prove (cf. § 75) that

$$\lim n(1 - x^{-1/n}) = \lim n(x^{1/n} - 1) = \log x.$$

For

$$n(x^{1/n} - 1) - n(1 - x^{-1/n}) = n(x^{1/n} - 1)(1 - x^{-1/n}),$$

which tends to zero as $n \to \infty$, since $n(x^{1/n} - 1)$ tends to a limit (§ 75) and $x^{-1/n}$ to $1$ (Ex. xxvii. 10). The result now follows from the inequalities (3) of § 208.
''',
  'ch9-t10': r'''
The reader is probably familiar with the idea of a logarithm and its use in numerical calculation. He will remember that in elementary algebra $\log_{a} x$, the logarithm of $x$ to the base $a$, is defined by the equations

$$x = a^{y},\quad y = \log_{a} x.$$

This definition is of course applicable only when $y$ is rational, though this point is often passed over in silence.

Our logarithms are therefore logarithms to the base $e$. For numerical work logarithms to the base $10$ are used. If

$$y = \log x = \log_{e} x,\quad z = \log_{10} x,$$

then $x = e^{y}$ and also $x = 10^{z} = e^{z\log 10}$, so that

$$\log_{10} x = (\log_{e} x)/(\log_{e} 10).$$

Thus it is easy to pass from one system to the other when once $\log_{e} 10$ has been calculated.

It is no part of our purpose in this book to go into details concerning the practical uses of logarithms. If the reader is not familiar with them he should consult some text-book on Elementary Algebra or Trigonometry.
''',
  'ch9-t11': r'''
We showed in Ch. VIII (§§ 175 *et seq.*) that

$$\sum_{1}^{\infty} \frac{1}{n^{s}},\quad \int_{a}^{\infty} \frac{dx}{x^{s}}\qquad (a > 0)$$

are convergent if $s > 1$ and divergent if $s \leqq 1$. Thus $\sum (1/n)$ is divergent, but $\sum n^{-1-\alpha}$ is convergent for all positive values of $\alpha$.

We saw however in § 200 that with the aid of logarithms we can construct functions which tend to zero, as $n \to \infty$, more rapidly than $1/n$, yet less rapidly than $n^{-1-\alpha}$, however small $\alpha$ may be, provided of course that it is positive. For example $1/(n\log n)$ is such a function, and the question as to whether the series

$$\sum \frac{1}{n\log n}$$

is convergent or divergent cannot be settled by comparison with any series of the type $\sum n^{-s}$.

The same is true of such series as

$$\sum \frac{1}{n(\log n)^{2}},\quad \sum \frac{\log\log n}{n\sqrt{\log n}}.$$

It is a question of some interest to find tests which shall enable us to decide whether series such as these are convergent or divergent; and such tests are easily deduced from the Integral Test of § 174.

For since

$$D_{x}(\log x)^{1-s} = \frac{1 - s}{x(\log x)^{s}},\quad D_{x}\log\log x = \frac{1}{x\log x},$$

we have

$$\int_{a}^{\xi} \frac{dx}{x(\log x)^{s}} = \frac{(\log\xi)^{1-s} - (\log a)^{1-s}}{1 - s},\quad \int_{a}^{\xi} \frac{dx}{x\log x} = \log\log \xi - \log\log a,$$

if $a > 1$. The first integral tends to the limit $-(\log a)^{1-s}/(1 - s)$ as $\xi \to \infty$, if $s > 1$, and to $\infty$ if $s < 1$. The second integral tends to $\infty$. Hence the series and integral

$$\sum_{n_{0}}^{\infty} \frac{1}{n(\log n)^{s}},\quad \int_{a}^{\infty} \frac{dx}{x(\log x)^{s}},$$

where $n_{0}$ and $a$ are greater than unity, are convergent if $s > 1$, divergent if $s \leqq 1$.

It follows, of course, that $\sum \phi(n)$ is convergent if $\phi(n)$ is positive and less than $K/\{n(\log n)^{s}\}$, where $s > 1$, for all values of $n$ greater than some definite value, and divergent if $\phi(n)$ is positive and greater than $K/(n\log n)$ for all values of $n$ greater than some definite value. And there is a corresponding theorem for integrals which we may leave to the reader.
''',
  'ch9-t12': r'''
Since all the derivatives of the exponential function are equal to the function itself, we have

$$e^{x} = 1 + x + \frac{x^{2}}{2!} + \dots + \frac{x^{n-1}}{(n - 1)!} + \frac{x^{n}}{n!} e^{\theta x}$$

where $0 < \theta < 1$. But $x^{n}/n! \to 0$ as $n \to \infty$, whatever be the value of $x$ (Ex. xxvii. 12); and $e^{\theta x} < e^{x}$. Hence, making $n$ tend to $\infty$, we have

$$e^{x} = 1 + x + \frac{x^{2}}{2!} + \dots + \frac{x^{n}}{n!} + \dots. \qquad\text{(1)}$$

The series on the right-hand side of this equation is known as the **exponential series**. In particular we have

$$e = 1 + 1 + \frac{1}{2!} + \dots + \frac{1}{n!} + \dots; \qquad\text{(2)}$$

and so

$$\left(1 + 1 + \frac{1}{2!} + \dots + \frac{1}{n!} + \dots\right)^{x} = 1 + x + \frac{x^{2}}{2!} + \dots + \frac{x^{n}}{n!} + \dots, \qquad\text{(3)}$$

a result known as the **exponential theorem**. Also

$$a^{x} = e^{x\log a} = 1 + (x\log a) + \frac{(x\log a)^{2}}{2!} + \dots \qquad\text{(4)}$$

for all positive values of $a$.

The reader will observe that the exponential series has the property of reproducing itself when every term is differentiated, and that no other series of powers of $x$ would possess this property: for some further remarks in this connection see Appendix II\@.

The power series for $e^{x}$ is so important that it is worth while to investigate it by an alternative method which does not depend upon Taylor’s Theorem. Let

$$E_{n}(x) = 1 + x + \frac{x^{2}}{2!} + \dots + \frac{x^{n}}{n!},$$

and suppose that $x > 0$. Then

$$\left(1 + \frac{x}{n}\right)^{n} = 1 + n\left(\frac{x}{n}\right) + \frac{n(n - 1)}{1\cdot 2} \left(\frac{x}{n}\right)^{2} + \dots + \frac{n(n - 1)\dots 1}{1\cdot 2\dots n} \left(\frac{x}{n}\right)^{n},$$

which is less than $E_{n}(x)$. And, provided $n > x$, we have also, by the binomial theorem for a negative integral exponent,

$$\left(1 - \frac{x}{n}\right)^{-n} = 1 + n\left(\frac{x}{n}\right) + \frac{n(n + 1)}{1\cdot 2} \left(\frac{x}{n}\right)^{2} + \dots > E_{n}(x).$$

Thus

$$\left(1 + \frac{x}{n}\right)^{n} < E_{n}(x) < \left(1 - \frac{x}{n}\right)^{-n}.$$

But (§ 208) the first and last functions tend to the limit $e^{x}$ as $n \to \infty$, and therefore $E_{n}(x)$ must do the same. From this the equation (1) follows when $x$ is positive; its truth when $x$ is negative follows from the fact that the exponential series, as was shown in Ex. lxxxi. 7, satisfies the functional equation $f(x)f(y) = f(x + y)$, so that $f(x)f(-x) = f(0) = 1$.
''',
  'ch9-t13': r'''
Another very important expansion in powers of $x$ is that for $\log(1 + x)$. Since

$$\log(1 + x) = \int_{0}^{x} \frac{dt}{1 + t},$$

and $1/(1 + t) = 1 - t + t^{2} - \dots$ if $t$ is numerically less than unity, it is natural to expect that $\log(1 + x)$ will be equal, when $-1 < x < 1$, to the series obtained by integrating each term of the series $1 - t + t^{2} - \dots$ from $t = 0$ to $t = x$, *i.e.* to the series $x - \frac{1}{2} x^{2} + \frac{1}{3} x^{3} - \dots$. And this is in fact the case. For

$$1/(1 + t) = 1 - t + t^{2} - \dots + (-1)^{m-1} t^{m-1} + \frac{(-1)^{m} t^{m}}{1 + t},$$

and so, if $x > -1$,

$$\log(1 + x) = \int_{0}^{x} \frac{dt}{1 + t} = x - \frac{x^{2}}{2} + \dots + (-1)^{m-1} \frac{x^{m}}{m} + (-1)^{m} R_{m},$$

where

$$R_{m} = \int_{0}^{x} \frac{t^{m}\, dt}{1 + t}.$$

We require to show that the limit of $R_{m}$, when $m$ tends to $\infty$, is zero. This is almost obvious when $0 < x \leqq 1$; for then $R_{m}$ is positive and less than

$$\int_{0}^{x} t^{m}\, dt = \frac{x^{m+1}}{m + 1},$$

and therefore less than $1/(m + 1)$. If on the other hand $-1 < x < 0$, we put $t = -u$ and $x = -\xi$, so that

$$R_{m} = (-1)^{m} \int_{0}^{\xi} \frac{u^{m}\, du}{1 - u},$$

which shows that $R_{m}$ has the sign of $(-1)^{m}$. Also, since the greatest value of $1/(1 - u)$ in the range of integration is $1/(1 - \xi)$, we have

$$0 < |R_{m}| < \frac{1}{1 - \xi} \int_{0}^{\xi} u^{m}\, du = \frac{\xi^{m}}{(m + 1)(1 - \xi)} < \frac{1}{(m + 1)(1 - \xi)}:$$

and so $R_{m} \to 0$.

Hence

$$\log(1 + x) = x - \tfrac{1}{2} x^{2} + \tfrac{1}{3} x^{3} - \dots,$$

provided that $-1 < x \leqq 1$. If $x$ lies outside these limits the series is not convergent. If $x = 1$ we obtain

$$\log 2 = 1 - \tfrac{1}{2} + \tfrac{1}{3} - \dots,$$

a result already proved otherwise (Ex. lxxxix. 7).
''',
  'ch9-t14': r'''
It is easy to prove in a similar manner that

$$\begin{aligned} {\operatorname{arc\,tan}} x = \int_{0}^{x} \frac{dt}{1 + t^{2}} &= \int_{0}^{x}(1 - t^{2} + t^{4} - \dots)\, dt\\ &= x - \tfrac{1}{3} x^{3} + \tfrac{1}{5} x^{5} - \dots, \end{aligned}$$

provided that $-1 \leqq x \leqq 1$. The only difference is that the proof is a little simpler; for, since ${\operatorname{arc\,tan}} x$ is an odd function of $x$, we need only consider positive values of $x$. And the series is convergent when $x = -1$ as well as when $x = 1$. We leave the discussion to the reader. The value of ${\operatorname{arc\,tan}} x$ which is represented by the series is of course that which lies between $-\frac{1}{4}\pi$ and $\frac{1}{4}\pi$ when $-1 \leqq x \leqq 1$, and which we saw in Ch. VII (Ex. lxiii. 3) to be the value represented by the integral. If $x = 1$, we obtain the formula

$$\tfrac{1}{4}\pi = 1 - \tfrac{1}{3} + \tfrac{1}{5} - \dots.$$
''',
  'ch9-t15': r'''
We have already (§ 163) investigated the Binomial Theorem

$$(1 + x)^{m} = 1 + \binom{m}{1}x + \binom{m}{2}x^{2} + \dots,$$

assuming that $-1 < x < 1$ and that $m$ is rational. When $m$ is irrational we have

$$\begin{array}{c}\displaystyle (1 + x)^{m} = e^{m\log(1+ x)},\\ \displaystyle D_{x}(1 + x)^{m} = \{m/(1 + x)\} e^{m\log(1 + x)} = m(1 + x)^{m-1}, \end{array}$$

so that the rule for the differentiation of $(1 + x)^{m}$ remains the same, and the proof of the theorem given in § 163 retains its validity. We shall not discuss the question of the convergence of the series when $x = 1$ or $x = -1$.
''',
  'ch9-t16': r'''
We shall now give an outline of a method of investigation of the properties of $e^{x}$ and $\log x$ entirely different in logical order from that followed in the preceding pages. This method starts from the exponential series $1 + x + \dfrac{x^{2}}{2!} + \dots$. We know that this series is convergent for all values of $x$, and we may therefore define the function $\exp x$ by the equation

$$\exp x = 1 + x + \frac{x^{2}}{2!} + \dots. \qquad\text{(1)}$$

We then prove, as in Ex. lxxxi. 7, that

$$\exp x \times \exp y = \exp(x + y). \qquad\text{(2)}$$

Again

$$\frac{\exp h - 1}{h} = 1 + \frac{h}{2!} + \frac{h^{2}}{3!} + \dots = 1 + \rho(h),$$

where $\rho(h)$ is numerically less than

$$|\tfrac{1}{2}h| + |\tfrac{1}{2}h|^{2} + |\tfrac{1}{2}h|^{3} + \dots = |\tfrac{1}{2}h|/(1 - |\tfrac{1}{2}h|),$$

so that $\rho(h) \to 0$ as $h \to 0$. And so

$$\frac{\exp(x + h) - \exp x}{h} = \exp x \left(\frac{\exp h - 1}{h}\right) \to \exp x$$

as $h \to 0$, or

$$D_{x} \exp x = \exp x. \qquad\text{(3)}$$

Incidentally we have proved that $\exp x$ is a continuous function.

We have now a choice of procedure. Writing $y = \exp x$ and observing that $\exp 0 = 1$, we have

$$\frac{dy}{dx} = y,\quad x = \int_{1}^{y} \frac{dt}{t},$$

and, if we define the logarithmic function as the function inverse to the exponential function, we are brought back to the point of view adopted earlier in this chapter.

But we may proceed differently. From (2) it follows that if $n$ is a positive integer then

$$(\exp x)^{n} = \exp nx,\quad (\exp 1)^{n} = \exp n.$$

If $x$ is a positive rational fraction $m/n$, then

$$\{\exp(m/n)\}^{n} = \exp m = (\exp 1)^{m},$$

and so $\exp(m/n)$ is equal to the positive value of $(\exp 1)^{m/n}$. This result may be extended to negative rational values of $x$ by means of the equation

$$\exp x \exp(-x) = 1;$$

and so we have

$$\exp x = (\exp 1)^{x} = e^{x},$$

say, where

$$e = \exp 1 = 1 + 1 + \frac{1}{2!} + \frac{1}{3!} + \dots,$$

for all rational values of $x$. Finally we define $e^{x}$, when $x$ is irrational, as being equal to $\exp x$. The logarithm is then defined as the function inverse to $\exp x$ or $e^{x}$.
''',
  'ch10-t1': r'''
In Ch. III we defined the complex variable

$$z = x + iy,$$

and we considered a few simple properties of some classes of expressions involving $z$, such as the polynomial $P(z)$. It is natural to describe such expressions as *functions* of $z$, and in fact we did describe the quotient $P(z)/Q(z)$, where $P(z)$ and $Q(z)$ are polynomials, as a ‘rational function’. We have however given no general definition of what is meant by a function of $z$.

It might seem natural to define a function of $z$ in the same way as that in which we defined a function of the real variable $x$, *i.e.* to say that $Z$ is a function of $z$ if any relation subsists between $z$ and $Z$ in virtue of which a value or values of $Z$ corresponds to some or all values of $z$. But it will be found, on closer examination, that this definition is not one from which any profit can be derived. For if $z$ is given, so are $x$ and $y$, and conversely: to assign a value of $z$ is precisely the same thing as to assign a pair of values of $x$ and $y$. Thus a ‘function of $z$’, according to the definition suggested, is precisely the same thing as a complex function

$$f(x, y) + ig(x, y),$$

of the two real variables $x$ and $y$. For example

$$x - iy,\quad xy,\quad |z| = \sqrt{x^{2} + y^{2}},\quad {\operatorname{am}} z = {\operatorname{arc\,tan}}(y/x)$$

are ‘functions of $z$’. The definition, although perfectly legitimate, is futile because it does not really define a new idea at all. It is therefore more convenient to use the expression ‘function of the complex variable $z$’ in a more restricted sense, or in other words to pick out, from the general class of complex functions of the two real variables $x$ and $y$, a special class to which the expression shall be restricted. But if we were to attempt to explain how this selection is made, and what are the characteristic properties of the special class of functions selected, we should be led far beyond the limits of this book. We shall therefore not attempt to give any general definitions, but shall confine ourselves entirely to special functions defined directly.
''',
  'ch10-t2': r'''
Let $AB$ be an arc $C$ of a curve defined by the equations

$$x = \phi(t),\quad y = \psi(t),$$

where $\phi$ and $\psi$ are functions of $t$ with continuous differential coefficients $\phi'$ and $\psi'$; and suppose that, as $t$ varies from $t_{0}$ to $t_{1}$, the point $(x, y)$ moves along the curve, in the same direction, from $A$ to $B$.

Then we define the *curvilinear integral*

$$\int_{C} \{g(x, y)\, dx + h(x, y)\, dy\}, \qquad\text{(1)}$$

where $g$ and $h$ are continuous functions of $x$ and $y$, as being equivalent to the ordinary integral obtained by effecting the formal substitutions $x = \phi(t)$, $y = \psi(t)$, *i.e.* to

$$\int_{t_{0}}^{t_{1}} \{g(\phi, \psi) \phi' + h(\phi, \psi) \psi'\}\, dt.$$

We call $C$ the *path of integration*.

Let us suppose now that

$$z = x + iy = \phi(t) + i\psi(t),$$

so that $z$ describes the curve $C$ in Argand’s diagram as $t$ varies. Further let us suppose that

$$f(z) = u + iv$$

is a polynomial in $z$ or rational function of $z$.
''',
  'ch10-t3': r'''
Now let $\zeta = \xi + i\eta$ be any complex number. We define ${\operatorname{Log}} \zeta$, the general logarithm of $\zeta$, by the equation

$${\operatorname{Log}} \zeta = \int_{C} \frac{dz}{z},$$

where $C$ is a curve which starts from $1$ and ends at $\zeta$ and does not pass through the origin. Thus (Fig. 54) the paths (*a*), (*b*), (*c*) are paths such as are contemplated in the definition. The value of ${\operatorname{Log}} z$ is thus defined when the particular path of integration has been chosen. But at present it is not clear how far the value of ${\operatorname{Log}} z$ resulting from the definition depends upon what path is chosen. Suppose for example that $\zeta$ is real and positive, say equal to $\xi$. Then one possible path of integration is the straight line from $1$ to $\xi$, a path which we may suppose to be defined by the equations $x = t$, $y = 0$. In this case, and with this particular choice of the path of integration, we have

$${\operatorname{Log}} \xi = \int_{1}^{\xi} \frac{dt}{t},$$

so that ${\operatorname{Log}} \xi$ is equal to $\log \xi$, the logarithm of $\xi$ according to the definition given in the last chapter. Thus one value at any rate of ${\operatorname{Log}} \xi$, when $\xi$ is real and positive, is $\log \xi$. But in this case, as in the general case, the path of integration can be chosen in an infinite variety of different ways. There is nothing to show that *every* value of ${\operatorname{Log}} \xi$ is equal to $\log \xi$; and in point of fact we shall see that this is not the case. This is why we have adopted the notation ${\operatorname{Log}} \zeta$, ${\operatorname{Log}} \xi$ instead of $\log \zeta$, $\log \xi$. ${\operatorname{Log}} \xi$ is (possibly at any rate) a many valued function, and $\log \xi$ is only one of its values. And in the general case, so far as we can see at present, three alternatives are equally possible, viz. that (1) we may always get the same value of ${\operatorname{Log}} \zeta$, by whatever path we go from $1$ to $\zeta$;

(2) we may get a different value corresponding to every different path;

(3) we may get a number of different values each of which corresponds to a whole class of paths:

and the truth or falsehood of any one of these alternatives is in no way implied by our definition.
''',
  'ch10-t4': r'''
Let us suppose that the polar coordinates of the point $z = \zeta$ are $\rho$ and $\phi$, so that

$$\zeta = \rho(\cos\phi + i\sin\phi).$$

We suppose for the present that $-\pi < \phi < \pi$, while $\rho$ may have any positive value. Thus $\zeta$ may have any value other than zero or a real negative value.

The coordinates $(x, y)$ of any point on the path $C$ are functions of $t$, and so also are its polar coordinates $(r, \theta)$. Also

$$\begin{aligned} {\operatorname{Log}} \zeta &= \int_{C} \frac{dz}{z} = \int_{C} \frac{dx + i\, dy}{x + iy} \\ &= \int_{t_{0}}^{t_{1}} \frac{1}{x + iy} \left(\frac{dx}{dt} + i\frac{dy}{dt}\right) dt, \end{aligned}$$

in virtue of the definitions of § 219. But $x = r\cos\theta$, $y = r\sin\theta$, and

$$\begin{aligned} \frac{dx}{dt} + i\frac{dy}{dt} &= \left(\cos\theta\, \frac{dr}{dt} - r\sin\theta\, \frac{d\theta}{dt}\right) + i\left(\sin\theta\, \frac{dr}{dt} + r\cos\theta\, \frac{d\theta}{dt}\right) \\ &= (\cos\theta + i\sin\theta) \left(\frac{dr}{dt} + ir\frac{d\theta}{dt}\right); \end{aligned}$$

so that

$${\operatorname{Log}} \zeta = \int_{t_{0}}^{t_{1}} \frac{1}{r}\, \frac{dr}{dt}\, dt + i\int_{t_{0}}^{t_{1}} \frac{d\theta}{dt}\, dt = [\log r] + i[\theta],$$

where $[\log r]$ denotes the difference between the values of $\log r$ at the points corresponding to $t = t_{1}$ and $t = t_{0}$, and $[\theta]$ has a similar meaning.

It is clear that

$$[\log r] = \log \rho - \log 1 = \log \rho;$$

but the value of $[\theta]$ requires a little more consideration. Let us suppose first that the path of integration is the straight line from $1$ to $\zeta$. The initial value of $\theta$ is the amplitude of $1$, or rather one of the amplitudes of $1$, viz.\ $2k\pi$, where $k$ is any integer. Let us suppose that initially $\theta = 2k\pi$. It is evident from the figure that $\theta$ increases from $2k\pi$ to $2k\pi + \phi$ as $t$ moves along the line. Thus

$$[\theta] = (2k\pi + \phi) - 2k\pi = \phi,$$

and, when the path of integration is a straight line, ${\operatorname{Log}} \zeta = \log \rho + i\phi$.

We shall call this particular value of ${\operatorname{Log}} \zeta$ the **principal value**. When $\zeta$ is real and positive, $\zeta = \rho$ and $\phi = 0$, so that the principal value of ${\operatorname{Log}} \zeta$ is the ordinary logarithm $\log \zeta$. Hence it will be convenient in general to denote the principal value of ${\operatorname{Log}} \zeta$ by $\log \zeta$. Thus

$$\log \zeta = \log \rho + i\phi,$$

and the principal value is characterised by the fact that its imaginary part lies between $-\pi$ and $\pi$.
''',
  'ch10-t5': r'''
In Ch. IX we defined a function $e^{y}$ of the real variable $y$ as the inverse of the function $y = \log x$. It is naturally suggested that we should define a function of the complex variable $z$ which is the inverse of the function ${\operatorname{Log}} z$.

**Definition.** If any value of ${\operatorname{Log}} z$ is equal to $\zeta$, we call $z$ the exponential of $\zeta$ and write

$$z = \exp \zeta.$$

Thus $z = \exp \zeta$ if $\zeta = {\operatorname{Log}} z$. It is certain that to any given value of $z$ correspond infinitely many different values of $\zeta$. It would not be unnatural to suppose that, conversely, to any given value of $\zeta$ correspond infinitely many values of $z$, or in other words that $\exp \zeta$ is an infinitely many-valued function of $\zeta$. This is however not the case, as is proved by the following theorem.

**Theorem.** The exponential function $\exp \zeta$ is a one-valued function of $\zeta$.

For suppose that

$$z_{1} = r_{1}(\cos\theta_{1} + i\sin\theta_{1}),\quad z_{2} = r_{2}(\cos\theta_{2} + i\sin\theta_{2})$$

are both values of $\exp \zeta$. Then

$$\zeta = {\operatorname{Log}} z_{1} = {\operatorname{Log}} z_{2},$$

and so

$$\log r_{1} + i(\theta_{1} + 2m\pi) = \log r_{2} + i(\theta_{2} + 2n\pi),$$

where $m$ and $n$ are integers. This involves

$$\log r_{1} = \log r_{2},\quad \theta_{1} + 2m\pi = \theta_{2} + 2n\pi.$$

Thus $r_1 = r_2$, and $\theta_{1}$ and $\theta_{2}$ differ by a multiple of $2\pi$. Hence $z_{1} = z_{2}$.

**Corollary.** If $\zeta$ is real then $\exp \zeta = e^{\zeta}$, the real exponential function of $\zeta$ defined in Ch. IX\@.

For if $z = e^{\zeta}$ then $\log z = \zeta$, *i.e.* one of the values of ${\operatorname{Log}} z$ is $\zeta$. Hence $z = \exp \zeta$.

**223. The value of $\exp \zeta$.**

Let $\zeta = \xi + i\eta$ and

$$z = \exp \zeta = r(\cos\theta + i\sin\theta).$$

Then

$$\xi + i\eta = {\operatorname{Log}} z = \log r + i(\theta + 2m\pi),$$

where $m$ is an integer. Hence $\xi = \log r$, $\eta = \theta + 2m\pi$, or

$$r = e^{\xi},\quad \theta = \eta - 2m\pi;$$

and accordingly

$$\exp (\xi + i\eta) = e^{\xi} (\cos\eta + i\sin\eta).$$

If $\eta = 0$ then $\exp \xi = e^{\xi}$, as we have already inferred in § 222. It is clear that both the real and the imaginary parts of $\exp (\xi + i\eta)$ are continuous functions of $\xi$ and $\eta$ for all values of $\xi$ and $\eta$.
''',
  'ch10-t6': r'''
It might seem natural, as $\exp \zeta = e^{\zeta}$ when $\zeta$ is real, to adopt the same notation when $\zeta$ is complex and to drop the notation $\exp \zeta$ altogether. We shall not follow this course because we shall have to give a more general definition of the meaning of the symbol $e^{\zeta}$: we shall find then that $e^{\zeta}$ represents a function with infinitely many values of which $\exp \zeta$ is only one.

We have already defined the meaning of the symbol $a^{\zeta}$ in a considerable variety of cases. It is defined in elementary Algebra in the case in which $a$ is real and positive and $\zeta$ rational, or $a$ real and negative and $\zeta$ a rational fraction whose denominator is odd. According to the definitions there given $a^{\zeta}$ has at most two values.

In Ch. III we extended our definitions to cover the case in which $a$ is any real or complex number and $\zeta$ any rational number $p/q$; and in Ch. IX we gave a new definition, expressed by the equation

$$a^{\zeta} = e^{\zeta\log a},$$

which applies whenever $\zeta$ is real and $a$ real and positive.

Thus we have, in one way or another, attached a meaning to such expressions as

$$3^{1/2},\quad (-1)^{1/3},\quad (\sqrt{3} + \tfrac{1}{2}i)^{-1/2},\quad (3.5)^{1+\sqrt{2}};$$

but we have as yet given no definitions which enable us to attach any meaning to such expressions as

$$(1 + i)^{\sqrt{2}},\quad 2^{i},\quad (3 + 2i)^{2+3i}.$$

We shall now give a general definition of $a^{\zeta}$ which applies to all values of $a$ and $\zeta$, real or complex, with the one limitation that $a$ must not be equal to zero.

**Definition.** The function $a^{\zeta}$ is defined by the equation

$$a^{\zeta} = \exp (\zeta{\operatorname{Log}} a)$$

where ${\operatorname{Log}} a$ is any value of the logarithm of $a$.

We must first satisfy ourselves that this definition is consistent with the previous definitions and includes them all as particular cases.
''',
  'ch10-t7': r'''
From the formula

$$\exp (\xi + i\eta) = \exp \xi(\cos\eta + i\sin\eta),$$

we can deduce a number of extremely important subsidiary formulae. Taking $\xi = 0$, we obtain $\exp (i\eta) = \cos\eta + i\sin\eta$; and, changing the sign of $\eta$, $\exp (-i\eta) = \cos\eta - i\sin\eta$. Hence

$$\begin{alignedat}{3} \cos\eta &= &&\tfrac{1}{2} &&\{\exp (i\eta) + \exp (-i\eta)\},\\ \sin\eta &= -&&\tfrac{1}{2}i&&\{\exp (i\eta) - \exp (-i\eta)\}. \end{alignedat}$$

We can of course deduce expressions for any of the trigonometrical ratios of $\eta$ in terms of $\exp (i\eta)$.

**228. Definition of $\sin\zeta$ and $\cos\zeta$ for all values of $\zeta$.**

We saw in the last section that, when $\zeta$ is real,

$$\begin{alignedat}{3} \cos\zeta &= &&\tfrac{1}{2} &&\{\exp (i\zeta) + \exp (-i\zeta)\}, \qquad\text{(1a)}\\ \sin\zeta &= -&&\tfrac{1}{2}i&&\{\exp (i\zeta) - \exp (-i\zeta)\}. \qquad\text{(1b)} \end{alignedat}$$

The left-hand sides of these equations are defined, by the ordinary geometrical definitions adopted in elementary Trigonometry, only for real values of $\zeta$. The right-hand sides have, on the other hand, been defined for all values of $\zeta$, real or complex. We are therefore naturally led to adopt the formulae (1) as the *definitions* of $\cos \zeta$ and $\sin \zeta$ for all values of $\zeta$. These definitions agree, in virtue of the results of § 227, with the elementary definitions for real values of $\zeta$.

Having defined $\cos \zeta$ and $\sin \zeta$, we define the other trigonometrical ratios by the equations

$$\tan \zeta = \frac{\sin \zeta}{\cos \zeta},\quad \cot \zeta = \frac{\cos \zeta}{\sin \zeta},\quad \sec \zeta = \frac{1}{\cos \zeta},\quad {\operatorname{cosec}} \zeta = \frac{1}{\sin \zeta}. \qquad\text{(2)}$$

It is evident that $\cos \zeta$ and $\sec \zeta$ are even functions of $\zeta$, and $\sin \zeta$, $\tan \zeta$, $\cot \zeta$, and ${\operatorname{cosec}} \zeta$ odd functions. Also, if $\exp (i\zeta) = t$, we have

$$\begin{array}{c}\displaystyle \cos \zeta = \tfrac{1}{2} \{t + (1/t)\},\quad \sin \zeta = -\tfrac{1}{2}i \{t - (1/t)\},\\ \displaystyle \cos^{2} \zeta + \sin^{2} \zeta = \tfrac{1}{4}[\{t + (1/t)\}^{2} - \{t - (1/t)\}^{2}] = 1. \qquad\text{(3)} \end{array}$$

We can moreover express the trigonometrical functions of $\zeta + \zeta'$ in terms of those of $\zeta$ and $\zeta'$ by precisely the same formulae as those which hold in elementary trigonometry. For if $\exp (i\zeta) = t$, $\exp (i\zeta') = t'$, we have

$$\begin{aligned} \cos (\zeta + \zeta') &= \tfrac{1}{2} \left(tt' + \frac{1}{tt'}\right) \\ &= \tfrac{1}{4} \left\{ \left(t + \frac{1}{t}\right) \left(t' + \frac{1}{t'}\right) + \left(t - \frac{1}{t}\right) \left(t' - \frac{1}{t'}\right)\right\}\\ &= \cos\zeta \cos\zeta' - \sin\zeta \sin\zeta'; \qquad\text{(4)} \end{aligned}$$

and similarly we can prove that

$$\sin (\zeta + \zeta') = \sin\zeta \cos\zeta' + \cos\zeta \sin\zeta'. \qquad\text{(5)}$$

In particular

$$\cos(\zeta + \tfrac{1}{2}\pi) = -\sin\zeta,\quad \sin(\zeta + \tfrac{1}{2}\pi) = \cos\zeta. \qquad\text{(6)}$$

All the ordinary formulae of elementary Trigonometry are algebraical corollaries of the equations (2)–(6); and so all such relations hold also for the generalised trigonometrical functions defined in this section.
''',
  'ch10-t8': r'''
We found in Ch. VI that the integral of a rational or algebraical function $\phi(x, \alpha, \beta, \dots)$, where $\alpha$, $\beta$, … are constants, often assumes different forms according to the values of $\alpha$, $\beta$, …; sometimes it can be expressed by means of logarithms, and sometimes by means of inverse trigonometrical functions. Thus, for example,

$$\int \frac{dx}{x^{2} + \alpha} = \frac{1}{\sqrt{\alpha}} {\operatorname{arc\,tan}} \frac{x}{\sqrt{\alpha}} \qquad\text{(1)}$$

if $\alpha > 0$, but

$$\int \frac{dx}{x^{2} + \alpha} = \frac{1}{2\sqrt{-\alpha}} \log \left|\frac{x - \sqrt{-\alpha}}{x + \sqrt{-\alpha}}\right| \qquad\text{(2)}$$

if $\alpha < 0$. These facts suggest the existence of some functional connection between the logarithmic and the inverse circular functions. That there is such a connection may also be inferred from the facts that we have expressed the circular functions of $\zeta$ in terms of $\exp i\zeta$, and that the logarithm is the inverse of the exponential function.

Let us consider more particularly the equation

$$\int \frac{dx}{x^{2} - \alpha^{2}} = \frac{1}{2\alpha} \log \left(\frac{x - \alpha}{x + \alpha}\right),$$

which holds when $\alpha$ is real and $(x - \alpha)/(x + \alpha)$ is positive. If we could write $i\alpha$ instead of $\alpha$ in this equation, we should be led to the formula

$${\operatorname{arc\,tan}} \left(\frac{x}{\alpha}\right) = \frac{1}{2i} \log\left(\frac{x - i\alpha}{x + i\alpha}\right) + C, \qquad\text{(3)}$$

where $C$ is a constant, and the question is suggested whether, now that we have defined the logarithm of a complex number, this equation will not be found to be actually true.

Now (§ 221)

$${\operatorname{Log}}(x \pm i\alpha) = \tfrac{1}{2} \log(x^{2} + \alpha^{2}) \pm i(\phi + 2k\pi),$$

where $k$ is an integer and $\phi$ is the numerically least angle such that $\cos\phi = x/\sqrt{x^{2} + \alpha^{2}}$ and $\sin\phi = \alpha/\sqrt{x^{2} + \alpha^{2}}$. Thus

$$\frac{1}{2i} {\operatorname{Log}}\left(\frac{x - i\alpha}{x + i\alpha}\right) = -\phi - l\pi,$$

where $l$ is an integer, and this does in fact differ by a constant from any value of ${\operatorname{arc\,tan}}(x/\alpha)$.

The standard formula connecting the logarithmic and inverse circular functions is

$${\operatorname{arc\,tan}} x = \frac{1}{2i} {\operatorname{Log}}\left(\frac{1 + ix}{1 - ix}\right), \qquad\text{(4)}$$

where $x$ is real. It is most easily verified by putting $x = \tan y$, when the right-hand side reduces to

$$\frac{1}{2i} {\operatorname{Log}}\left(\frac{\cos y + i\sin y}{\cos y - i\sin y}\right) = \frac{1}{2i} {\operatorname{Log}}(\exp 2iy) = y + k\pi,$$

where $k$ is any integer, so that the equation (4) is ‘completely’ true (Ex. xciii. 3). The reader should also verify the formulae

$${\operatorname{arc\,cos}} x = -i {\operatorname{Log}}\{x \pm i\sqrt{1 - x^{2}}\},\quad {\operatorname{arc\,sin}} x = -i {\operatorname{Log}}\{ix \pm \sqrt{1 - x^{2}}\}, \qquad\text{(5)}$$

where $-1 \leqq x \leqq 1$: each of these formulae also is ‘completely’ true.
''',
  'ch10-t9': r'''
We saw in § 212 that when $z$ is real

$$\exp z = 1 + z +\frac{z^{2}}{2!} + \dots. \qquad\text{(1)}$$

Moreover we saw in § 191 that the series on the right-hand side remains convergent (indeed absolutely convergent) when $z$ is complex. It is naturally suggested that the equation (1) also remains true, and we shall now prove that this is the case.

Let the sum of the series (1) be denoted by $F(z)$. The series being absolutely convergent, it follows by direct multiplication (as in Ex. lxxxi. 7) that $F(z)$ satisfies the functional equation

$$F(z) F(h) = F(z + h). \qquad\text{(2)}$$

Now let $z = iy$, where $y$ is real, and $F(z) = f(y)$. Then

$$f(y) f(k) = f(y + k);$$

and so

$$\frac{f(y + k) - f(y)}{k} = f(y) \left\{\frac{f(k) - 1}{k}\right\}.$$

But

$$\frac{f(k) - 1}{k} = i\left\{1 + \frac{ik}{2!} + \frac{(ik)^{2}}{3!} + \dots\right\};$$

and so, if $|k| < 1$,

$$\left|\frac{f(k) - 1}{k} - i\right| < \left(\frac{1}{2!} + \frac{1}{3!} + \dots\right)|k| < (e - 2)|k|.$$

Hence $\{f(k) - 1\}/k\to i$ as $k \to 0$, and so

$$f'(y) = \lim_{k \to 0} \frac{f(y + k) - f(y)}{k} = if(y). \qquad\text{(3)}$$

Now

$$f(y) = F(iy) = 1 + (iy) + \frac{(iy)^{2}}{2!} + \dots = \phi(y) + i\psi(y),$$

where $\phi(y)$ is an even and $\psi(y)$ an odd function of $y$, and so

$$\begin{aligned} |f(y)| &= \sqrt{\{\phi(y)\}^{2} + \{\psi(y)\}^{2}}\\ &= \sqrt{\{\phi(y) + i\psi(y)\}\{\phi(y) - i\psi(y)\}}\\ &= \sqrt{F(iy) F(-iy)} = \sqrt{F(0)} = 1; \end{aligned}$$

and therefore

$$f(y) = \cos Y + i \sin Y,$$

where $Y$ is a function of $y$ such that $-\pi < Y \leqq \pi$. Since $f(y)$ has a differential coefficient, its real and imaginary parts $\cos Y$ and $\sin Y$ have differential coefficients, and are *a fortiori* continuous functions of $y$. Hence $Y$ is a continuous function of $y$. Suppose that $Y$ changes to $Y + K$ when $y$ changes to $y + k$. Then $K$ tends to zero with $k$, and

$$\frac{K}{k} = \biggl\{\frac{\cos(Y + K) - \cos Y}{k}\biggr\} \bigg/ \biggl\{\frac{\cos(Y + K) - \cos Y}{K}\biggr\}.$$

Of the two quotients on the right-hand side the first tends to a limit when $k \to 0$, since $\cos Y$ has a differential coefficient with respect to $y$, and the second tends to the limit $-\sin Y$. Hence $K/k$ tends to a limit, so that $Y$ has a differential coefficient with respect to $y$.
''',
  'ch10-t10': r'''
From the result of the last section and the equations (1) of § 228 it follows at once that

$$\cos z = 1 - \frac{z^{2}}{2!} + \frac{z^{4}}{4!} - \dots,\quad \sin z = z - \frac{z^{3}}{3!} + \frac{z^{5}}{5!} - \dots$$

for all values of $z$. These results were proved for real values of $z$ in Ex. lvi. 1.
''',
  'ch10-t11': r'''
We found in § 213 that

$$\log(1 + z) = z - \tfrac{1}{2} z^{2} + \tfrac{1}{3} z^{3} - \dots \qquad\text{(1)}$$

when $z$ is real and numerically less than unity. The series on the right-hand side is convergent, indeed absolutely convergent, when $z$ has any complex value whose modulus is less than unity. It is naturally suggested that the equation (1) remains true for such complex values of $z$. That this is true may be proved by a modification of the argument of § 213. We shall in fact prove rather more than this, viz. that (1) is true for all values of $z$ such that $|z| \leqq 1$, with the exception of the value $-1$.

It will be remembered that $\log(1 + z)$ is the principal value of ${\operatorname{Log}}(1 + z)$, and that

$$\log(1 + z) = \int_{C} \frac{du}{u},$$

where $C$ is the straight line joining the points $1$ and $1 + z$ in the plane of the complex variable $u$. We may suppose that $z$ is not real, as the formula (1) has been proved already for real values of $z$.

If we put

$$z = r(\cos\theta + i\sin\theta) = \zeta r,$$

so that $|r| \leqq 1$, and

$$u = 1 + \zeta t,$$

then $u$ will describe $C$ as $t$ increases from $0$ to $r$. And

$$\begin{aligned} \int_{C} \frac{du}{u} &= \int_{0}^{r} \frac{\zeta\, dt}{1 + \zeta t} \\ &= \int_{0}^{r} \left\{\zeta - \zeta^{2} t + \zeta^{3} t^{2} - \dots + (-1)^{m-1} \zeta^{m} t^{m-1} + \frac{(-1)^{m} \zeta^{m+1} t^{m}}{1 + \zeta t}\right\} dt \\ &= \zeta r - \frac{(\zeta r)^{2}}{2} + \frac{(\zeta r)^{3}}{3} - \dots + (-1)^{m-1} \frac{(\zeta r)^{m}}{m} + R_{m} \\ &= z - \frac{z^{2}}{2} + \frac{z^{3}}{3} - \dots + (-1)^{m-1} \frac{z^{m}}{m} + R_{m}, \qquad\text{(2)} \end{aligned}$$

where

$$R_{m} = (-1)^{m} \zeta^{m+1} \int_{0}^{r} \frac{t^{m}\, dt}{1 + \zeta t}. \qquad\text{(3)}$$

It follows from (1) of § 164 that

$$|R_{m}| \leqq \int_{0}^{r} \frac{t^{m}\, dt}{|1 + \zeta t|}. \qquad\text{(4)}$$

Now $|1 + \zeta t|$ or $|u|$ is never less than $\varpi$, the perpendicular from $O$ on to the line $C$. Hence

$$|R_{m}| \leqq \frac{1}{\varpi} \int_{0}^{r} t^{m}\, dt = \frac{r^{m+1}}{(m + 1) \varpi} \leqq \frac{1}{(m + 1) \varpi},$$

and so $R_{m} \to 0$ as $m \to \infty$. It follows from (2) that

$$\log(1 + z) = z - \tfrac{1}{2} z^{2} + \tfrac{1}{3} z^{3} - \dots. \qquad\text{(5)}$$

We have of course shown in the course of our proof that the series is convergent: this however has been proved already (Ex. lxxx. 4). The series is in fact absolutely convergent when $|z| < 1$ and conditionally convergent when $|z| = 1$.
''',
  'ch10-t12': r'''
Let $z$ be any complex number, and $h$ a real number small enough to ensure that $|hz| < 1$. Then

$$\log(1 + hz) = hz - \tfrac{1}{2}(hz)^{2} + \tfrac{1}{3}(hz)^{3} - \dots,$$

and so

$$\frac{\log(1 + hz)}{h} = z + \phi(h, z),$$

where

$$\begin{array}{c}\displaystyle \phi(h, z) = -\tfrac{1}{2}hz^{2} + \tfrac{1}{3}h^{2}z^{3} - \tfrac{1}{4}h^{3}z^{4} + \dots,\\ \displaystyle |\phi(h, z)| < |hz^{2}| (1 + |hz| + |h^{2}z^{2}| + \dots) = \frac{|hz^{2}|}{1 - |hz|}, \end{array}$$

so that $\phi(h, z) \to 0$ as $h \to 0$. It follows that

$$\lim_{h\to 0} \frac{\log(1 + hz)}{h} = z. \qquad\text{(1)}$$

If in particular we suppose $h = 1/n$, where $n$ is a positive integer, we obtain

$$\lim_{n\to \infty} n\log \left(1 + \frac{z}{n}\right) = z,$$

and so

$$\lim_{n\to \infty} \left(1 + \frac{z}{n}\right)^{n} = \lim_{n\to \infty} \exp\left\{n\log\left(1 + \frac{z}{n}\right)\right\} = \exp z. \qquad\text{(2)}$$

This is a generalisation of the result proved in § 208 for real values of $z$.

From (1) we can deduce some other results which we shall require in the next section. If $t$ and $h$ are real, and $h$ is sufficiently small, we have

$$\frac{\log(1 + tz + hz) - \log(1 + tz)}{h} = \frac{1}{h}\log\left(1 + \frac{hz}{1 + tz}\right)$$

which tends to the limit $z/(1 + tz)$ as $h \to 0$. Hence

$$\frac{d}{dt} \{\log(1 + tz)\} = \frac{z}{1 + tz}. \qquad\text{(3)}$$

We shall also require a formula for the differentiation of $(1 + tz)^{m}$, where $m$ is any number real or complex, with respect to $t$. We observe first that, if $\phi(t) = \psi(t) + i\chi(t)$ is a complex function of $t$, whose real and imaginary parts $\phi(t)$ and $\chi(t)$ possess derivatives, then

$$\begin{aligned} \frac{d}{dt}(\exp\phi) &= \frac{d}{dt}\{(\cos\chi + i\sin\chi) \exp\psi\}\\ &= \{(\cos\chi + i\sin\chi) \psi' + (-\sin\chi + i\cos\chi)\chi'\} \exp\psi\\ &= (\psi' + i\chi')(\cos\chi + i\sin\chi) \exp\psi\\ &= (\psi' + i\chi') \exp(\psi + i\chi) = \phi' \exp\phi, \end{aligned}$$

so that the rule for differentiating $\exp\phi$ is the same as when $\phi$ is real. This being so we have

$$\begin{aligned} \frac{d}{dt}(1 + tz)^{m} &= \frac{d}{dt} \exp\{m\log(1 + tz)\}\\ &= \frac{mz}{1 + tz} \exp\{m\log(1 + tz)\}\\ &= mz(1 + tz)^{m-1}. \qquad\text{(4)} \end{aligned}$$

Here both $(1 + tz)^{m}$ and $(1 + tz)^{m-1}$ have their principal values.
''',
  'ch10-t13': r'''
We have proved already (§ 215) that the sum of the series

$$1 + \binom{m}{1} z + \binom{m}{2} z^{2} + \dots$$

is $(1 + z)^{m} = \exp\{m\log(1 + z)\}$, for all real values of $m$ and all real values of $z$ between $-1$ and $1$. If $a_{n}$ is the coefficient of $z^{n}$ then

$$\left|\frac{a_{n+1}}{a_{n}}\right| = \left|\frac{m - n}{n + 1}\right| \to 1,$$

whether $m$ is real or complex. Hence (Ex. lxxx. 3) the series is always convergent if the modulus of $z$ is less than unity, and we shall now prove that its sum is still $\exp\{m\log(1 + z)\}$, *i.e.* the principal value of $(1 + z)^{m}$.

It follows from § 236 that if $t$ is real then

$$\frac{d}{dt}(1 + tz)^{m} = mz(1 + tz)^{m-1},$$

$z$ and $m$ having any real or complex values and each side having its principal value. Hence, if $\phi(t) = (1 + tz)^{m}$, we have

$$\phi^{(n)}(t) = m(m - 1) \dots (m - n + 1)z^{n} (1 + tz)^{m-n}.$$

This formula still holds if $t = 0$, so that

$$\frac{\phi^{n}(0)}{n!} = \binom{m}{n} z^{n}.$$

Now, in virtue of the remark made at the end of § 164, we have

$$\phi(1) = \phi(0) + \phi'(0) + \frac{\phi''(0)}{2!} + \dots + \frac{\phi^{(n-1)}(0)}{(n - 1)!} + R_{n},$$

where

$$R_{n} = \frac{1}{(n - 1)!}\int_{0}^{1} (1 - t)^{n-1} \phi^{(n)}(t)\, dt.$$

But if $z = r(\cos\theta + i\sin\theta)$ then

$$|1 + tz| = \sqrt{1 + 2tr\cos\theta + t^{2}r^{2}} \geqq 1 - tr,$$

and therefore

$$\begin{aligned} |R_{n}| &< \frac{|m(m - 1) \dots (m - n + 1)|}{(n - 1)!}\, r^{n} \int_{0}^{1} \frac{(1 - t)^{n-1}}{(1 - tr)^{n-m}}\, dt\\ &< \frac{|m(m - 1) \dots (m - n + 1)|}{(n - 1)!}\, \frac{(1 - \theta)^{n-1} r^{n}}{(1 - \theta r)^{n-m}}, \end{aligned}$$

where $0 < \theta < 1$; so that (cf. § 163)

$$|R_{n}| < K\frac{|m(m - 1) \dots (m - n + 1)|}{(n - 1)!}\, r^{n} = \rho_{n},$$

say. But

$$\frac{\rho_{n+1}}{\rho_{n}} = \frac{|m - n|}{n}r \to r,$$

and so (Ex. xxvii. 6) $\rho_{n} \to 0$, and therefore $R_{n} \to 0$, as $n \to \infty$. Hence we arrive at the following theorem.

**Theorem.** The sum of the binomial series

$$1 + \binom{m}{1} z + \binom{m}{2} z^{2} + \dots$$

is $\exp\{m\log(1 + z)\}$, where the logarithm has its principal value, for all values of $m$, real or complex, and all values of $z$ such that $|z| < 1$.
''',
};
