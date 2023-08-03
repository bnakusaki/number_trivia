import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/models/number_trivia.dart';

/// The method of the repository should match the use case of each feature.
/// The Number Trivia feature has two use cases which are
/// 1. Get concrete number trivia.
/// 2. Get random number trivia.
/// Therefore the domain will have this abstract class delcaring the repository,
/// the the data layer will implement this class and give it the data it wants.
/// There by making both layers independent.

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int numnber);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
