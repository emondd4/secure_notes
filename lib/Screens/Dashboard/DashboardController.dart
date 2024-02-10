import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_notes/Models/NoteListBaseResponse.dart';
import 'package:secure_notes/Network/api_repository.dart';
import 'package:secure_notes/Utils/SecureStorage.dart';

import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class DashboardController extends GetxController{
  RxString name = "".obs;
  RxString image = "".obs;
  final noteList = Rxn<NoteListBaseResponse>();

  final ApiRepository _apiRepository = ApiRepository();

  @override
  void onInit() async{
    name.value = await SecureStorage().readSecureData("Name");
    image.value = await SecureStorage().readSecureData("Photo");
    noteList.value = await SecureStorage().getNoteList() ?? NoteListBaseResponse(data: Data(data: []));
    getNoteList();
    super.onInit();
  }

  gotoInputPage() {
    Get.toNamed("/NoteInputPage");
  }

  ///Api Calls
  Future getNoteList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.getNoteList(Get.context!, ApiUrls.baseUrl + ApiUrls.getNotes, null,
            onSuccess: (NoteListBaseResponse response) async {
              if (response != null) {
                noteList.value = response;
                SecureStorage().saveNoteList(response);
              } else {
                UIUtil.instance.onFailed('Failed to Fetch Notes');
              }
            },
            onFailure: (String error) {
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

  String getTime(String time) {
    return DateFormat("dd\nMMM").format(DateTime.parse(time));
  }

}