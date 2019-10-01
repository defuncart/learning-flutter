import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:github_jobs/states/app_state.dart';
import 'package:github_jobs/widgets/job_screen/job_screen.dart';

/// The main screen of the app. Here a job search can be triggered, with a list of results displayed.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var appState;
  final keywordTextController = TextEditingController();
  final locationTextController = TextEditingController();
  final focusNodeLocation = FocusNode();

  @override
  void didChangeDependencies() {
    appState = Provider.of<AppState>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    keywordTextController.dispose();
    locationTextController.dispose();
    focusNodeLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Jobs'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: keywordTextController,
                    decoration: InputDecoration(
                      hintText: "Keyword",
                    ),
                    onSubmitted: (_) => FocusScope.of(context).requestFocus(focusNodeLocation),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: locationTextController,
                    decoration: InputDecoration(
                      hintText: "Location",
                    ),
                    focusNode: focusNodeLocation,
                    onSubmitted: (_) => _onSearch(),
                  ),
                ),
                Container(width: 16.0),
                RaisedButton(
                  child: Text('Search'),
                  onPressed: () => _onSearch(),
                ),
              ],
            ),
          ),
          Expanded(
            child: appState.processingRequest
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : appState.hasData && appState.jobs.length > 0
                    ? ListView.builder(
                        itemCount: appState.jobs.length,
                        itemBuilder: (_, int index) => ListTile(
                          title: Text(appState.jobs[index].title),
                          subtitle: Text(appState.jobs[index].location),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobScreen(job: appState.jobs[index]),
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text('No jobs found.'),
                      ),
          ),
        ],
      ),
    );
  }

  void _onSearch() {
    // resign keyboard
    FocusScope.of(context).unfocus();
    appState.getJobPostings(keyword: keywordTextController.text, location: locationTextController.text);
  }
}
