import '../models/course.dart';
import 'courses/engineering_statics.dart';
import 'courses/hardy_pure_mathematics.dart';
import 'courses/openstax/additive_manufacturing_essentials.dart';
import 'courses/openstax/algebra_and_trigonometry_2e.dart';
import 'courses/openstax/american_government_4e.dart';
import 'courses/openstax/business_ethics.dart';
import 'courses/openstax/business_law_i_essentials_2e.dart';
import 'courses/openstax/calculus_volume_1.dart';
import 'courses/openstax/calculus_volume_2.dart';
import 'courses/openstax/calculus_volume_3.dart';
import 'courses/openstax/chemistry_2e.dart';
import 'courses/openstax/chemistry_atoms_first_2e.dart';
import 'courses/openstax/college_algebra_2e.dart';
import 'courses/openstax/college_algebra_corequisite_support_2e.dart';
import 'courses/openstax/college_physics_2e.dart';
import 'courses/openstax/college_physics_ap_courses_2e.dart';
import 'courses/openstax/contemporary_mathematics.dart';
import 'courses/openstax/elementary_algebra_2e.dart';
import 'courses/openstax/entrepreneurship.dart';
import 'courses/openstax/foundations_information_systems.dart';
import 'courses/openstax/intermediate_algebra_2e.dart';
import 'courses/openstax/introduction_anthropology.dart';
import 'courses/openstax/introduction_behavioral_neuroscience.dart';
import 'courses/openstax/introduction_business_2e.dart';
import 'courses/openstax/introduction_computer_science.dart';
import 'courses/openstax/introduction_intellectual_property.dart';
import 'courses/openstax/introduction_philosophy.dart';
import 'courses/openstax/introduction_political_science.dart';
import 'courses/openstax/introduction_python_programming.dart';
import 'courses/openstax/introduction_sociology_3e.dart';
import 'courses/openstax/introductory_business_statistics_2e.dart';
import 'courses/openstax/introductory_statistics_2e.dart';
import 'courses/openstax/lifespan_development.dart';
import 'courses/openstax/microbiology.dart';
import 'courses/openstax/organic_chemistry.dart';
import 'courses/openstax/organizational_behavior.dart';
import 'courses/openstax/physics.dart';
import 'courses/openstax/prealgebra_2e.dart';
import 'courses/openstax/precalculus_2e.dart';
import 'courses/openstax/principles_data_science.dart';
import 'courses/openstax/principles_economics_3e.dart';
import 'courses/openstax/principles_finance_2e.dart';
import 'courses/openstax/principles_financial_accounting.dart';
import 'courses/openstax/principles_macroeconomics_3e.dart';
import 'courses/openstax/principles_management.dart';
import 'courses/openstax/principles_managerial_accounting.dart';
import 'courses/openstax/principles_marketing.dart';
import 'courses/openstax/principles_microeconomics_3e.dart';
import 'courses/openstax/psychology_2e.dart';
import 'courses/openstax/university_physics_volume_1.dart';
import 'courses/openstax/university_physics_volume_2.dart';
import 'courses/openstax/university_physics_volume_3.dart';
import 'courses/openstax/workplace_software_skills.dart';
import 'courses/openstax/world_history_volume_1.dart';
import 'courses/openstax/world_history_volume_2.dart';

/// A named group of courses within a subject, e.g. "Economics".
class Shelf {
  final String title;
  final List<Course> courses;
  const Shelf(this.title, this.courses);
}

