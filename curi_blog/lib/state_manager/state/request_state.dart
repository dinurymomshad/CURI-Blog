abstract class RequestState {
  const RequestState();
}

class RequestInitialState extends RequestState {
  const RequestInitialState();
}

class RequestLoadingState extends RequestState {
  const RequestLoadingState();
}

class RequestLoadedState extends RequestState {
  final dynamic responseObject;
  const RequestLoadedState(this.responseObject);
}

class RequestErrorState extends RequestState {
  final String message;
  const RequestErrorState(this.message);
}
