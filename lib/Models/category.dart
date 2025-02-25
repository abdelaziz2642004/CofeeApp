import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class category {
  final String _id;
  final String name;

  String get id => _id;

  category({required this.name}) : _id = uuid.v4();
}
