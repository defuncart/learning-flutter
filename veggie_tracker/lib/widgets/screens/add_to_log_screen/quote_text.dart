import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';

class QuoteText extends StatelessWidget {
  /// The quote text style
  static const quoteStyle = TextStyle(
    fontSize: 34,
    color: AppColors.quoteTextColor,
    fontWeight: FontWeight.bold,
  );

  /// The text to display
  final String text;

  /// Constructor
  const QuoteText({@required this.text});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text('“', style: quoteStyle),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(text, style: AdaptiveTextTheme.of(context).body),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('”', style: quoteStyle),
          ),
        ],
      ),
    );
  }
}
