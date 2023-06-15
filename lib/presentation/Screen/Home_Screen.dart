import 'package:bloc_state_management_in_flutter_using/data/models/post_model.dart';
import 'package:bloc_state_management_in_flutter_using/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_state_management_in_flutter_using/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         appBar: AppBar(
          title: Text("API Handling"),
         ),
         
         body: BlocConsumer<PostCubit, PostState>(

          listener: (context, state) {

            if(state is PostErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

          },



          
          builder: (context, state) {

            if(state is PostLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }


           if(state is PostLoadedState) {
              return buildPostListView(state.posts);
            }

            return Center(
              child: Text("An error occured!"),
            );

      },
    )



    );


  }





 Widget buildPostListView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {

        PostModel post = posts[index];

        return Card(
          child: ListTile(
            title: Text(post.title.toString()),
            subtitle: Text(post.body.toString()),
          ),
        );
      },
    );
  }








  
}






