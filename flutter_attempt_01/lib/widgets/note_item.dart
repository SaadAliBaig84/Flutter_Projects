import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/models/note.dart';
import 'package:flutter_attempt_01/providers/remove_edit_add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class noteItem extends ConsumerWidget {
  const noteItem({super.key, required this.note});
  final Note note;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Card(
        color: Theme.of(context).cardTheme.color,
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      note.title,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Icon(categoryIcons[note.category]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Last edited: ',
                    ),
                    Text(
                      note.formattedDate,
                    ),
                    const Spacer(),
                    Text(
                      note.category.name,
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // onEditNote(note);
        ref.read(removeEditAddProvider.notifier).editnote(note, context);
      },
    );
  }
}
