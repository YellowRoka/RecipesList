part of 'state_manager_bloc.dart';

@immutable
abstract class StateManagerEvent {
  const StateManagerEvent();
  
  List<Object> get props => [];
}

class SMEInit extends StateManagerEvent{
  const SMEInit();
}

class SMEBack extends StateManagerEvent{
  const SMEBack();
}

class SMERecipeSelect extends StateManagerEvent{
  final int id;

  const SMERecipeSelect(this.id);

  @override
  List<Object> get props => [id];
}

class SMESearch extends StateManagerEvent{

  final String searchItem;

  const SMESearch(this.searchItem);

  @override
  List<Object> get props => [ searchItem ];
}

class SMEOpenSearchBar extends StateManagerEvent{
  const SMEOpenSearchBar();
}
