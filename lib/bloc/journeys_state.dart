import 'package:bonbagage/model/journey_model.dart';

class JourneysState {
  final Journey journey;

  JourneysState({required this.journey});

  JourneysState copyWith({
    Journey? journey
  }) {
    return JourneysState(
      journey: journey ?? this.journey
    );
  }
}