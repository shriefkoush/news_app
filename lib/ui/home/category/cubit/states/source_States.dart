import 'package:news_app/model/source_Response.dart';

abstract class SourceState {}
class SourceInitialState extends SourceState{}
class SourceLoadingState extends SourceState{}
class SourceErrorState extends SourceState{
  String errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceState{
  List<Source> sourcesList ;
  SourceSuccessState({required this.sourcesList});
}