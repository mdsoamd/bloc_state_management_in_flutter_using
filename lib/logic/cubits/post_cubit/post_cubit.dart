
import 'dart:developer';

import 'package:bloc_state_management_in_flutter_using/data/models/post_model.dart';
import 'package:bloc_state_management_in_flutter_using/data/repositories/post_repository.dart';
import 'package:bloc_state_management_in_flutter_using/logic/cubits/post_cubit/post_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super( PostLoadingState() ) {
    fetchPosts();   //* <-- fetchPosts function Call
  }




  PostRepository postRepository = PostRepository();  //* <-- PostRepository Class Create Objcet




  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();     //* <-- fetchPosts function Call
      emit(PostLoadedState(posts));
    }on DioException catch(ex) {
         log(ex.type.toString());
      if(ex.type == DioExceptionType.unknown) {
        emit( PostErrorState("Can't fetch posts, please check your internet connection!") );
      }
      else {
        emit( PostErrorState(ex.type.toString()) );
      }
    }
  }
}