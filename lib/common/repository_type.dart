import 'package:dart_playground/common/identifiable.dart';
import 'package:dart_playground/common/creatable.dart';
import 'package:dart_playground/common/readable.dart';
import 'package:dart_playground/common/updatable.dart';
import 'package:dart_playground/common/deletable.dart';

abstract class RepositoryType<T extends Identifiable> implements Creatable<T>, Readable<T>, Updatable<T>, Deletable<T> {}