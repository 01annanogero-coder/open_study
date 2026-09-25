import '../../models/course.dart';

/// "Engineering Statics: Open and Interactive" by Daniel W. Baker and
/// William Haynes (Colorado State University).
///
/// Licensed CC BY-NC-SA 4.0. The app does not carry the text: each lesson
/// opens the section's page on engineeringstatics.org. Chapters and sections
/// follow the book's own table of contents.
///
/// Generated from the book's table of contents; edit with care.
const Course engineeringStatics = Course(
  id: 'engineering-statics',
  title: 'Engineering Statics: Open and Interactive',
  author: 'Daniel W. Baker and William Haynes',
  edition: 'Colorado State University',
  license: 'CC BY-NC-SA 4.0',
  licenseUrl: 'https://creativecommons.org/licenses/by-nc-sa/4.0/',
  publisher: 'engineeringstatics.org',
  description:
      'The mechanics every engineer starts with: forces and vectors, moments, equilibrium of '
      'particles, rigid bodies and structures, centroids, internal forces, friction and '
      'moments of inertia, with interactive diagrams.',
  fullTextUrl: 'https://engineeringstatics.org/',
  sourceNote: 'Each lesson opens its section on engineeringstatics.org, as the authors publish it. '
      'Text by Daniel W. Baker and William Haynes, licensed CC BY-NC-SA 4.0.',
  chapters: [
    CourseChapter(
      id: 'ch1',
      number: '1',
      title: 'Introduction to Statics',
      lessons: [
        Lesson(
          id: 'ch1-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_01-2.html',
        ),
        Lesson(
          id: 'ch1-s1',
          sectionRef: '1.1',
          title: 'Newton’s Laws of Motion',
          url: 'https://engineeringstatics.org/newtons-laws.html',
        ),
        Lesson(
          id: 'ch1-s2',
          sectionRef: '1.2',
          title: 'Units',
          url: 'https://engineeringstatics.org/Chapter_01-units.html',
        ),
        Lesson(
          id: 'ch1-s3',
          sectionRef: '1.3',
          title: 'Forces',
          url: 'https://engineeringstatics.org/Chapter_01-forces.html',
        ),
        Lesson(
          id: 'ch1-s4',
          sectionRef: '1.4',
          title: 'Problem Solving',
          url: 'https://engineeringstatics.org/Chapter_01-problem-solving.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch2',
      number: '2',
      title: 'Forces and Other Vectors',
      lessons: [
        Lesson(
          id: 'ch2-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_02-2.html',
        ),
        Lesson(
          id: 'ch2-s1',
          sectionRef: '2.1',
          title: 'Vectors',
          url: 'https://engineeringstatics.org/Chapter_02-vectors.html',
        ),
        Lesson(
          id: 'ch2-s2',
          sectionRef: '2.2',
          title: 'One-Dimensional Vectors',
          url: 'https://engineeringstatics.org/Chapter_02-one-dimensional-vectors.html',
        ),
        Lesson(
          id: 'ch2-s3',
          sectionRef: '2.3',
          title: '2D Coordinate Systems & Vectors',
          url: 'https://engineeringstatics.org/cartesian-coords-2d.html',
        ),
        Lesson(
          id: 'ch2-s4',
          sectionRef: '2.4',
          title: '3D Coordinate Systems & Vectors',
          url: 'https://engineeringstatics.org/coordinates-3d.html',
        ),
        Lesson(
          id: 'ch2-s5',
          sectionRef: '2.5',
          title: 'Unit Vectors',
          url: 'https://engineeringstatics.org/Chapter_02-unit-vectors.html',
        ),
        Lesson(
          id: 'ch2-s6',
          sectionRef: '2.6',
          title: 'Vector Addition',
          url: 'https://engineeringstatics.org/vector_algebra_2D.html',
        ),
        Lesson(
          id: 'ch2-s7',
          sectionRef: '2.7',
          title: 'Dot Products',
          url: 'https://engineeringstatics.org/dot_products_2D.html',
        ),
        Lesson(
          id: 'ch2-s8',
          sectionRef: '2.8',
          title: 'Cross Products',
          url: 'https://engineeringstatics.org/cross-product-math.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch3',
      number: '3',
      title: 'Equilibrium of Particles',
      lessons: [
        Lesson(
          id: 'ch3-s1',
          sectionRef: '3.1',
          title: 'Equilibrium',
          url: 'https://engineeringstatics.org/ch3-intro.html',
        ),
        Lesson(
          id: 'ch3-s2',
          sectionRef: '3.2',
          title: 'Particles',
          url: 'https://engineeringstatics.org/ch3-1d-particles.html',
        ),
        Lesson(
          id: 'ch3-s3',
          sectionRef: '3.3',
          title: '1D Particle Equilibrium',
          url: 'https://engineeringstatics.org/CH03-1d-particles.html',
        ),
        Lesson(
          id: 'ch3-s4',
          sectionRef: '3.4',
          title: '2D Particle Equilibrium',
          url: 'https://engineeringstatics.org/CH03-2d-particles.html',
        ),
        Lesson(
          id: 'ch3-s5',
          sectionRef: '3.5',
          title: '3D Particle Equilibrium',
          url: 'https://engineeringstatics.org/ch3-3d-particles.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch4',
      number: '4',
      title: 'Moments and Static Equivalence',
      lessons: [
        Lesson(
          id: 'ch4-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_04-2.html',
        ),
        Lesson(
          id: 'ch4-s1',
          sectionRef: '4.1',
          title: 'Moment of Force',
          url: 'https://engineeringstatics.org/moment-of-force.html',
        ),
        Lesson(
          id: 'ch4-s2',
          sectionRef: '4.2',
          title: 'Scalar Addition of Moments',
          url: 'https://engineeringstatics.org/scalar-components-moments.html',
        ),
        Lesson(
          id: 'ch4-s3',
          sectionRef: '4.3',
          title: 'Varignon’s Theorem',
          url: 'https://engineeringstatics.org/varignons-theorem.html',
        ),
        Lesson(
          id: 'ch4-s4',
          sectionRef: '4.4',
          title: '3D Moments',
          url: 'https://engineeringstatics.org/Chapter_04-moments-in-three-dimensions.html',
        ),
        Lesson(
          id: 'ch4-s5',
          sectionRef: '4.5',
          title: 'Couples',
          url: 'https://engineeringstatics.org/Chapter_04-couples.html',
        ),
        Lesson(
          id: 'ch4-s6',
          sectionRef: '4.6',
          title: 'Equivalent Transformations',
          url: 'https://engineeringstatics.org/equivalent-tranformations.html',
        ),
        Lesson(
          id: 'ch4-s7',
          sectionRef: '4.7',
          title: 'Statically Equivalent Systems',
          url: 'https://engineeringstatics.org/statically-equivalent-systems.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch5',
      number: '5',
      title: 'Rigid Body Equilibrium',
      lessons: [
        Lesson(
          id: 'ch5-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_05-2.html',
        ),
        Lesson(
          id: 'ch5-s1',
          sectionRef: '5.1',
          title: 'Degree of Freedom',
          url: 'https://engineeringstatics.org/Chapter_05-degree-of-freedom.html',
        ),
        Lesson(
          id: 'ch5-s2',
          sectionRef: '5.2',
          title: 'Free-Body Diagrams',
          url: 'https://engineeringstatics.org/Chapter_05-free-body-diagrams.html',
        ),
        Lesson(
          id: 'ch5-s3',
          sectionRef: '5.3',
          title: 'Equations of Equilibrium',
          url: 'https://engineeringstatics.org/Chapter_05-equations-of-equilibrium.html',
        ),
        Lesson(
          id: 'ch5-s4',
          sectionRef: '5.4',
          title: '2D Rigid Body Equilibrium',
          url: 'https://engineeringstatics.org/Chapter_05-2d-rigid-body-equilibrium.html',
        ),
        Lesson(
          id: 'ch5-s5',
          sectionRef: '5.5',
          title: '3D Rigid Body Equilibrium',
          url: 'https://engineeringstatics.org/Chapter_05-3d-rigid-body-equilibrium.html',
        ),
        Lesson(
          id: 'ch5-s6',
          sectionRef: '5.6',
          title: 'Stability and Determinacy',
          url: 'https://engineeringstatics.org/Chapter_05-stability-and-determinacy.html',
        ),
        Lesson(
          id: 'ch5-s7',
          sectionRef: '5.7',
          title: 'Equilibrium Examples',
          url: 'https://engineeringstatics.org/Chapter_05-equilibrium-examples-.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch6',
      number: '6',
      title: 'Equilibrium of Structures',
      lessons: [
        Lesson(
          id: 'ch6-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_06-2.html',
        ),
        Lesson(
          id: 'ch6-s1',
          sectionRef: '6.1',
          title: 'Structures',
          url: 'https://engineeringstatics.org/Chapter_06-structures.html',
        ),
        Lesson(
          id: 'ch6-s2',
          sectionRef: '6.2',
          title: 'Interactions between members',
          url: 'https://engineeringstatics.org/Chapter_06-interactions-between-members.html',
        ),
        Lesson(
          id: 'ch6-s3',
          sectionRef: '6.3',
          title: 'Trusses',
          url: 'https://engineeringstatics.org/Chapter_06-trusses.html',
        ),
        Lesson(
          id: 'ch6-s4',
          sectionRef: '6.4',
          title: 'Method of Joints',
          url: 'https://engineeringstatics.org/method-of-joints.html',
        ),
        Lesson(
          id: 'ch6-s5',
          sectionRef: '6.5',
          title: 'Method of Sections',
          url: 'https://engineeringstatics.org/method-of-sections.html',
        ),
        Lesson(
          id: 'ch6-s6',
          sectionRef: '6.6',
          title: 'Frames and Machines',
          url: 'https://engineeringstatics.org/frames-and-machines.html',
        ),
        Lesson(
          id: 'ch6-s7',
          sectionRef: '6.7',
          title: 'Summary',
          url: 'https://engineeringstatics.org/Chapter_06-summary.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch7',
      number: '7',
      title: 'Centroids and Centers of Gravity',
      lessons: [
        Lesson(
          id: 'ch7-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_07-2.html',
        ),
        Lesson(
          id: 'ch7-s1',
          sectionRef: '7.1',
          title: 'Weighted Averages',
          url: 'https://engineeringstatics.org/weghted-average.html',
        ),
        Lesson(
          id: 'ch7-s2',
          sectionRef: '7.2',
          title: 'Center of Gravity',
          url: 'https://engineeringstatics.org/Chapter_07-center-of-gravity.html',
        ),
        Lesson(
          id: 'ch7-s3',
          sectionRef: '7.3',
          title: 'Center of Mass',
          url: 'https://engineeringstatics.org/Chapter_07-center-of-mass.html',
        ),
        Lesson(
          id: 'ch7-s4',
          sectionRef: '7.4',
          title: 'Centroids',
          url: 'https://engineeringstatics.org/Chapter_07-centroids.html',
        ),
        Lesson(
          id: 'ch7-s5',
          sectionRef: '7.5',
          title: 'Centroids using Composite Parts',
          url: 'https://engineeringstatics.org/composite-parts.html',
        ),
        Lesson(
          id: 'ch7-s6',
          sectionRef: '7.6',
          title: 'Average Value of a Function',
          url: 'https://engineeringstatics.org/Chapter_07-average-value-of-a-function.html',
        ),
        Lesson(
          id: 'ch7-s7',
          sectionRef: '7.7',
          title: 'Centroids using Integration',
          url: 'https://engineeringstatics.org/centroids-by-integration.html',
        ),
        Lesson(
          id: 'ch7-s8',
          sectionRef: '7.8',
          title: 'Distributed Loads',
          url: 'https://engineeringstatics.org/distributed-loads.html',
        ),
        Lesson(
          id: 'ch7-s9',
          sectionRef: '7.9',
          title: 'Fluid Statics',
          url: 'https://engineeringstatics.org/Chapter_07-fluid-statics.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch8',
      number: '8',
      title: 'Internal Forces',
      lessons: [
        Lesson(
          id: 'ch8-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_08-2.html',
        ),
        Lesson(
          id: 'ch8-s1',
          sectionRef: '8.1',
          title: 'Internal Forces',
          url: 'https://engineeringstatics.org/Chapter_08-internal-forces.html',
        ),
        Lesson(
          id: 'ch8-s2',
          sectionRef: '8.2',
          title: 'Sign Conventions',
          url: 'https://engineeringstatics.org/VM_sign_convention.html',
        ),
        Lesson(
          id: 'ch8-s3',
          sectionRef: '8.3',
          title: 'Internal Forces at a Point',
          url: 'https://engineeringstatics.org/internal_force_at_point.html',
        ),
        Lesson(
          id: 'ch8-s4',
          sectionRef: '8.4',
          title: 'Shear and Bending Moment Diagrams',
          url: 'https://engineeringstatics.org/VM_diagrams.html',
        ),
        Lesson(
          id: 'ch8-s5',
          sectionRef: '8.5',
          title: 'Relations between Loading, Shear and Moment',
          url: 'https://engineeringstatics.org/VM_relations.html',
        ),
        Lesson(
          id: 'ch8-s6',
          sectionRef: '8.6',
          title: 'Section Cut Method',
          url: 'https://engineeringstatics.org/section_cut_method.html',
        ),
        Lesson(
          id: 'ch8-s7',
          sectionRef: '8.7',
          title: 'Graphical Method',
          url: 'https://engineeringstatics.org/graphical_method.html',
        ),
        Lesson(
          id: 'ch8-s8',
          sectionRef: '8.8',
          title: 'Integration Method',
          url: 'https://engineeringstatics.org/integration_method.html',
        ),
        Lesson(
          id: 'ch8-s9',
          sectionRef: '8.9',
          title: 'Geogebra Interactives',
          url: 'https://engineeringstatics.org/Chapter_08-geogebra-interactives.html',
        ),
        Lesson(
          id: 'ch8-s10',
          sectionRef: '8.10',
          title: 'Summary',
          url: 'https://engineeringstatics.org/Chapter_08-summary.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch9',
      number: '9',
      title: 'Friction',
      lessons: [
        Lesson(
          id: 'ch9-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_09-2.html',
        ),
        Lesson(
          id: 'ch9-s1',
          sectionRef: '9.1',
          title: 'Dry Friction',
          url: 'https://engineeringstatics.org/Chapter_09-dry-friction.html',
        ),
        Lesson(
          id: 'ch9-s2',
          sectionRef: '9.2',
          title: 'Slipping vs. Tipping',
          url: 'https://engineeringstatics.org/Chapter_09-slipping-vs--tipping.html',
        ),
        Lesson(
          id: 'ch9-s3',
          sectionRef: '9.3',
          title: 'Wedges',
          url: 'https://engineeringstatics.org/Chapter_09-block-and-wedge-friction.html',
        ),
        Lesson(
          id: 'ch9-s4',
          sectionRef: '9.4',
          title: 'Screw Threads',
          url: 'https://engineeringstatics.org/Chapter_09-screw-friction.html',
        ),
        Lesson(
          id: 'ch9-s5',
          sectionRef: '9.5',
          title: 'Flexible Belts',
          url: 'https://engineeringstatics.org/Chapter_09-flexible-belt-friction.html',
        ),
        Lesson(
          id: 'ch9-s6',
          sectionRef: '9.6',
          title: 'Journal Bearings',
          url: 'https://engineeringstatics.org/Chapter_09-journal-bearing-friction.html',
        ),
        Lesson(
          id: 'ch9-s7',
          sectionRef: '9.7',
          title: 'Rotating Discs',
          url: 'https://engineeringstatics.org/Chapter_09-disc-friction.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'ch10',
      number: '10',
      title: 'Moments of Inertia',
      lessons: [
        Lesson(
          id: 'ch10-intro',
          sectionRef: '',
          title: 'Introduction',
          url: 'https://engineeringstatics.org/Chapter_10-2.html',
        ),
        Lesson(
          id: 'ch10-s1',
          sectionRef: '10.1',
          title: 'Integral Properties of Shapes',
          url: 'https://engineeringstatics.org/Chapter_10-integral-properties-of-shapes.html',
        ),
        Lesson(
          id: 'ch10-s2',
          sectionRef: '10.2',
          title: 'Moments of Inertia of Common Shapes',
          url: 'https://engineeringstatics.org/MOI-common-shapes.html',
        ),
        Lesson(
          id: 'ch10-s3',
          sectionRef: '10.3',
          title: 'Parallel Axis Theorem',
          url: 'https://engineeringstatics.org/parallel-axis-theorem-section.html',
        ),
        Lesson(
          id: 'ch10-s4',
          sectionRef: '10.4',
          title: 'Composite Shapes',
          url: 'https://engineeringstatics.org/Chapter_10-moment-of-inertia-of-composite-shapes.html',
        ),
        Lesson(
          id: 'ch10-s5',
          sectionRef: '10.5',
          title: 'Polar Moment of Inertia',
          url: 'https://engineeringstatics.org/polar-moment.html',
        ),
        Lesson(
          id: 'ch10-s6',
          sectionRef: '10.6',
          title: 'Radius of Gyration',
          url: 'https://engineeringstatics.org/radius-of-gyration-sec.html',
        ),
        Lesson(
          id: 'ch10-s7',
          sectionRef: '10.7',
          title: 'Products of Inertia',
          url: 'https://engineeringstatics.org/products-of-inertia.html',
        ),
        Lesson(
          id: 'ch10-s8',
          sectionRef: '10.8',
          title: 'Mass Moment of Inertia',
          url: 'https://engineeringstatics.org/Chapter_10-mass-moment-of-inertia.html',
        ),
      ],
    ),
    CourseChapter(
      id: 'app',
      number: 'A–D',
      title: 'Appendices',
      lessons: [
        Lesson(
          id: 'app-a',
          sectionRef: 'A',
          title: 'Notation',
          url: 'https://engineeringstatics.org/notation.html',
        ),
        Lesson(
          id: 'app-b',
          sectionRef: 'B',
          title: 'Useful Mathematics',
          url: 'https://engineeringstatics.org/useful-mathematics.html',
        ),
        Lesson(
          id: 'app-c',
          sectionRef: 'C',
          title: 'Properties of Shapes',
          url: 'https://engineeringstatics.org/centroids-moi-tables.html',
        ),
        Lesson(
          id: 'app-d',
          sectionRef: 'D',
          title: 'Properties of Steel Sections',
          url: 'https://engineeringstatics.org/AISC-properties.html',
        ),
      ],
    ),
  ],
);
