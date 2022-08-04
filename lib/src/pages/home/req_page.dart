
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


final List<String> imgListReq = [
  'https://cdn.imweb.me/thumbnail/20200325/fdad57fcf0edb.jpg',
  'https://cdn.imweb.me/thumbnail/20200325/877fa615b97f6.jpg',
  'https://cdn.imweb.me/thumbnail/20200325/013e801d043dc.jpg',
];

final List<String> dropDownString = ['라이트' , '스텐다드' , '프리미엄'];


class ReqPage extends StatefulWidget {
  const ReqPage({Key? key}) : super(key: key);

  @override
  State<ReqPage> createState() => _ReqPageState();
}

class _ReqPageState extends State<ReqPage> {

  String dropValue = dropDownString[0].toString();

  Widget _toplayout(){
    return Container(
      height:200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgListReq.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: Get.width/1.2,
            color: Colors.red,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.white70,
                    value: progress.progress,
                  ),
                ),
                imageUrl: imgListReq[index].toString(),
              // controller.interView,
              //  imageUrl :   'https://i.ytimg.com/vi/qx64rkEDMHY/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLALsJftiloAAjt8Ym5w85QAjPkIPQ',
            ),
          );
        }
      ),
    );
  }

  Widget _inputLayout(){
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.redAccent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          value: dropValue,
          borderRadius:  BorderRadius.all(Radius.circular(10.0)),
          isExpanded: true,
          style: TextStyle(color: Colors.white),
          dropdownColor: Colors.black,
          items: dropDownString.map((String item) {
            return DropdownMenuItem<String>(
              child: Text('$item'),
              value: item,
            );
          }).toList(),
          onChanged: (dynamic value) {
            print(value);
            setState(() {
              if(value == '라이트'){
                dropValue = dropDownString[0];
              }else if(value == '스텐다드'){
                dropValue = dropDownString[1];
              }else{
                dropValue = dropDownString[2];
              }
            });
          },
        ),
        SizedBox(height: 20,),
        TextField(
          inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow: true)],
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: '전화번호',
            hintText: '전화번호를 입력하여 주세요',
            labelStyle: TextStyle(color: Colors.redAccent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 20,),
        TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: '선호 하는 가수',
            hintText: '선호 하는 가수를 입력하여 주세요',
            labelStyle: TextStyle(color: Colors.redAccent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          keyboardType: TextInputType.text
        ),
        SizedBox(height: 20,),
        TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: '선호하는 곡',
            hintText: '선호하는 곡을 입력하여 주세요',
            labelStyle: TextStyle(color: Colors.redAccent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 20,),
        TextField(
          maxLines: 10,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: '요구 사항을 적어주세요',
            hintText: '요구 사항을 적어주세요',
            labelStyle: TextStyle(color: Colors.redAccent),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: Colors.redAccent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body : SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _toplayout(),
              SizedBox(
                height: 50,
              ),
              _inputLayout(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style:  ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('제출'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        )
      ),
    );
  }
}
