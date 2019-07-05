import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/database.dart';
import 'package:notes/utils/app_colors.dart';

class NoteScreen extends StatefulWidget {
  /// The note to display (and edit)
  final Note note;

  NoteScreen({@required this.note, Key key}) : super(key: key);

  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _contentsTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleTextEditingController.text = widget.note.title;
    _contentsTextEditingController.text = widget.note.contents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.noteTileBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              final title = _titleTextEditingController.text;
              final contents = _contentsTextEditingController.text;
              //if the note is empty delete it, else update
              if (title.isEmpty && contents.isEmpty) {
                await _deleteNote();
              } else {
                await Database.instance.updateNote(Note(id: widget.note.id, title: title, contents: contents));
              }
              // pop screen
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              // delete note
              await _deleteNote();
              // pop screen
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            //title
            TextField(
              controller: _titleTextEditingController,
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
              ),
              style: Theme.of(context).textTheme.title,
              maxLines: 1,
            ),
            Container(height: 24),
            // contents
            TextField(
              controller: _contentsTextEditingController,
              decoration: InputDecoration.collapsed(
                hintText: 'Contents',
              ),
              style: Theme.of(context).textTheme.subhead,
              autofocus: true,
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }

  /// Deletes the current note
  dynamic _deleteNote() async {
    await Database.instance.deleteNote(widget.note);
  }
}
