part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent {
  const StateManagerEvent();
  
  List<Object> get props => [];
}

class SMEventInit extends StateManagerEvent{
  const SMEventInit();
}

class SMEventBack extends StateManagerEvent{
  const SMEventBack();
}

class SMEventRecipeSelect extends StateManagerEvent{
  final int id;

  const SMEventRecipeSelect(this.id);

  @override
  List<Object> get props => [id];
}

class SMEventSearch extends StateManagerEvent{

  final String searchItem;

  const SMEventSearch(this.searchItem);

  @override
  List<Object> get props => [ searchItem ];
}

class SMEventOpenSearchBar extends StateManagerEvent{
  const SMEventOpenSearchBar();
}
