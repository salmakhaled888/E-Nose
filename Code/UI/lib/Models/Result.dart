/// Result : 0

class Result {
  Result({
      num? result,}){
    _result = result;
}

  Result.fromJson(dynamic json) {
    _result = json['Result'];
  }
  num? _result;
Result copyWith({  num? result,
}) => Result(  result: result ?? _result,
);
  num? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Result'] = _result;
    return map;
  }

}