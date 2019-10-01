import 'package:github_jobs/utils/app_utils.dart';

/// A model representing a job positing
class JobPosting {
  /// The id (i.e. a412770a-e1d3-11e8-8b9f-cf224f66af92)
  final String id;

  /// The type (i.e. Full Time)
  final String type;

  /// The posting's url
  final String url;

  /// When the post was created
  final DateTime createdAt;

  /// The company's name
  final String company;

  /// The company's url
  final String companyUrl;

  /// The location (i.e. Berlin)
  final String location;

  /// The job title
  final String title;

  /// The job description  (contains HTML)
  final String description;

  /// How to apply to the job (also contains HTML)
  final String howToApply;

  /// A url to the company's logo
  final String companyLogo;

  const JobPosting({
    this.id,
    this.type,
    this.url,
    this.createdAt,
    this.company,
    this.companyUrl,
    this.location,
    this.title,
    this.description,
    this.howToApply,
    this.companyLogo,
  });

  /// Constructs a new instance of the model from json
  factory JobPosting.fromJson(Map<String, dynamic> json) => JobPosting(
        id: json['id'],
        type: json['type'],
        url: json['url'],
        createdAt: AppUtils.dateTimeFromCreatedAt(json['created_at']),
        company: json['company'],
        companyUrl: json['company_url'],
        location: json['location'],
        title: json['title'],
        description: json['description'],
        howToApply: json['how_to_apply'],
        companyLogo: json['company_logo'],
      );

  /// A string representation of the model
  @override
  String toString() => '{id: $id, type: $type, location: $location, title: $title}';
}
