import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/note_list.dart';

import 'package:get/get.dart';

class NoteController extends GetxController {
  RxList<NoteList> noteList = <NoteList>[].obs;
  void setNoteList(dynamic jsonListData) {
    noteList.clear();

    for (dynamic notes in jsonListData) {
      NoteList note = NoteList.fromJson(notes);
      noteList.add(note);
    }
  }
}
