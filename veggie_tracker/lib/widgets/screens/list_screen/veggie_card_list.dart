import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/models/veggie.dart';
import 'package:veggie_tracker/widgets/screens/list_screen/veggie_card.dart';

/// A callback which takes a veggieId
typedef VeggieTapCallback = void Function(int veggieId);

/// A widget which displays a list of VeggieCards
class VeggieCardList extends StatelessWidget {
  /// A list of veggies to display
  final List<Veggie> veggies;

  /// A callback when pressed
  final VeggieTapCallback onVeggieTap;

  /// Constructor
  const VeggieCardList(this.veggies, this.onVeggieTap);

  /// Builds the details widget
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: MediaQuery.of(context).padding + EdgeInsets.symmetric(vertical: 12),
      itemCount: veggies.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 8.0,
          ),
          child: VeggieCard(
            veggies[index],
            () => onVeggieTap(veggies[index].id),
          ),
        );
      },
    );
  }
}
