import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/database.dart';
import 'package:notes/utils/app_colors.dart';
import 'package:notes/widgets/main_screen/note_tile.dart';
import 'package:notes/widgets/note_screen/note_screen.dart';

/// The main screen which displays a staggered list of notes
class MainScreen extends StatefulWidget {
  /// Creates a new instance of MainScreen
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    print('MainScreen build');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: AppColors.appBarContentsColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: FutureBuilder(
          future: Database.instance.getAllNotes(),
          builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
            if (snapshot.hasData) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  child: NoteTile(note: snapshot.data[index]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NoteScreen(note: snapshot.data[index]),
                      ),
                    );
                  },
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = await Database.instance.createNote();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteScreen(note: note),
            ),
          );
        },
        tooltip: 'Add note',
        child: Icon(Icons.add),
      ),
    );
  }
}
