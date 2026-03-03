class UserModel {
  final String name = "Shane Min Khant";
  final String title = "Mid-Level Flutter Developer";
  final String university = "University of Computer Studies, Meiktila";
  final String major = "Computer Science";
  final String company = "Tech Software 100";
  final String position = "Mid Flutter Developer";
  final String email = "koschin6@email.com";
  final String github = "https://github.com/schinmin";
  final String linkedin = "";
  final String twitter = "";
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
    SkillModel("NodeJs", 0.60),
    SkillModel("Static Web Development", 0.9)
  ];

  final List<ProjectModel> projects = [
     ProjectModel(
      title: "ThankBook",
      description: "Productivity app with task tracking, team collaboration, and real-time updates.",
      image: "assets/images/thankbook.jpg",
      technologies: ["Flutter", "Laraval", "MYSQL", "Bloc"],
      githubUrl: "",
      liveUrl: "https://play.goolge.com/store/apps/details?id=mm.com.thanks.com.app",
    ),
    ProjectModel(
      title: "E-Commerce App",
      description: "Full-featured e-commerce mobile app with real-time inventory, payment integration, and admin panel.",
      image: "assets/images/ecomerce.jpg",
      technologies: ["Flutter", "Firebase", "Stripe", "Provider"],
      githubUrl: "https://github.com/schinmin/ecommerce",
      liveUrl: "",
    ),
   
    ProjectModel(
      title: "Note Taking App",
      description: "Beautiful NoteTaking app with real-time updates.",
      image: "assets/images/project3.png",
      technologies: ["Flutter", "OpenWeather API", "Geolocator", "GetX"],
      githubUrl: "https://github.com/schinmin/note_taking",
      liveUrl: "",
    ),
   
  ];

  final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "Tech Software 100",
      position: "Mid Flutter Developer",
      duration: "2024 - Present",
      description: "Developing and maintaining cross-platform mobile applications. Leading a team of 3 junior developers. Implementing state management solutions and optimizing app performance.",
    ),
    ExperienceModel(
      company: "Freelance",
      position: "Junior Flutter Developer",
      duration: "2022 - 2023",
      description: "Developed multiple Flutter applications for clients. Collaborated with design team to implement UI/UX designs. Integrated RESTful APIs and Firebase services.",
    ),
    ExperienceModel(
      company: "Freelance",
      position: "Mobile App Developer",
      duration: "2022 - 2022",
      description: "Built custom mobile applications for small businesses. Managed client relationships and delivered projects on time.",
    ),
  ];

  final List<EducationModel> education = [
    EducationModel(
      institution: "University of Computer Studies, Meiktila",
      degree: "Bachelor of Computer Science",
      duration: "2020 - 2025",
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