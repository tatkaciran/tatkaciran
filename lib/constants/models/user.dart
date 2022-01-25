class User {
  final String? email;
  final String? id;
  final String? name;
  final String? photo;
  final String? role;
  final int? points;
  final bool? darkMode;

  const User({
    this.email,
    this.id,
    this.name,
    this.photo,
    this.role,
    this.points,
    this.darkMode,
  })  : assert(role != null),
        assert(points != null),
        assert(darkMode != null),
        assert(email != null),
        assert(id != null),
        assert(name != null),
        assert(photo != null);

  copyWith({
    String? email,
    String? id,
    String? name,
    String? photo,
    String? role,
    int? points,
    bool? darkMode,
  }) {
    return User(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      role: role ?? this.role,
      points: points ?? this.points,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  static const empty = User(
    email: '',
    id: '',
    name: '',
    photo: '',
    darkMode: false,
    points: 0,
    role: '',
  );
}
