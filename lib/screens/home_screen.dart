import 'package:api/cubit/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var cubit = MainCubit.get(context);
    cubit.getPosts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 59, 92),
        title: const Text("Posts"),
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return state is GetPostsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is GetPostsErrorState
                  ? const Center(child: Text("Please Try again "))
                  : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      itemBuilder: (context, index) {
                        return Card(
                          color:  Color.fromARGB(255, 208, 185, 193),
                          child: ListTile(
                    
                            leading: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 153, 59, 92),
                              child: Text(cubit.posts[index].id.toString()),
                            ),
                            title: Text(cubit.posts[index].title!,style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(cubit.posts[index].body!,
                            maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(color: Color.fromARGB(255, 92, 6, 139)),),
                          ),
                        );
                      },
                      itemCount: cubit.posts.length,
                    );
        },
      ),
    );
  }
}