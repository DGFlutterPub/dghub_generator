class PaginationState<T> {
  T? value;
}

class PaginationLoading<T> extends PaginationState<T> {}

class PaginationSuccess<T> extends PaginationState<T> {
  PaginationSuccess(T? value);
}

class PaginationFailed<T> extends PaginationState<T> {
  final String error;
  PaginationFailed(this.error);
}

class PaginationLoadMoreLoading<T> extends PaginationState<T> {}

class PaginationLoadMoreSuccess<T> extends PaginationState<T> {}

class PaginationLoadMoreFailed<T> extends PaginationState<T> {
  final String error;
  PaginationLoadMoreFailed(this.error);
}

class PaginationEnd<T> extends PaginationState<T> {}
