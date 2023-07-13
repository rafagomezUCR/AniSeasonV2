import 'anime_model.dart';

class AnimeScheduleModel {
  List<AnimeModel> sunday;
  List<AnimeModel> monday;
  List<AnimeModel> tuesday;
  List<AnimeModel> wednesday;
  List<AnimeModel> thursday;
  List<AnimeModel> friday;
  List<AnimeModel> saturday;

  AnimeScheduleModel(
      {required this.sunday,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday});

  List<AnimeModel> getSunday() {
    return sunday;
  }

  List<AnimeModel> getMonday() {
    return monday;
  }

  List<AnimeModel> getTuesday() {
    return tuesday;
  }

  List<AnimeModel> getWednesday() {
    return wednesday;
  }

  List<AnimeModel> getThursday() {
    return thursday;
  }

  List<AnimeModel> getFriday() {
    return friday;
  }

  List<AnimeModel> getSaturday() {
    return saturday;
  }
}
