import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';

import 'package:hacker_news/enums/feed_type.dart';
import 'package:hacker_news/stores/hacker_news_store.dart';
import 'package:hacker_news/widgets/home_screen/feed_item_tile.dart';

/// Renders a list of FeedItems
class FeedList extends StatelessWidget {
  /// The hacker news store
  final HackerNewsStore store;

  /// The feed type
  final FeedType feedType;

  const FeedList(this.store, this.feedType);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final future = store.observableFeedForFeedType(feedType);

      switch (future.status) {
        case FutureStatus.pending:
          return const Center(child: CircularProgressIndicator());

        case FutureStatus.rejected:
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Failed to load items.',
                style: TextStyle(color: Colors.red),
              ),
              RaisedButton(
                child: const Text('Tap to try again'),
                onPressed: _refresh,
              )
            ],
          );

        case FutureStatus.fulfilled:
          final List<FeedItem> items = future.result;
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (_, index) => FeedItemTile(
                item: items[index],
                onTap: () => store.openUrl(items[index].url),
              ),
            ),
          );
      }
    });
  }

  /// Refreshes the feed
  Future _refresh() => store.fetch(feedType, refresh: true);
}
