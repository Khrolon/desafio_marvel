import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/data/model/character_model.dart';

class InfoCharacter extends StatefulWidget {
  final CharactersModel character;
  const InfoCharacter({Key? key, required this.character}) : super(key: key);

  @override
  State<InfoCharacter> createState() => _InfoCharacter();
}

class _InfoCharacter extends State<InfoCharacter> {
  @override
  Widget build(BuildContext context) {
    print(widget.character.id);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: Get.height * .6,
        child: Column(
          children: [
            _buildBody(),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildImage(),
        _buildName(),
      ],
    );
  }

  Widget _buildImage() {
    return Image.network(
      '${widget.character.thumbnail!.path!}/landscape_xlarge.${widget.character.thumbnail!.extension}',
      fit: BoxFit.fitWidth,
      width: double.maxFinite,
      height: 200,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          'http://i.annihil.us/u/prod/marvel/i/mg/3/20/image_not_available',
        );
      },
    );
  }

  Widget _buildName() {
    return Positioned(
      top: Get.height * .18,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.2, 0.9],
            colors: [
              Color.fromARGB(128, 66, 66, 66),
              Color.fromARGB(190, 66, 66, 66),
              Color.fromARGB(255, 66, 66, 66),
            ],
          ),
        ),
        width: Get.width,
        height: 50,
        padding: EdgeInsets.only(left: 12, top: 16),
        // color: Color.fromARGB(217, 66, 66, 66),
        child: Text(
          widget.character.name!.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      height: Get.height * .35,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'description'.tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
              child: widget.character.description! == ''
                  ? Text('description_not_found'.tr)
                  : Text(
                      widget.character.description!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('comics'.tr),
                    Text(
                      '${widget.character.comics!.available}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('series'.tr),
                    Text(
                      '${widget.character.series!.available}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('stories'.tr),
                    Text(
                      '${widget.character.stories!.available}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
