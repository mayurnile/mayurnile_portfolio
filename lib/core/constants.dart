import './core.dart';

// Scroll Constants
const normalScrollAnimationLenghtMS = 100;
const scrollSpeed = 5;

// Device Breakpoints
class DeviceBreakpoints {
  static const mobileWidth = 480.0;
  static const tabletWidth = 800.0;
  static const maxTabletWidth = 1000.0;
  static const desktopWidth = 1200.0;
  static const desktopHeight = 1000.0;
}

// App URLs
class Urls {
  static const resumeLink =
      "https://drive.google.com/file/d/168fSrNp9FqNtSzPIQt9-vtmPgl5_Bw8-/view?usp=sharing";
  static const currentCompanyLink = "https://www.grappus.com/";
  static const githubLink = "https://github.com/mayurnile";
  static const linkedinLink = "https://www.linkedin.com/in/mayurnile/";
  static const instagramLink = "https://www.instagram.com/mayurn___/";
}

// Skills
List<Skill> skillsList = [
  Skill(
    title: "Flutter",
    icon: IconAssets.flutter,
    experience: 3.2,
  ),
  Skill(
    title: "Dart",
    icon: IconAssets.dart,
    experience: 3.2,
  ),
  Skill(
    title: "Firebase",
    icon: IconAssets.firebase,
    experience: 2.0,
  ),
  Skill(
    title: "Figma",
    icon: IconAssets.figma,
    experience: 1.5,
  ),
  Skill(
    title: "Editing",
    icon: IconAssets.afterEffects,
    experience: 4.4,
  ),
  Skill(
    title: "Lightroom",
    icon: IconAssets.lighroom,
    experience: 2.4,
  ),
];

// Company Experience
List<Experience> experiencesList = const [
  Experience(
    number: "01",
    companyName: 'Grappus',
    tenure: 'Mar 2023 - Present',
    jobTitle: '<Flutter Developer>',
    description:
        'Developing apps designed on figma with special capabilities on offline first approach. Integrated user-friendly survey flows which led to comprehensive analytics dashboards, empowering data-driven decision-making for the application campaign.',
    color: AppTheme.primaryColor,
  ),
  Experience(
    number: "02",
    companyName: 'Digital Trons',
    tenure: 'Jul 2021 - Apr 2023',
    jobTitle: '<Sr. Flutter Developer>',
    description:
        'Improvising and optimizing live applications to improve performance and solve user issues which lead to an increase in user base by 10x. Transforming designs to applications and integrating GraphQL APIs and AWS services.',
    color: AppTheme.secondaryColor,
  ),
  Experience(
    number: "03",
    companyName: 'Outshade Digital Media',
    tenure: 'May 2020 - Jun 2021',
    jobTitle: '<Flutter Developer & Designer>',
    description:
        'Collaborated in research on designs and developed striking user experiences. Integrated design frameworks built using Figma in cross-platform applications using Flutter & Dart. Integrated APIs for custom databases.',
    color: AppTheme.ternaryColor,
  ),
  Experience(
    number: "04",
    companyName: 'OETD Labs',
    tenure: 'Dec 2019 - Apr 2020',
    jobTitle: '<Flutter Developer>',
    description:
        'Embarked to develop visually appealing Android/iOS application using Flutter and Dart. Framed and developed mock apps for proposals to clients. Developed animations for flutter using Rive.',
    color: AppTheme.primaryColor,
  ),
];

