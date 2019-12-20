class DeleteResponse {
  Success success;

  DeleteResponse({this.success});

  factory DeleteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResponse(
      success: json['success'],
    );
  }
  }

class Success {
  String text;

  Success({this.text});

  factory Success.fromJson(Map<String, dynamic> json) {
    return Success(
        text : json['text'],
    );
  }
}

