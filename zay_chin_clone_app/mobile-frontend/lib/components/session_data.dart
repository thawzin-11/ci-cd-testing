class SessionData {
  final String userName;
  final String phNumber;

  SessionData(this.userName, this.phNumber);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["userName"] = this.userName;
    data["phNumber"] = this.phNumber;
    return data;
  }
}
