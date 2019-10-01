import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:github_jobs/configs/app_colors.dart';
import 'package:github_jobs/services/i_job_service.dart';
import 'package:github_jobs/services/job_service.dart';
import 'package:github_jobs/states/app_state.dart';
import 'package:github_jobs/widgets/home_screen/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // set up dependency injection
      providers: <SingleChildCloneableWidget>[
        Provider<IJobService>(builder: (context) => JobService()),
        ChangeNotifierProxyProvider<IJobService, AppState>(
          builder: (context, jobService, appState) => AppState(jobService),
        ),
      ],
      child: MaterialApp(
        title: 'GitHub Jobs',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.primaryColor,
          primaryColorDark: AppColors.primaryDark,
          accentColor: AppColors.accent,
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
