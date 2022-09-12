import 'package:marvel/app/data/model/character_model.dart';
import 'package:marvel/app/data/providers/home_providers.dart';

class HomeRepository {
  final HomeProvider apiClient = HomeProvider();

  Future<List<CharactersModel>> getCharactersInfo(int offset) async {
    List<CharactersModel> characterList = [];
    try {
      characterList = await apiClient.getCharactersInfo(offset);
    } catch (e) {
      throw Exception(e);
    }
    return characterList;
  }

  Future<List<CharactersModel>> searchCharactersInfo(String text) async {
    List<CharactersModel> characterList = [];
    try {
      characterList = await apiClient.searchCharactersInfo(text);
    } catch (e) {
      throw Exception(e);
    }
    return characterList;
  }
}
