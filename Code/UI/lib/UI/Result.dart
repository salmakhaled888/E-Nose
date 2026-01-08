import 'package:e_nose/Cubit/Result%20Cubit/result_cubit.dart';
import 'package:e_nose/UI/Start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ResultCubit>(context).ResultCheck();
    return Scaffold(
        body:BlocBuilder<ResultCubit,ResultState>(builder: (BuildContext context, state) {
          if (state is ResultLoading){
            return const Center(child: CircularProgressIndicator());

          }
          else if(state is ResultSuccess){
            if (state.result.result == 0){
            return Center(child: Text("Banana",style: TextStyle(color: Colors.white,fontSize: 30)));
          }
          else{
              return Center(child: Text("Banana",style: TextStyle(color: Colors.white,fontSize: 30)));
            }}
          else{
            return Center(child: TextButton(child: Text("Try Again",style: TextStyle(color: Colors.white,fontSize: 30),),onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Start()));
            },));
          }
        })
    );
  }
}
