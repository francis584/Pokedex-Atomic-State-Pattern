// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class TypeModel extends Equatable {
  final String name;

  TypeModel({
    required this.name,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    return data;
  }

  @override
  List<Object> get props => [name];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      name: map['name'] as String,
    );
  }
}
