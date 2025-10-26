import 'package:collabverse/data/model/data.dart';

sealed class DataListResultState {}

class DataListNoneState extends DataListResultState {}

class DataListLoadingState extends DataListResultState{}

class DataListErrorState extends DataListResultState{
  final String error;

  DataListErrorState(this.error);
}

class DataListLoadedState extends DataListResultState{
  final List<Data> data;

  DataListLoadedState(this.data);
}

class DataBookmarkListLoadedState extends DataListResultState{
  final Data data;

  DataBookmarkListLoadedState(this.data);
}