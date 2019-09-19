import 'package:flutter/material.dart';
import 'package:hnpwa_client/hnpwa_client.dart';

/// A tile rendering info on a FeedItem
class FeedItemTile extends StatelessWidget {
  /// The item to display
  final FeedItem item;

  /// A callback when the tile is pressed
  final Function() onTap;

  const FeedItemTile({@required this.item, @required this.onTap, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.type == ItemType.job ? null : Text('${item.points}', style: Theme.of(context).textTheme.headline),
      title: Text(
        item.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        item.type == ItemType.job ? item.timeAgo : '${item.user}, ${item.commentsCount} comment(s)',
      ),
      onTap: onTap,
    );
  }
}
