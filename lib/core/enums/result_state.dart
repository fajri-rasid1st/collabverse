/// Represents the state of a result from server.
enum ResultState {
  loading,
  success,
  error;

  bool get isLoading => this == ResultState.loading;
  bool get isSuccess => this == ResultState.success;
  bool get isError => this == ResultState.error;
}
