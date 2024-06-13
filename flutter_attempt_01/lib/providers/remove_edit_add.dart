import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/editNote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_attempt_01/models/note.dart';

final expenseList = Provider((ref) => [
      Note(
          content: 'hello',
          lastUpdated: DateTime.now(),
          title: 'first',
          category: Category.Business),
      Note(
          content: 'world',
          lastUpdated: DateTime.now(),
          title: 'second',
          category: Category.Work),
    ]);

class RemoveEditAdd extends StateNotifier<List<Note>> {
  RemoveEditAdd(List<Note> list) : super(list);
  void saveNoteData(Note note) {
    state = [...state, note];
  }

  void removeNote(Note note, BuildContext context) {
    int removalIndex = state.indexOf(note);

    state.remove(note);
    state = state.where((element) {
      if (element.id != note.id) {
        return true;
      } else {
        return false;
      }
    }).toList();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Note removed successfully.'),
        padding: const EdgeInsets.all(10),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              final List<Note> temp = state;

              temp.insert(removalIndex, note);
              state = [...temp];
            }),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }

  void editnote(Note note, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => editNote(
              note: note,
              //onSaveEdits: saveEdits,
            ));
  }

  void saveEdits(Note note) {
    for (int i = 0; i < state.length; i++) {
      if (note.id == state[i].id) {
        state[i].title = note.title;
        state[i].category = note.category;
        state[i].content = note.content;
        state[i].lastUpdated = note.lastUpdated;
        final List<Note> temp = state;
        state = [...temp];
        break;
      }
    }
  }
}

final removeEditAddProvider = StateNotifierProvider<RemoveEditAdd, List<Note>>(
    (ref) => RemoveEditAdd(ref.watch(expenseList)));
