import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/global/constants.dart';
import 'package:marvel/app/data/model/character_model.dart';
import 'package:marvel/app/modules/home/controllers/home_controller.dart';
import 'package:marvel/app/modules/home/views/widgets/info_character_widget.dart';

class ListOfCharactersWidget extends StatefulWidget {
  final HomeController controller;
  final void Function()? onHitEndPage;
  final List<CharactersModel> characterList;

  const ListOfCharactersWidget({
    Key? key,
    required this.characterList,
    this.onHitEndPage,
    required this.controller,
  }) : super(key: key);

  @override
  State<ListOfCharactersWidget> createState() => _ListOfCharactersWidget();
}

class _ListOfCharactersWidget extends State<ListOfCharactersWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(handleScrolling);
  }

  void handleScrolling() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      setState(() {
        widget.controller.offset.value += 20;
        widget.controller.getCharactersInfo();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: widget.characterList.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
              ),
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Get.dialog(InfoCharacter(
                      character: widget.characterList[index],
                    ));
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        '${widget.characterList[index].thumbnail!.path!}$globalImageVariant${widget.characterList[index].thumbnail!.extension}',
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              'http://i.annihil.us/u/prod/marvel/i/mg/3/20/image_not_available');
                        },
                      ),
                      Positioned(
                        top: Get.height * .11,
                        child: Container(
                          width: Get.height * .204,
                          height: 40,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          color: Color.fromARGB(125, 0, 0, 0),
                          child: Text(
                            widget.characterList[index].name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                          top: Get.height * .125,
                          left: Get.width * .39,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 12,
                          )),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
