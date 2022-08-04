import 'package:flutter/material.dart';

class Song {
  final String name;
  final String singer;
  final String image;
  final String title;
  final int duration;
  final String id;
  final Color color;
  final String url;
  final String? lyic;

  Song({
    required this.name,
    required this.id,
    required this.singer,
    required this.url,
    required this.title,
    required this.image,
    required this.duration,
    this.lyic,
    required this.color});
}

List<Song> totalSongList = [
  Song(
    id: 'total0',
    name: '강은',
    singer: '강은',
    url: 'assets/mp3/test.mp3',
    title: '오늘참좋네요',
    image: 'songimgs/imageaa.jpg',
    duration: 180,
    color: Colors.white,
    lyic:
      "바람이 불어오죠\n"
      "길을 걷다가 잠시\n"
      "두 눈 감고 그냥 서서\n"
      "느껴지는 그 시원한 공간 속에서 난\n"
      "오늘이 참 좋네요\n\n"
      "보고 싶다 말하고 사랑한다 말하는\n"
      "그대 있어서 난 행복합니다\n\n"
      "두 볼에 빛이 내리고\n"
      "얼굴이 빨개지네요\n"
      "그 사람이 사랑한다고 고백해요\n"
      "수줍게 답을 했어 나도  사랑한다고\n"
      "오늘 정말 날씨도 좋네요 내 사랑도\n\n"
      "소중하다 말해요 감사하다 말해요\n"
      "그대 있어서 난 웃을 수 있죠\n\n"
      "사랑에 빛이 내리고\n"
      "심장도 빨리 뛰어요\n"
      "그 사람이 사랑한다고 고백해요\n"
      "수줍게 답을 했어 나도 사랑한다고\n"
      "오늘 정말 기분이 좋네요 행복해요\n\n"
      "기도할게요 평생 함께 하기를\n"
      "나 그댈 바라보며 말할게요 매일\n\n"
      "당신의 별이 될게요\n"
      "내 밤의 빛이 돼줘요\n"
      "저 하늘을 밝게 비추는 별들처럼\n"
      "언젠가 그대 품에서 영원히 잠들면\n"
      "행복했던 우리의 사랑도 빛이 되죠\n",
  ),
  Song(
    id: 'total1',
    name: '고예진',
    singer: '고예진',
    url: 'assets/mp3/sayar.mp3',
    title: 'say less',
    image: 'songimgs/imagebb.jpg',
    duration: 180,
    color: Colors.white,
    lyic:
    "봐 너의 그 눈빛에 i’m sure you’re\n "
        "fallin love with me babe\n"
        "애 타게도 넌 입을 열지 않어 \n"
        "the real thing in you 너 어떤 맘인지\n\n"
        "(la li la) 딴 생각 그만해 난 다 알고 있는걸\n"
        "(la li da) 이제그만 내 눈을 봐 bae\n"
        "오늘이 참 좋네요\n\n"
        "보고 싶다 말하고 사랑한다 말하는\n"
        "그대 있어서 난 행복합니다\n\n"
        "두 볼에 빛이 내리고\n"
        "얼굴이 빨개지네요\n"
        "그 사람이 사랑한다고 고백해요\n"
        "수줍게 답을 했어 나도  사랑한다고\n"
        "오늘 정말 날씨도 좋네요 내 사랑도\n\n"
        "소중하다 말해요 감사하다 말해요\n"
        "그대 있어서 난 웃을 수 있죠\n\n"
        "사랑에 빛이 내리고\n"
        "심장도 빨리 뛰어요\n"
        "그 사람이 사랑한다고 고백해요\n"
        "수줍게 답을 했어 나도 사랑한다고\n"
        "오늘 정말 기분이 좋네요 행복해요\n\n"
        "기도할게요 평생 함께 하기를\n"
        "나 그댈 바라보며 말할게요 매일\n\n"
        "당신의 별이 될게요\n"
        "내 밤의 빛이 돼줘요\n"
        "저 하늘을 밝게 비추는 별들처럼\n"
        "언젠가 그대 품에서 영원히 잠들면\n"
        "행복했던 우리의 사랑도 빛이 되죠\n",
  ),
  Song(
    id: 'total2',
    name: '김기석',
    singer: '김기석',
    url: 'assets/mp3/kksarar.mp3',
    title: '누구나',
    image: 'songimgs/imagej.jpg',
    duration: 180,
    color: Colors.white,
    lyic: '준비중입니다.'
  ),
  Song(
    id: 'total3',
    name: '김성욱',
    singer: '김성욱',
    url: 'assets/mp3/kkwmr.mp3',
    title: '이별을 말할떄',
    image: 'songimgs/image.jpg',
    duration: 180,
    color: Colors.white,
    lyic: '준비중입니다.'
  ),
  Song(
    id: 'total4',
    name: '김영효',
    singer: '김영효',
    url: 'assets/mp3/mylovear.mp3',
    title: 'My love',
    image: 'songimgs/imaged.jpg',
    duration: 180,
    color: Colors.white,
    lyic: '준비중입니다.'
  ),
  Song(
    id: 'total5',
    name: '전동현',
    singer: '전동현',
    url: 'assets/mp3/kjiar.mp3',
    title: '꽃이 가진 의미',
    image: 'songimgs/imagei.jpg',
    duration: 180,
    color: Colors.white,
    lyic: '준비중입니다.'
  ),
  Song(
    id: 'total6',
    name: '박정진',
    singer: '박정진',
    url: 'assets/mp3/pjjar.mp3',
    title: '내가 그댈 사랑합니다',
    image: 'songimgs/imagec.jpg',
    duration: 180,
    color: Colors.white,
    lyic: '준비중입니다.'
  ),
  Song(
    id: 'total7',
    name: '서영희,김재일',
    singer: '서영희,김재일',
    url: 'assets/mp3/moterar.mp3',
    title: '내 어머니',
    image: 'songimgs/imageg.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total8',
    name: '서연',
    singer: '서연',
    url: 'assets/mp3/laar.mp3',
    title: 'Look at me now',
    image: 'songimgs/imagecc.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total9',
    name: '송샘이',
    singer: '송샘이',
    url: 'assets/mp3/ssear.mp3',
    title: '돌아가는 길',
    image: 'songimgs/imagedd.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total10',
    name: '왕부연',
    singer: '왕부연',
    url: 'assets/mp3/angelar.mp3',
    title: '천사처럼',
    image: 'songimgs/imageee.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total11',
    name: '유원기',
    singer: '유원기',
    url: 'assets/mp3/ywgar.mp3',
    title: '내가 사는 이유',
    image: 'songimgs/imageff.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total12',
    name: '윤석우',
    singer: '윤석우',
    url: 'assets/mp3/yswar.mp3',
    title: '통증',
    image: 'songimgs/imagegg.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total13',
    name: '윤진욱',
    singer: '윤진욱',
    url: 'assets/mp3/wjwar.mp3',
    title: '나의시간',
    image: 'songimgs/imga.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total14',
    name: '이은혜',
    singer: '이은혜',
    url: 'assets/mp3/ewhar.mp3',
    title: '사랑한다 말해줘요',
    image: 'songimgs/imgb.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total15',
    name: '이지은',
    singer: '이지은',
    url: 'assets/mp3/happyar.mp3',
    title: '행복한 우리집',
    image: 'songimgs/imagee.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total16',
    name: '임수현',
    singer: '임수현',
    url: 'assets/mp3/eshar.mp3',
    title: '이렇게 널 부르면',
    image: 'songimgs/imgc.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total17',
    name: '전동현',
    singer: '전동현',
    url: 'assets/mp3/jdhar.mp3',
    title: '이별하긴 했을까',
    image: 'songimgs/imgd.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total18',
    name: '정하영',
    singer: '정하영',
    url: 'assets/mp3/jhwar.mp3',
    title: '기적이죠',
    image: 'songimgs/imagea.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total19',
    name: '지설',
    singer: '지설',
    url: 'assets/mp3/Lovingyouar.mp3',
    title: 'Loving you',
    image: 'songimgs/imageb.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total20',
    name: '정하영',
    singer: '정하영',
    url: 'assets/mp3/jhwar.mp3',
    title: '기적이죠',
    image: 'songimgs/imge.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total21',
    name: '킴변',
    singer: '킴변',
    url: 'assets/mp3/kbar.mp3',
    title: '끌리는 대로',
    image: 'songimgs/imgf.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
  Song(
    id: 'total22',
    name: '한빈',
    singer: '한빈',
    url: 'assets/mp3/cawar.mp3',
    title: 'Cheeze and wine',
    image: 'songimgs/imagef.jpg',
    duration: 180,
    color: Colors.white,
      lyic: '준비중입니다.'
  ),
];


List<Song> mostPopular = [
  Song(
    id: 'most1',
    title: '끌리는 대로',
    url: 'mp3/test.mp3',
    name: '킴번',
    singer: '킴번',
    image: 'https://s3-media.ppop.co.kr/image/albumcover/1636586307128nQc9jUU_%EB%81%8C%EB%A6%AC%EB%8A%94%20%EB%8C%80%EB%A1%9C-%ED%82%B4%EB%B2%88.png',
    duration: 180,
    color: Colors.grey,
  ),
  Song(
    id: 'most2',
    title: '이별을 말할떄',
    url: 'mp3/test2.mp3',
    name: '김성욱',
    singer: '김성욱',
    image: 'https://s3-media.ppop.co.kr/image/albumcover/1636525812640nQ8yyKw_1599630182784%EC%9D%B4%EB%B3%84%EC%9D%84-%EB%A7%90%ED%95%A0%EB%95%8C.jpg',
    duration: 180,
    color: Colors.grey,
  ),
  Song(
    id: 'most3',
    title: '사랑이 넘치는 우리 집',
    url: 'mp3/test.mp3',
    name: '이지은',
    singer: '이지은',
    image: 'https://s3-media.ppop.co.kr/image/albumcover/1636529270201nQ8LKSV_1615279659173%EC%9D%B4%EC%A7%80%EC%9D%80%20%EC%9E%90%EC%BC%93.jpg',
    duration: 180,
    color: Colors.grey,
  ),
  Song(
    id: 'most4',
    title: 'loving you',
    url: 'mp3/test.mp3',
    name: '지설',
    singer: '지설',
    image: 'https://s3-media.ppop.co.kr/image/albumcover/1636529917494nQ8OcUS_1615186528772Screenshot_20210305-144913_Gallery.jpg',
    duration: 180,
    color: Colors.red,
  ),
  Song(
    id: 'most5',
    title: '천사처럼',
    url: 'mp3/test.mp3',
    name: '왕부연',
    singer: '왕부연',
    image: 'https://s3-media.ppop.co.kr/image/albumcover/1636586637313nQcaAw1_%EC%B2%9C%EC%82%AC%EC%B2%98%EB%9F%BC-%EC%99%95%EB%B6%80%EC%97%B0.png',
    duration: 180,
    color: Colors.grey,
  ),
];

