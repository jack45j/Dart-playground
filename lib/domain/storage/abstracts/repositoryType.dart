
import '../../book_domain.dart';

abstract class RepositoryType<T extends Identifiable> implements Creatable<T>, Readable<T>, Updatable<T>, Deletable<T> {}