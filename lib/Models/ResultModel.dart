class Result {
  String year;
  String motnh;
  String day;
  String auxMonth;
  String auxDay;

  Result({this.year, this.motnh, this.day, this.auxMonth, this.auxDay});

  Result.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    motnh = json['motnh'];
    day = json['day'];
    auxMonth = json['auxMonth'];
    auxDay = json['auxDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['motnh'] = this.motnh;
    data['day'] = this.day;
    data['auxMonth'] = this.auxMonth;
    data['auxDay'] = this.auxDay;
    return data;
  }
}