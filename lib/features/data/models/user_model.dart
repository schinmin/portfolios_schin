class UserModel {
  final String name = "Shane Min Khant";
  final String title = "Mid-Level Flutter Developer";
  final String university = "University of Computer Studies, Meiktila";
  final String major = "Computer Science";
  final String company = "Tech Software 100";
  final String position = "Mid Flutter Developer";
  final String email = "shane.min.khant@email.com";
  final String github = "https://github.com/shaneminkhant";
  final String linkedin = "https://linkedin.com/in/shaneminkhant";
  final String twitter = "https://twitter.com/shaneminkhant";
  final String bio = "Passionate Flutter developer with expertise in building cross-platform mobile applications. Currently working at Tech Software 100, creating innovative solutions with Flutter.";
  
  final List<SkillModel> skills = [
    SkillModel("Flutter", 0.95),
    SkillModel("Dart", 0.95),
    SkillModel("Firebase", 0.90),
    SkillModel("RESTful APIs", 0.90),
    SkillModel("State Management (Provider, Bloc)", 0.88),
    SkillModel("UI/UX Design", 0.85),
    SkillModel("Git & CI/CD", 0.87),
    SkillModel("Native Android/iOS", 0.80),
  ];

  final List<ProjectModel> projects = [
    ProjectModel(
      title: "E-Commerce App",
      description: "Full-featured e-commerce mobile app with real-time inventory, payment integration, and admin panel.",
      image: "assets/images/project1.png",
      technologies: ["Flutter", "Firebase", "Stripe", "Provider"],
      githubUrl: "https://github.com/shaneminkhant/ecommerce-app",
      liveUrl: "https://play.google.com/store/apps/details?id=com.ecommerce.app",
    ),
    ProjectModel(
      title: "Task Management System",
      description: "Productivity app with task tracking, team collaboration, and real-time updates.",
      image: "assets/images/project2.png",
      technologies: ["Flutter", "Node.js", "MongoDB", "Bloc"],
      githubUrl: "https://github.com/shaneminkhant/task-manager",
      liveUrl: "https://taskmanager-demo.web.app",
    ),
    ProjectModel(
      title: "Weather Forecast App",
      description: "Beautiful weather app with real-time updates, animations, and location-based forecasts.",
      image: "assets/images/project3.png",
      technologies: ["Flutter", "OpenWeather API", "Geolocator", "GetX"],
      githubUrl: "https://github.com/shaneminkhant/weather-app",
      liveUrl: "https://weather-app-demo.web.app",
    ),
    ProjectModel(
      title: "Fitness Tracker",
      description: "Health and fitness app with workout plans, progress tracking, and social features.",
      image: "assets/images/project4.png",
      technologies: ["Flutter", "Firebase", "HealthKit", "Google Fit"],
      githubUrl: "https://github.com/shaneminkhant/fitness-tracker",
      liveUrl: null,
    ),
  ];

  final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "Tech Software 100",
      position: "Mid Flutter Developer",
      duration: "2023 - Present",
      description: "Developing and maintaining cross-platform mobile applications. Leading a team of 3 junior developers. Implementing state management solutions and optimizing app performance.",
    ),
    ExperienceModel(
      company: "Innovate Solutions",
      position: "Junior Flutter Developer",
      duration: "2021 - 2023",
      description: "Developed multiple Flutter applications for clients. Collaborated with design team to implement UI/UX designs. Integrated RESTful APIs and Firebase services.",
    ),
    ExperienceModel(
      company: "Freelance",
      position: "Mobile App Developer",
      duration: "2020 - 2021",
      description: "Built custom mobile applications for small businesses. Managed client relationships and delivered projects on time.",
    ),
  ];

  final List<EducationModel> education = [
    EducationModel(
      institution: "University of Computer Studies, Meiktila",
      degree: "Bachelor of Computer Science",
      duration: "2017 - 2021",
      description: "Focused on software development and computer science fundamentals. Participated in coding competitions and hackathons.",
    ),
  ];
}

class SkillModel {
  final String name;
  final double proficiency;
  
  SkillModel(this.name, this.proficiency);
}

class ProjectModel {
  final String title;
  final String description;
  final String image;
  final List<String> technologies;
  final String githubUrl;
  final String? liveUrl;
  
  ProjectModel({
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
    required this.githubUrl,
    this.liveUrl,
  });
}

class ExperienceModel {
  final String company;
  final String position;
  final String duration;
  final String description;
  
  ExperienceModel({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
  });
}

class EducationModel {
  final String institution;
  final String degree;
  final String duration;
  final String description;
  
  EducationModel({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.description,
  });
}