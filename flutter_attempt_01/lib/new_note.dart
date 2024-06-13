import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/models/note.dart';
import 'package:flutter_attempt_01/providers/remove_edit_add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class newNote extends ConsumerStatefulWidget {
  const newNote({super.key});

  @override
  ConsumerState<newNote> createState() {
    return _newNoteState();
  }
}

class _newNoteState extends ConsumerState<newNote> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  Category? _selectedCategory;
  void addNote() {
    if (_titleController.text.trim().isNotEmpty && _selectedCategory != null) {
      // widget.onAddNote(Note(
      //     content: _contentController.text,
      //     lastUpdated: DateTime.now(),
      //     title: _titleController.text,
      //     category: _selectedCategory!));
      ref.read(removeEditAddProvider.notifier).saveNoteData(Note(
          content: _contentController.text,
          lastUpdated: DateTime.now(),
          title: _titleController.text,
          category: _selectedCategory!));
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure you have entered the title and selected a category for the note.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok')),
                ],
              ));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  decoration: InputDecoration(
                    label: Text(
                      'TITLE: ',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    // if (value == null) {
                    //   return;
                    // }

                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'CONTENT: ',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL')),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: addNote, child: const Text('SAVE NOTE')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
