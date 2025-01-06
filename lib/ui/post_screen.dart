import 'package:bloc_tutorial/bloc/post/post_bloc.dart';
import 'package:bloc_tutorial/bloc/post/post_event.dart';
import 'package:bloc_tutorial/bloc/post/post_state.dart';
import 'package:bloc_tutorial/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.LOADING:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.FAILURE:
            return Center(child: Text("Failed to load ${state.message} "));
          case PostStatus.SUCCESS:
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search with title',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) {
                    context.read<PostBloc>().add(SearchItem(v));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Center(child: Text(state.searchMessage.toString()))
                      : ListView.builder(
                          itemCount: state.tempPostList.isEmpty
                              ? state.postList.length
                              : state.tempPostList.length,
                          itemBuilder: (context, index) {
                            if (state.tempPostList.isNotEmpty) {
                              final item = state.tempPostList[index];
                              return Card(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(12),
                                  leading: Text(item.id.toString()),
                                  title:
                                      Text(item.title.toString().toUpperCase()),
                                  subtitle: Text(item.body.toString()),
                                  trailing: Text(item.userId.toString()),
                                ),
                              );
                            } else {
                              final item = state.postList[index];
                              return Card(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(12),
                                  leading: Text(item.id.toString()),
                                  title:
                                      Text(item.title.toString().toUpperCase()),
                                  subtitle: Text(item.body.toString()),
                                  trailing: Text(item.userId.toString()),
                                ),
                              );
                            }
                          }),
                ),
              ],
            );
        }
      }),
    );
  }
}
