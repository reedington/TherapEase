class Pagination {
  int page;
  int total;
  int size;
  int? book;
  int limit;
  DateTime? lastDate;
  String search;
  int? id;
  bool? receiver;
  Pagination({
    this.page = 1,
    this.total = 100,
    this.size = 20,
    this.book,
    this.search = '',
    this.lastDate,
    this.limit = 4,
    this.id,
    this.receiver,
  });
}

class ButtonState {
  bool canSend;
  bool isSending;

  ButtonState({
    this.canSend = true,
    this.isSending = false,
  });

  ButtonState setCanSend(bool value) {
    canSend = value;
    isSending = isSending;

    return ButtonState(
      canSend: canSend,
      isSending: isSending,
    );
  }

  ButtonState setIsSend(bool value) {
    canSend = canSend;
    isSending = value;

    return ButtonState(
      canSend: canSend,
      isSending: isSending,
    );
  }

  ButtonState resetBoth() {
    canSend = true;
    isSending = false;
    return ButtonState(
      canSend: canSend,
      isSending: isSending,
    );
  }

  @override
  String toString() {
    return 'ButtonState(canSend: $canSend, isSending: $isSending)';
  }
}

class CustomError {
  final String message;

  CustomError({
    required this.message,
  });

  factory CustomError.fromJson(Map<String, dynamic> data) {
    return CustomError(
      message: data['message'],
    );
  }
}
