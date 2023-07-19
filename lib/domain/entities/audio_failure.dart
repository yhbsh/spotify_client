import '../../core/interfaces/failure.dart';

class AudioFailure implements Failure {
  @override
  final String message;

  const AudioFailure({required this.message});
}
