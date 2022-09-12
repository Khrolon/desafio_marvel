import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:marvel/app/data/model/character_model.dart';
import 'package:marvel/app/global/constants.dart';
import 'package:dio/dio.dart';

class HomeProvider extends GetConnect {
  final String baseUrl = 'http://gateway.marvel.com/v1/public/characters';
  String? hash;

  Future<List<CharactersModel>> getCharactersInfo(int offset) async {
    hash = await generateMd5('1' + globalPrivateApiKey + globalPublicApiKey);
    String finalUrl = "$baseUrl?offset=$offset&ts=1&apikey=$globalPublicApiKey&hash=$hash";

    List<CharactersModel> characterList = [];
    final response = await Dio().get(finalUrl);
    if (response.statusCode == 200) {
      for (var item in response.data['data']['results']) {
        var temp = CharactersModel.fromJson(item);
        characterList.add(temp);
      }
    }
    return characterList;
  }

  Future<List<CharactersModel>> searchCharactersInfo(String text) async {
    hash = await generateMd5('1' + globalPrivateApiKey + globalPublicApiKey);
    String finalUrl = "$baseUrl?nameStartsWith=$text&ts=1&apikey=$globalPublicApiKey&hash=$hash";

    List<CharactersModel> characterList = [];
    final response = await Dio().get(finalUrl);
    if (response.statusCode == 200) {
      for (var item in response.data['data']['results']) {
        var temp = CharactersModel.fromJson(item);
        characterList.add(temp);
      }
    }
    return characterList;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
