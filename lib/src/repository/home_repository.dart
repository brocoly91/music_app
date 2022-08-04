

import 'package:get/get.dart';
import 'package:music_app/src/model/home.dart';

final inter_view_datas = [
  {
    "url" : 'https://i.ytimg.com/vi/qx64rkEDMHY/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLALsJftiloAAjt8Ym5w85QAjPkIPQ',
    "name" : "왕부연",
    "age" : "20",
    "job" : "컨설턴트",
    "vedioUrl" : "qx64rkEDMHY"
  },
  {
    "url" : 'https://i.ytimg.com/vi/M8BQAOOmhbQ/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLB0KZs-C0u8QhsMf8VdpI3Qje6hBw',
    "name" : "유원기",
    "age" : "30",
    "job" : "핸드폰판매",
    "vedioUrl" : "QLlNgO_Aazw"
  },
  {
    "url" : 'https://i.ytimg.com/vi/Tm-tDfpRYME/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA6j3ko9a89zHoXt6y4MmKHsK1erw',
    "name" : "이예진",
    "age" : "30",
    "job" : "웹디자이너",
    "vedioUrl" :"Tm-tDfpRYME"
  },
  {
    "url" : 'https://i.ytimg.com/vi/DJ31fsoZNqk/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCAPhpgC1DwvxkaH247Iq3vnGCRMg',
    "name" : "이은혜",
    "age" : "20",
    "job" : "피아노선생님",
    "vedioUrl" :"DJ31fsoZNqk"
  },

  {
    "url" : 'https://i.ytimg.com/vi/Ym8RjZqUMY0/maxresdefault.jpg',
    "name" : "진동현",
    "age" : "30",
    "job" : "바리스타",
    "vedioUrl" : "Ym8RjZqUMY0"
  },


];


class HomeRepository{

  static HomeRepository get to => Get.find();

  Future<List<InterView>> loadInterView() async{
    await Duration(milliseconds: 1000);
    return inter_view_datas.map((interview) => InterView.fromJson(interview)).toList();
  }
}