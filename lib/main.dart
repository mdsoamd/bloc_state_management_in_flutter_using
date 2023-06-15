import 'package:bloc_state_management_in_flutter_using/data/repositories/post_repository.dart';
import 'package:bloc_state_management_in_flutter_using/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_state_management_in_flutter_using/presentation/Screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  PostRepository postRepository = PostRepository();
  postRepository.fetchPosts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