// Projects List
List<Project> projectsList = const [
  Project(
    projectNumber: "01.",
    title: "Ubiquitous",
    subtitle:
        "Deploying TikTok, Instagram, and YouTube influencer marketing campaigns at scale.",
    image: ImageAssets.ubiquitousBanner,
    description: [
      "Lead the project by establishing the architecture, maintaining code quality as per industry standards",
      "Built complex UI with sophisticated animations, and integrated APIs built on GraphQL",
    ],
    playStoreLink: "",
    appStoreLink: "",
  ),
  Project(
    projectNumber: "02.",
    title: "FlyLady Plus",
    subtitle:
        "Declutter and clean 🧹 your home the way that millions of other ladies have!",
    image: ImageAssets.flyladyBanner,
    description: [
      "Helped in improving the quality of the product, by resolving bugs and making necessary optimizations.",
      "Handling project as a maintainer, adding functionalities, and solving issues as per user reviews.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.FlyLady.Premium",
    appStoreLink: "https://apps.apple.com/us/app/flyladyplus/id1115477521",
  ),
  Project(
    projectNumber: "03.",
    title: "Sacred Groves",
    subtitle:
        "An application through which you can help protect and preserve our Mother Nature 🌏",
    image: ImageAssets.sacredGrovesBanner,
    description: [
      "A platform to initiate a motive that being, to save 25 million hectares of forest lands and inculcate nature reverence.",
      "Played a role of a front-end developer using flutter and with a detailed and precise backend developing by the team using Kubernetes cluster.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.outshade.sacredgroves",
    appStoreLink:
        "https://apps.apple.com/in/app/sacred-groves/id1543864728?platform=iphone",
  ),
  Project(
    projectNumber: "04.",
    title: "Procom Smart Home",
    subtitle:
        "A Smart Home application 📱 which works even when you don't have an internet connection 📶.",
    image: ImageAssets.procomBanner,
    description: [
      "Collaborated in building a home automation app collated with Flutter, Firebase, and MongoDB and implemented the design within 25 days of onboarding the project.",
      "Revamped the entire UI and designed front-end as well as back-end.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.shade.procom",
    appStoreLink:
        "https://apps.apple.com/in/app/procom-smart-home/id1546697153?platform=iphone",
  ),
];

// Testimonial List
List<Testimonial> testimonialsList = const [
  Testimonial(
    givenBy: "Jimmy Thakkar",
    companyName: "Co-Founder, Digital Trons",
    testimonial:
        "A youngest and one of the coolest employee of our company and like your cool nature your UI in your portfolio is just amazing and that shows your level of thinking differently at this age of your career. This shows your quality of coding as well your dedication level towards your work.",
  ),
  Testimonial(
    givenBy: "Manish Gutta",
    companyName: "CEO, Outshade Digital Media",
    testimonial:
        "Mayur has been the darling for Outshade, we truly love him. His skill in UI design and App Dev are great! He goes above and beyond to bring new designs and ideas of dev to the table, which makes us and the client pleasantly surprised.",
  ),
  Testimonial(
    givenBy: "Shubham Saxena",
    companyName: "Co-Founder, Outshade Digital Media",
    testimonial:
        "Mayur Nile proved to be a brilliant person to work with. When you get to connect with him, you'll discover an amazing person with exceptional skills! Excellent and result-driven. Works towards maximal customer satisfaction. He is not only a reliable and forward-thinking flutter developer but also an inspiring team player. The success achieved in his job required extensive knowledge and dedication. He is a truly phenomenal individual.",
  ),
  Testimonial(
    givenBy: "Aditya Charan",
    companyName: "CEO, Anser Indicus",
    testimonial:
        "Flawless designing when it comes to the front end, skilled coder, easy to communicate with, quick learner, creative thinker. Pleasure working with Mayur!",
  ),
];

// All Projects List
List<Project> allProjectsList = const [
  Project(
    projectNumber: "01.",
    title: "FlyLady Plus",
    subtitle:
        "Declutter and clean 🧹 your home the way that millions of other ladies have!",
    image: ImageAssets.flyladyBanner,
    description: [
      "Helped in improving the quality of the product, by resolving bugs and making necessary optimizations.",
      "Handling project as a maintainer, adding functionalities, and solving issues as per user reviews.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.FlyLady.Premium",
    appStoreLink: "https://apps.apple.com/us/app/flyladyplus/id1115477521",
  ),
  Project(
    projectNumber: "02.",
    title: "Sacred Groves",
    subtitle:
        "An application through which you can help protect and preserve our Mother Nature 🌏",
    image: ImageAssets.sacredGrovesBanner,
    description: [
      "A platform to initiate a motive that being, to save 25 million hectares of forest lands and inculcate nature reverence.",
      "Played a role of a front-end developer using flutter and with a detailed and precise backend developing by the team using Kubernetes cluster.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.outshade.sacredgroves",
    appStoreLink:
        "https://apps.apple.com/in/app/sacred-groves/id1543864728?platform=iphone",
  ),
  Project(
    projectNumber: "03.",
    title: "Procom Smart Home",
    subtitle:
        "A Smart Home application 📱 which works even when you don't have an internet connection 📶.",
    image: ImageAssets.procomBanner,
    description: [
      "Collaborated in building a home automation app collated with Flutter, Firebase, and MongoDB and implemented the design within 25 days of onboarding the project.",
      "Revamped the entire UI and designed front-end as well as back-end.",
    ],
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.shade.procom",
    appStoreLink:
        "https://apps.apple.com/in/app/procom-smart-home/id1546697153?platform=iphone",
  ),
  Project(
    projectNumber: "04.",
    title: "Smart File Manager",
    subtitle: "A Smart application to manage your files on your device.",
    image: ImageAssets.smartFileManagerBanner,
    description: [
      "This is my B.E. Final Year Project, which is a File Manager with a few other features that help the user keep his device bloat-free and performing at its best all the time.",
      "It's a File Manager, it can find Near and Exact Duplicate Images and it can also classify memes from images",
    ],
    githubLink: "https://github.com/mayurnile/smart_file_manager",
    figmaLink:
        "https://www.figma.com/file/VqoCZHnlE9h0OCvAfpbAPv/Smart-File-Manager?node-id=0%3A1",
  ),
  Project(
    projectNumber: "05.",
    title: "My Notes",
    subtitle: "A notes managing app made using Flutter & Firebase.",
    image: ImageAssets.myNotesBanner,
    description: [
      "A simple and intuitive app for taking down all your notes with images.",
      "You can also share a dynamic link of a particular to be viewed by another user.",
    ],
    githubLink: "https://github.com/mayurnile/my_notes",
    figmaLink:
        "https://www.figma.com/file/s3kAQrAKGjYz6su5iFqRcN/My-Notes?node-id=4%3A152",
  ),
  Project(
    projectNumber: "06.",
    title: "Konnect",
    subtitle: "Konnect with your friends!",
    image: ImageAssets.konnectBanner,
    description: [
      "Konnect is a social media app that seeks to mimic the features of other social media apps.",
      "It has a new appearance and syncs with your contacts, allowing you to see who else is on the platform and, of course, allowing you to chat with your friends in real-time.",
    ],
    githubLink: "https://github.com/mayurnile/konnect",
    figmaLink:
        "https://www.figma.com/file/Jae8oJL4C03tt0h2PFhArx/Konnect?node-id=0%3A1",
  ),
  Project(
    projectNumber: "07.",
    title: "Two Step",
    subtitle: "A Shoe selling e-commerce App Template.",
    image: ImageAssets.twoStepBanner,
    description: [
      "It's a UI Template for a shoe-selling app, complete with smooth and intuitive animations and micro-interactions for eye-catching sceneries.",
      "The Splash-Screen is developed using Rive.",
    ],
    githubLink: "https://github.com/mayurnile/twostep",
  ),
  Project(
    projectNumber: "08.",
    title: "Shopify",
    subtitle: "An Electronics Shopping Application.",
    image: ImageAssets.shopifyBanner,
    description: [
      "It's an application that shows off an e-commerce application for selling electronics, along with some novel ways to add/remove goods from the basket or favorites section.",
      "It also makes use of a 'sqflite' database for storing objects locally and displaying them even when the device is turned off.",
    ],
    githubLink: "https://github.com/mayurnile/shopify",
    figmaLink:
        "https://www.figma.com/file/TOJ1YfO66ijV2T0SmIaUCj/Shopify?node-id=0%3A1",
  ),
  Project(
    projectNumber: "09.",
    title: "Traveller",
    subtitle: "A heaven for adventure seekers.",
    image: ImageAssets.travellerBanner,
    description: [
      "This features a UI template for a travelling app that summarizes easy booking flights build through Flutter's implicit animations.",
    ],
    githubLink: "https://github.com/mayurnile/traveller",
  ),
  Project(
    projectNumber: "10.",
    title: "Curvy UI",
    subtitle: "An example usage of curves in a application.",
    image: ImageAssets.curvyUIBanner,
    description: [
      "It's a UI Template demonstrating the use of curves in the application made with custom clippers and has a cool bouncing twist to the animations.",
    ],
    githubLink: "https://github.com/mayurnile/curvy_ui",
  ),
];

List<Project> experimentsList = const [
  Project(
    projectNumber: '01.',
    title: 'web_smooth_scroll',
    subtitle:
        "A package to help you provide a smoother and aesthetic scroll feeling.",
    image: "",
    description: [],
    packageLink: "https://pub.dev/packages/web_smooth_scroll",
  ),
  Project(
    projectNumber: '02.',
    title: 'multi_circular_slider',
    subtitle: "A customizable multi-colored progress bar.",
    image: "",
    description: [],
    packageLink: "https://pub.dev/packages/multi_circular_slider",
  ),
  Project(
    projectNumber: '03.',
    title: 'circular_page_view',
    subtitle:
        "A Flutter package which helps in creating animated circular carousel.",
    image: "",
    description: [],
    packageLink: "https://pub.dev/packages/circular_page_view",
  ),
];
