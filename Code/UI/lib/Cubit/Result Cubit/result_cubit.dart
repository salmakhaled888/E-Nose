import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Result.dart';
import '../../Repository/Requests.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(ResultInitial());
  void ResultCheck() {
    emit(ResultLoading());
    print("Loading");
    Requests().get_result().then((value){
      print(value);
      if(value?.Status == 'Success'){
        print("Success=$value");
        emit(ResultSuccess(result: value));
      }
      else{
        print("Failed=$value");
        emit(ResultFailing());
      }
    });
  }
}
