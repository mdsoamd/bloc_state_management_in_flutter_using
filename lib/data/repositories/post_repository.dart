import 'package:bloc_state_management_in_flutter_using/data/models/post_model.dart';
import 'package:bloc_state_management_in_flutter_using/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {

  API api = API();



  // TODO: Create fetchPosts function
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");

      //* SubList Create Then Return
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList(); 

    }
    catch(ex) {
      throw ex;
    }
  }

}