sealed class ActionState<T> {
  const ActionState();
}

class LoadingState<T> extends ActionState<T> {
  const LoadingState();
}

class SuccessState<T> extends ActionState<T> {
  final T data;

  const SuccessState(this.data);
}

class ErrorState<T> extends ActionState<T> {
  final String errorMessage;

  const ErrorState(this.errorMessage);
}
