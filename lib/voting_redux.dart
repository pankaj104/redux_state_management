import 'package:redux/redux.dart';

// Actions
class UpdateAgeAction {
  final int age;
  UpdateAgeAction(this.age);
}

// Reducer
int ageReducer(int age, dynamic action) {
  if (action is UpdateAgeAction) {
    return action.age;
  }
  return age;
}

// Redux store
final Store<int> store = Store<int>(
  ageReducer,
  initialState: 0,
);