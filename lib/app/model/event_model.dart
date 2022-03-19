import 'package:chillers_hub/app/constant/assets.dart';

class EventModel {
  String image;
  String title;

  EventModel({required this.image, required this.title});
}

List<EventModel> events = [
  EventModel(
    image: Assets.event1,
    title: 'Bass Hill Yanos Show',
  ),
  EventModel(image: Assets.event2, title: 'Celebrete Edition'),
  EventModel(image: Assets.event3, title: 'Podcast and Chill'),
  EventModel(image: Assets.event4, title: 'Space Theme Party Mix'),
  EventModel(image: Assets.event5, title: 'Bass Hill Yanos Show'),
  EventModel(image: Assets.event1, title: 'Bass Hill Yanos Show'),
  EventModel(image: Assets.event2, title: 'Space Theme Party Mix'),
  EventModel(image: Assets.event3, title: 'Bass Hill Yanos Show'),
  EventModel(image: Assets.event4, title: 'Space Theme Party Mix'),
  EventModel(image: Assets.event5, title: 'Bass Hill Yanos Show'),
];
