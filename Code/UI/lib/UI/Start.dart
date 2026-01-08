import 'package:e_nose/Cubit/Result%20Cubit/result_cubit.dart';
import 'package:e_nose/UI/Result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: TextButton(
            onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=> BlocProvider(create: (BuildContext context) => ResultCubit(),
          child: Result()) ));
        },
            child: const Text("Start",style: TextStyle(color: Colors.white,fontSize: 30))),
      )
    );
  }
}
