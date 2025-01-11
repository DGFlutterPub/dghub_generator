class AsyncState {}

class AsyncLoading extends AsyncState {}

class AsyncSuccess<T> extends AsyncState {
  final T data;
  AsyncSuccess(this.data);
}

class AsyncFailed extends AsyncState {
  final String error;
  AsyncFailed(this.error);
}
