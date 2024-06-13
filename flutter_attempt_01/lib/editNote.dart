import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/models/note.dart';
import 'package:flutter_attempt_01/providers/remove_edit_add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class editNote extends ConsumerStatefulWidget {
  const editNote({super.key, required this.note});
  final Note note;
  @override
  ConsumerState<editNote> createState() {
    return _editNoteState();
  }
}

class _editNoteState extends ConsumerState<editNote> {
  final TextEditingController editTitle = TextEditingController();
  final TextEditingController editContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    editTitle.text = widget.note.title;
    editContent.text = widget.note.content;
  }

  @override
  void dispose() {
    editContent.dispose();
    editTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          label: Text(
                        'Title: ',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      controller: editTitle,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text(
                        'Content: ',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      controller: editContent,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
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
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            
                            ref
                                .read(removeEditAddProvider.notifier)
                                .saveEdits(Note.second(
                                  content: editContent.text,
                                  lastUpdated: DateTime.now(),
                                  title: editTitle.text,
                                  category: widget.note.category,
                                  id: widget.note.id,
                                ));
                            // widget.onSaveEdits(Note.second(
                            //   content: editContent.text,
                            //   lastUpdated: DateTime.now(),
                            //   title: editTitle.text,
                            //   category: widget.note.category,
                            //   id: widget.note.id,
                            // ));
                            Navigator.pop(context);
                          },
                          child: const Text('Save changes'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
