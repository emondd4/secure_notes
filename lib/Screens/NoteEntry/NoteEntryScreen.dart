import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_notes/Screens/NoteEntry/NoteEntryController.dart';

class NoteEntryScreen extends StatelessWidget {
  NoteEntryScreen({super.key});

  final NoteEntryController controller = Get.put(NoteEntryController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
