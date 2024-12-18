import 'package:bloc_api/pagination/loading_widget.dart';
import 'package:bloc_api/pagination/post_list_item.dart';
import 'package:bloc_api/pagination/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  ScrollController _scrollController = ScrollController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController..removeListener(_onScroll)..dispose();
    super.dispose();
  }
void _onScroll (){
  final maxScroll=_scrollController.position.maxScrollExtent;
  final _currntScroll=_scrollController.offset;
if(_currntScroll >= (maxScroll * 0.9)){
  context.read<PostsBloc>().add(GetPostsEvent());
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Posts Page"),

      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {

          switch(state.status){

            case PostStatus.loading:
              return LoadingWidget();
            case PostStatus.success:
              if(state.posts.isEmpty){
                return Text("No Data");
              }
             return ListView.builder(
               controller: _scrollController,
               itemCount: state.hasReachedMax
                   ?state.posts.length:
              state.posts.length +1,
                 itemBuilder: (BuildContext context, int index){
                   return index >= state.posts.length
                       ? const LoadingWidget()
                       : PostListItem(post: state.posts[index]);
                 },
             );

            case PostStatus.error:
              return Text(state.errorMessage);

          }


          },
      ),
    );
  }
}
