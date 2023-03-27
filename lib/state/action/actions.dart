import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

//Loading action
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatchAsync(WaitAction.add(actionKey));

  @override
  void after() => dispatchAsync(WaitAction.remove(actionKey));
}
