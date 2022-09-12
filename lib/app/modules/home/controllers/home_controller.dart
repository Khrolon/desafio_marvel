import 'package:get/get.dart';
import 'package:marvel/app/data/model/character_model.dart';
import 'package:marvel/app/data/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository = HomeRepository();

  RxBool loading = false.obs, searchLoading = false.obs;
  RxList<CharactersModel> characterList = <CharactersModel>[].obs,
      searchCharacterList = <CharactersModel>[].obs;

  RxInt offset = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCharactersInfo();
  }

  getCharactersInfo() async {
    if (offset == 0) {
      loading = false.obs;
      characterList.value = await repository.getCharactersInfo(offset.value);
      loading.value = true;
    } else {
      characterList.insertAll(characterList.length,
          await repository.getCharactersInfo(offset.value));
    }
  }

  searchCharacters(String text) async {
    searchLoading = true.obs;
    searchCharacterList.value =
        await repository.searchCharactersInfo(text.toUpperCase());
    searchLoading = false.obs;
  }

  getDefaultSearchList() {
    searchLoading = true.obs;
    searchCharacterList.clear();
    for (var item in characterList) {
      searchCharacterList.add(item);
    }
    searchLoading = false.obs;
  }
}
