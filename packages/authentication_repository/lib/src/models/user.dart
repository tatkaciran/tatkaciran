import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String? email;
  final String id;
  final String? name;
  final String? photo;

  const AuthUser({
    this.email,
    required this.id,
    this.name,
    this.photo,
  });

  const AuthUser.empty() : this(email: '', id: '', name: null, photo: null);

  @override
  List<Object> get props => [id];
}
