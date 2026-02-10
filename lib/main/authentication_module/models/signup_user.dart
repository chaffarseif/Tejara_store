import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SignupModel extends Equatable {
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String role;

  const SignupModel({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.role,
  });

  @override
  List<Object?> get props => [firstname, lastname, email, phone, password];
}
