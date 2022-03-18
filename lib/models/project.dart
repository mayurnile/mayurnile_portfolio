class Project {
  final String projectNumber;
  final String title;
  final String subtitle;
  final String image;
  final List<String> description;
  final String? playStoreLink;
  final String? appStoreLink;

  const Project({
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    this.playStoreLink,
    this.appStoreLink,
  });
}
