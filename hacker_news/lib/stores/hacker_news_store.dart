import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hacker_news/enums/feed_type.dart';

part 'hacker_news_store.g.dart';

class HackerNewsStore = _HackerNewsStore with _$HackerNewsStore;

/// A store which communicates with HackerNews api and updates the ui
abstract class _HackerNewsStore with Store {
  /// The hacker news client
  final HnpwaClient _client = HnpwaClient();

  /// A list of the latest feed items
  @observable
  ObservableFuture<List<FeedItem>> _latestItemsFuture;

  /// A list of the top feed items
  @observable
  ObservableFuture<List<FeedItem>> _topItemsFuture;

  /// A list of the job items
  @observable
  ObservableFuture<List<FeedItem>> _jobItemsFuture;

  /// Returns an observable list of feed items for a given feed type
  ObservableFuture<List<FeedItem>> observableFeedForFeedType(FeedType type) {
    ObservableFuture<List<FeedItem>> observableFuture;
    switch (type) {
      case FeedType.latest:
        observableFuture = _latestItemsFuture;
        break;
      case FeedType.top:
        observableFuture = _topItemsFuture;
        break;
      case FeedType.jobs:
        observableFuture = _jobItemsFuture;
        break;
    }

    return observableFuture;
  }

  /// Fetches the feed for a given type
  @action
  Future fetch(FeedType type, {bool refresh = false}) async {
    if (refresh) {
      _setFeedToNull(type);
    }

    switch (type) {
      case FeedType.latest:
        _latestItemsFuture ??= ObservableFuture(_client.newest().then((Feed feed) => feed.items));
        break;
      case FeedType.top:
        _topItemsFuture ??= ObservableFuture(_client.news().then((Feed feed) => feed.items));
        break;
      case FeedType.jobs:
        _jobItemsFuture ??= ObservableFuture(_client.jobs().then((Feed feed) => feed.items));
        break;
    }
  }

  /// Loads the initial feed
  void initialLoad() {
    fetch(FeedType.latest, refresh: true);
  }

  /// Sets a given feedtype to be null (i.e. so that it can be refreshed)
  void _setFeedToNull(FeedType type) {
    switch (type) {
      case FeedType.latest:
        _latestItemsFuture = null;
        break;
      case FeedType.top:
        _topItemsFuture = null;
        break;
      case FeedType.jobs:
        _jobItemsFuture = null;
        break;
    }
  }

  /// Opens a given url
  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not open $url');
    }
  }
}
