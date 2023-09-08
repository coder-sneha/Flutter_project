class ServiceResponse {
  bool status;
  dynamic data;

  ServiceResponse(this.status, this.data);

  @override
  String toString() {
    return 'ServiceResponse{status: $status, data: $data}';
  }
}
