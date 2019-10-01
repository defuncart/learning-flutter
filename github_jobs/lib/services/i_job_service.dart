import 'package:github_jobs/models/job_posting.dart';

/// An interface stating the functionality of a job service.
abstract class IJobService {
  /// Returns a list of jobs for a given search condition.
  /// 
  /// The fields `description` (i.e. iOS), `fullTime` (i.e. true) and `location` (i.e. Berlin) are all optional.
  Future<List<JobPosting>> search({String description = '', bool fullTime = true, String location = ''});
}
