import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:github_jobs/models/job_posting.dart';
import 'package:github_jobs/services/i_job_service.dart';

/// A concrete implementation of `IJobService`
class JobService extends IJobService {
  /// The base url for http requests
  static const _baseUrl = 'https://jobs.github.com';

  /// A http client
  final _httpClient = http.Client();

  /// Returns a list of jobs for a given search condition.
  ///
  /// The fields `description` (i.e. iOS), `fullTime` (i.e. true) and `location` (i.e. Berlin) are all optional.
  Future<List<JobPosting>> search({String description = '', bool fullTime = true, String location = ''}) async {
    // construct url request and wait for response
    final url = '$_baseUrl/positions.json?description=$description&full_time=$fullTime&location=$location';
    final response = await _httpClient.get(url);

    // decode the response as a list os json objects and convert this list to a list of models
    final json = jsonDecode(response.body) as List;
    return json.map((model) => JobPosting.fromJson(model)).toList();
  }
}
