part of 'posts_bloc.dart';
enum PostStatus{loading,success,error}
@immutable
 class PostsState extends Equatable {
  final PostStatus status;
  final List<Post>posts;
  final bool hasReachedMax;
  final String errorMessage;
  const PostsState({
    this.status=PostStatus.loading,
    this.posts=const[],
    this.errorMessage="",
     this.hasReachedMax=false
}

      );
  PostsState copyWith({
     PostStatus ?status,
     List<Post> ?posts,
     bool ?hasReachedMax,
     String? errorMessage,
}){
    return PostsState(
      status: status??this.status,
      posts: posts??this.posts,
      errorMessage: errorMessage??this.errorMessage,
      hasReachedMax: hasReachedMax??this.hasReachedMax
    );
  }
  @override
  List<Object> get props=>[status,posts,errorMessage,hasReachedMax];
}

// final class PostsInitial extends PostsState {}
//final class PostsLoadingState extends PostsState{}
//final class PostsLoadedState extends PostsState{}
