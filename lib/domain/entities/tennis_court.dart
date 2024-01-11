class TennisCourt {
  String? name;
  int? bookingCounter;

  TennisCourt({this.name, this.bookingCounter});

  TennisCourt.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bookingCounter = json['bookingCounter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['bookingCounter'] = bookingCounter;
    return data;
  }
}