/// Which courses each subject shows, keyed by the subject ids on Home
/// (e.g. 'business-economics'). A course may appear in several subjects.
/// Generated from the reading list; add new courses here.
const Map<String, List<Shelf>> shelvesBySubject = {
  'business-economics': [
    Shelf('Introduction to Business', [openstaxIntroductionBusiness2e]),
    Shelf('Accounting and Finance', [openstaxPrinciplesFinancialAccounting, openstaxPrinciplesManagerialAccounting, openstaxPrinciplesFinance2e]),
    Shelf('Business Law and Ethics', [openstaxBusinessEthics, openstaxBusinessLawIEssentials2e, openstaxIntroductionIntellectualProperty]),
    Shelf('Business Statistics', [openstaxIntroductoryBusinessStatistics2e, openstaxPrinciplesDataScience]),
    Shelf('Business Technologies', [openstaxAdditiveManufacturingEssentials, openstaxWorkplaceSoftwareSkills]),
    Shelf('Economics', [openstaxPrinciplesEconomics3e, openstaxPrinciplesMacroeconomics3e, openstaxPrinciplesMicroeconomics3e]),
    Shelf('Management and Marketing', [openstaxEntrepreneurship, openstaxOrganizationalBehavior, openstaxPrinciplesManagement, openstaxPrinciplesMarketing]),
  ],
  'mathematics': [
    Shelf('Algebra and Trigonometry', [openstaxAlgebraAndTrigonometry2e]),
    Shelf('Calculus', [openstaxCalculusVolume1, openstaxCalculusVolume2, openstaxCalculusVolume3]),
    Shelf('College Algebra', [openstaxCollegeAlgebra2e, openstaxCollegeAlgebraCorequisiteSupport2e]),
    Shelf('Contemporary Mathematics', [openstaxContemporaryMathematics]),
    Shelf('Developmental Mathematics', [openstaxPrealgebra2e, openstaxElementaryAlgebra2e, openstaxIntermediateAlgebra2e]),
    Shelf('Precalculus', [openstaxPrecalculus2e]),
    Shelf('Principles of Data Science', [openstaxPrinciplesDataScience]),
    Shelf('Statistics', [openstaxIntroductoryStatistics2e, openstaxIntroductoryBusinessStatistics2e]),
    Shelf('Pure Mathematics', [hardyPureMathematics]),
  ],
  'computer-science': [
    Shelf('Foundations of Computer Science', [openstaxIntroductionComputerScience]),
    Shelf('Python Programming', [openstaxIntroductionPythonProgramming]),
    Shelf('Information Systems', [openstaxFoundationsInformationSystems]),
    Shelf('Principles of Data Science', [openstaxPrinciplesDataScience]),
    Shelf('Business Technologies', [openstaxWorkplaceSoftwareSkills]),
  ],
  'engineering': [
    Shelf('Engineering Mechanics', [engineeringStatics]),
  ],
  'biology': [
    Shelf('Microbiology', [openstaxMicrobiology]),
  ],
  'chemistry': [
    Shelf('General Chemistry', [openstaxChemistry2e, openstaxChemistryAtomsFirst2e]),
    Shelf('Organic Chemistry', [openstaxOrganicChemistry]),
  ],
  'physics': [
    Shelf('High School Physics', [openstaxPhysics]),
    Shelf('College Physics', [openstaxCollegePhysics2e, openstaxCollegePhysicsApCourses2e]),
    Shelf('University Physics', [openstaxUniversityPhysicsVolume1, openstaxUniversityPhysicsVolume2, openstaxUniversityPhysicsVolume3]),
  ],
  'social-sciences': [
    Shelf('American Government', [openstaxAmericanGovernment4e]),
    Shelf('Anthropology', [openstaxIntroductionAnthropology]),
    Shelf('Economics', [openstaxPrinciplesEconomics3e, openstaxPrinciplesMacroeconomics3e, openstaxPrinciplesMicroeconomics3e]),
    Shelf('Lifespan Development', [openstaxLifespanDevelopment]),
    Shelf('Political Science', [openstaxIntroductionPoliticalScience]),
    Shelf('Sociology', [openstaxIntroductionSociology3e]),
    Shelf('Psychology', [openstaxPsychology2e, openstaxIntroductionBehavioralNeuroscience]),
  ],
  'psychology': [
    Shelf('Psychology', [openstaxPsychology2e, openstaxIntroductionBehavioralNeuroscience]),
  ],
  'history': [
    Shelf('World History', [openstaxWorldHistoryVolume1, openstaxWorldHistoryVolume2]),
    Shelf('Philosophy', [openstaxIntroductionPhilosophy]),
  ],
};

/// Shelves for a subject id such as 'mathematics'; empty when it has none.
List<Shelf> shelvesForSubject(String subjectId) => shelvesBySubject[subjectId] ?? const [];

/// Every course a subject shows, each once.
List<Course> coursesForSubject(String subjectId) => {
      for (final s in shelvesForSubject(subjectId)) ...s.courses,
    }.toList();

/// Every course in the app, each once, in subject order.
final List<Course> allCourses = {
  for (final shelves in shelvesBySubject.values)
    for (final s in shelves) ...s.courses,
}.toList();
