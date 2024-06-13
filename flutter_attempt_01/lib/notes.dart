import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/new_note.dart';
import 'package:flutter_attempt_01/providers/remove_edit_add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_attempt_01/widgets/notes_list.dart';


class notes extends ConsumerStatefulWidget {
  const notes({super.key});
  @override
  ConsumerState<notes> createState() {
    return _notesState();
  }
}

class _notesState extends ConsumerState<notes> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SM notes.',
          style: GoogleFonts.lato(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              constraints: const BoxConstraints.expand(),
              builder: (ctx) => const newNote());
        },
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: notesList(
                notes: ref.watch(removeEditAddProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
