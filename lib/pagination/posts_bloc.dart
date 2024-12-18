import 'package:bloc/bloc.dart';
import 'package:bloc_api/pagination/post_model.dart';
import 'package:bloc_api/pagination/posts_api.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>((event, emit) async{
      if(event is GetPostsEvent){
        if(state.hasReachedMax)return;
        try{
          if(state.status==PostStatus.loading){
            final posts=await PostsApi.getPosts();
            return posts.isEmpty?
            emit(state.copyWith(status:PostStatus.success,
                hasReachedMax: true)):
            emit(state.copyWith(status: PostStatus.success,
                posts:posts,
                hasReachedMax: false),
            );
          }else{
            final posts= await PostsApi.getPosts(state.posts.length);
             posts.isEmpty?
                emit(state.copyWith(hasReachedMax: true)):
                emit(state.copyWith(status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false),
                );
          }
        }
            catch(e){
          emit(state.copyWith(status: PostStatus.error,
              errorMessage: "Faild to fetch posts"));
            }
      }
    },transformer: droppable());
  }
}
