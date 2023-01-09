class Company {
  final String leading;
  final String title;
  final String subtitle;

  const Company({
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  static Company fromJson(json) => Company(
      leading: json['leading'],
      title: json['title'],
      subtitle: json['subtitle']);
}
