import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import 'package:github_jobs/models/job_posting.dart';

/// A widget which renders a JobPosting as a separate screen
class JobScreen extends StatelessWidget {
  /// The job to display
  final JobPosting job;

  const JobScreen({@required this.job, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              Text(
                job.title,
                style: Theme.of(context).textTheme.headline,
              ),
              // spacer
              Container(height: 8),
              // a row with company name and job type
              _TextTableRow(
                textLeft: job.company,
                textRight: job.type,
                textStyleLeft: Theme.of(context).textTheme.subhead,
              ),
              // spacer
              Container(height: 4),
              // a row with job location name and creation date
              _TextTableRow(
                textLeft: job.location,
                textRight: timeago.format(job.createdAt),
                textStyleLeft: Theme.of(context).textTheme.subhead,
              ),
              // a divider, then render job description from html
              Divider(),
              Html(
                data: job.description,
                onLinkTap: (url) => _openUrl(url),
              ),
              // a divider, then render how to apply from html
              Divider(),
              Html(
                data: job.howToApply,
                onLinkTap: (url) => _openUrl(url),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Callback to open a given url in browser
  void _openUrl(String url) async {
    // TODO: does not seem to work with mailto:test@test.de
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

/// A widget which renders a row with two Text widgets aligned to the left and right respectively
class _TextTableRow extends StatelessWidget {
  /// Text to display on the left hand side
  final String textLeft;

  /// Text to display on the right hand side
  final String textRight;

  /// A text style to render leftText
  final TextStyle textStyleLeft;

  /// A text style to render rightText
  final TextStyle textStyleRight;

  const _TextTableRow({
    @required this.textLeft,
    @required this.textRight,
    this.textStyleLeft,
    this.textStyleRight,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          textLeft,
          style: textStyleLeft,
        ),
        Spacer(flex: 1),
        Text(
          textRight,
          style: textStyleRight,
        ),
      ],
    );
  }
}
