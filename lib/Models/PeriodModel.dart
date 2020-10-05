class Period {
  String date;
  int precision;

  Period({this.date, this.precision});

  Period.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    precision = json['precision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['precision'] = this.precision;
    return data;
  }
}