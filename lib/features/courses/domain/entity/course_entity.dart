import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? id;
  final String title;

  const CourseEntity({
    this.id,
    required this.title,
  });

  const CourseEntity.empty()
      : id = '',
        title = '';

  @override
  List<Object?> get props => [id, title];
}
