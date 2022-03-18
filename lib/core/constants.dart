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
  static const resumeLink = "https://drive.google.com/file/d/10F6-PoXtm4JchlxxmxppguGBlhYo-CLf/view?usp=sharing";
  static const githubLink = "https://github.com/mayurnile";
  static const linkedinLink = "https://www.linkedin.com/in/mayurnile/";
  static const discordLink = "https://www.discord.com/users/DEATHHGOD#2595";
}

// Company Experience
List<Experience> experiencesList = const [
  Experience(
    companyName: 'Digital Trons',
    tenure: 'Jul 2021 - Present',
    jobTitle: 'Sr. Flutter Developer',
    description:
        'Improvising and optimizing live applications to improve performance and solve user issues which lead to increase of user base by 10x. Transforming designs to application and integrating GraphQL APIs and AWS services.',
  ),
  Experience(
    companyName: 'Outshade Digital Media',
    tenure: 'May 2020 - Jun 2021',
    jobTitle: 'Flutter Developer & UI/UX Designer',
    description:
        'Collaborated in research on designs and developed striking user experiences. Integrated design frameworks built using Figma in cross platform applications using Flutter & Dart. Integrated APIs for custom databases.',
  ),
  Experience(
    companyName: 'OETD Labs',
    tenure: 'Dec 2019 - Apr 2020',
    jobTitle: 'Flutter Developer',
    description:
        'Embarked to develop visually appealing Android/iOS application using Flutter and Dart. Framed and develoeped mock apps for proposals to clients. Developed animations for flutter using Rive.',
  ),
];

// Proejcts List
List<Project> projectsList = const [
  Project(
    projectNumber: "01.",
    title: "FlyLady Plus",
    subtitle: "Declutter and clean 🧹 your home the way that millions of other ladies have !",
    image: ImageAssets.flyladyBanner,
    description: [
      "Helped in improving the quality of product, by resolving bugs and making necessary optimizations.",
      "Handling project as a maintainer, adding functionalities and solving issues as per user reviews.",
    ],
    playStoreLink: "https://play.google.com/store/apps/details?id=com.FlyLady.Premium",
    appStoreLink: "https://apps.apple.com/us/app/flyladyplus/id1115477521",
  ),
  Project(
    projectNumber: "02.",
    title: "Sacred Groves",
    subtitle: "An application through which you can help protect and preserve our Mother Nature 🌏",
    image: ImageAssets.sacredGrovesBanner,
    description: [
      "A platform to initate a motive that being, to save 25 million hectares of forest lands and inculcate nature reverence.",
      "Played a role of a front-end developer using flutter and with a detailed and precise backend developing by the team using Kubernetes cluster.",
    ],
    playStoreLink: "https://play.google.com/store/apps/details?id=com.outshade.sacredgroves",
    appStoreLink: "https://apps.apple.com/in/app/sacred-groves/id1543864728?platform=iphone",
  ),
  Project(
    projectNumber: "03.",
    title: "Procom Smart Home",
    subtitle: "An Smart Home application 📱 which works even when you don't have internet connection 📶.",
    image: ImageAssets.procomBanner,
    description: [
      "Collaborated in building a home automation app collated with Flutter, Firebase and MongoDB and implemented the design within 25 days of onboarding the project.",
      "Revamped the entire UI and designed front-end as well as back-end.",
    ],
    playStoreLink: "https://play.google.com/store/apps/details?id=com.shade.procom",
    appStoreLink: "https://apps.apple.com/in/app/procom-smart-home/id1546697153?platform=iphone",
  ),
];
