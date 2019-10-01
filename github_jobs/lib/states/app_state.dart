import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:github_jobs/models/job_posting.dart';
import 'package:github_jobs/services/i_job_service.dart';

/// The global app state
class AppState with ChangeNotifier {
  /// A service to query job postings
  final IJobService _jobsService;

  /// A list of cached job postings from the last search. Initially null, can have length zero.
  List<JobPosting> _jobs;

  /// Whether a search request is processing
  bool _processingRequest = false;

  /// The dependency `IJobsService` is resolved using construction injection
  AppState(this._jobsService);

  /// Whether there are search results
  bool get hasData => _jobs != null;

  /// Whether a search request is procressing
  bool get processingRequest => _processingRequest;

  /// A list of search results. This can be null, use `hasData` to firstly verify than valid search results exist
  UnmodifiableListView<JobPosting> get jobs => UnmodifiableListView(_jobs);

  /// Determines job postings for a given search condition
  Future<void> getJobPostings({String keyword, String location}) async {
    // signal that a request is current processing
    _processingRequest = true;
    notifyListeners();

    // cache the search results. singal that the request is finished processing.
    _jobs = await _jobsService.search(description: keyword, location: location);
    _processingRequest = false;
    notifyListeners();
  }
}
