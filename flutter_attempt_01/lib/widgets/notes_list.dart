import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/models/note.dart';
import 'package:flutter_attempt_01/providers/remove_edit_add.dart';
import 'package:flutter_attempt_01/widgets/note_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class notesList extends ConsumerWidget {
  const notesList({super.key, required this.notes});
  final List<Note> notes;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: notes.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(notes[index]),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          margin: Theme.of(context).cardTheme.margin,
          child: const Icon(Icons.delete),
        ),
        onDismissed: (direction) => ref.read(removeEditAddProvider.notifier).removeNote(notes[index], context),
        child: noteItem(note: notes[index]),
      ),
    );
  }
}
