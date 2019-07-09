import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/utils/app_colors.dart';
import 'package:qr_scanner/utils/app_utils.dart';
import 'package:qr_utils/qr_utils.dart';
import 'package:url_launcher/url_launcher.dart';

/// The home screen
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

/// An enum representing the types of states on the home screen
enum HomeScreenStateType {
  /// Waiting on user to scan qr code
  waitingOnQRCode,

  /// An error occurred scanning qr code
  errorParsingQRCode,

  /// The qr code was scanned successfully
  successParsingQRCode,
}

/// A state for the HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  /// The home screen's state type
  HomeScreenStateType homeScreenStateType = HomeScreenStateType.waitingOnQRCode;

  /// The url converted from a qr code. Can be null.
  String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (homeScreenStateType == HomeScreenStateType.waitingOnQRCode)
            CupertinoButton(
              onPressed: () => _onScan(),
              child: Text('Scan'),
            ),
          if (homeScreenStateType == HomeScreenStateType.errorParsingQRCode)
            Text(
              "QR Code isn't a valid url",
              style: TextStyle(color: AppColors.red),
            ),
          if (homeScreenStateType == HomeScreenStateType.successParsingQRCode) Text(url),
          if (homeScreenStateType == HomeScreenStateType.successParsingQRCode)
            CupertinoButton(
              onPressed: _onLaunch,
              child: Text('Open'),
            ),
          if (homeScreenStateType != HomeScreenStateType.waitingOnQRCode)
            CupertinoButton(
              onPressed: () => _onScan(),
              child: Text('Scan another code'),
            ),
        ],
      ),
    );
  }

  /// Scans and converts a QR Code
  void _onScan() async {
    url = await QrUtils.scanQR;
    if (url != null) {
      // update state
      setState(() {
        homeScreenStateType = AppUtils.isValidUrl(url)
            ? HomeScreenStateType.successParsingQRCode
            : HomeScreenStateType.errorParsingQRCode;
      });
    } else {
      setState(() {
        homeScreenStateType = HomeScreenStateType.waitingOnQRCode;
      });
    }
  }

  /// Launches the converted url
  _onLaunch() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
