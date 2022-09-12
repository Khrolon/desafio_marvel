import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/global/widgets/search_widget.dart';
import 'package:marvel/app/modules/home/controllers/home_controller.dart';
import 'package:marvel/app/modules/home/views/widgets/body_list_characters_widget.dart';

class SearchCharacters extends StatefulWidget {
  final HomeController controller;
  const SearchCharacters({Key? key, required this.controller})
      : super(key: key);

  @override
  State<SearchCharacters> createState() => _SearchCharactersState();
}

class _SearchCharactersState extends State<SearchCharacters> {
  @override
  Widget build(BuildContext context) {
    print(widget.controller.searchLoading.value);
    return Scaffold(
      appBar: AppBar(
        title: Text('marvel_characters'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            widget.controller.searchCharacterList.clear();
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchWidget(
            hintText: "Procurar",
            onChanged: (text) {
              text == ''
                  ? widget.controller.searchCharacterList.clear()
                  : widget.controller.searchCharacters(text);
            },
            onTap: () {
              widget.controller.getDefaultSearchList();
            },
          ),
          Obx(
            (() => widget.controller.searchLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: widget.controller.searchCharacterList.length == 0
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                'no_character_found'.tr,
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListOfCharactersWidget(
                              characterList:
                                  widget.controller.searchCharacterList,
                              controller: widget.controller,
                            ),
                          ),
                  )),
          )
        ],
      ),
    );
  }
}
