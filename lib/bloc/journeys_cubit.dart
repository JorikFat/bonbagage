import 'package:bloc/bloc.dart';
import 'package:bonbagage/bloc/journeys_state.dart';

class JourneysCubit extends Cubit<List<JourneysState>> {
  JourneysCubit() : super([
    JourneysState(
      title: "Москва",
      startDate: "01.01.2026",
      endDate: "10.01.2026"
    ),
    JourneysState(
      title: "Питер",
      startDate: "10.02.2026",
      endDate: "20.02.2026"
    ),
    JourneysState(
      title: "Казань",
      startDate: "20.03.2026",
      endDate: "30.03.2026"
    ),
  ]);

  void addJourneys(String title, String startDate, String endDate) {
    final newJourneys = JourneysState(
      title: title,
      startDate: startDate,
      endDate: endDate
    );

    emit([...state, newJourneys]);
  }
}