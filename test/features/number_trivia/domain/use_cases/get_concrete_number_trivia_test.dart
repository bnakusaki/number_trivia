import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/models/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';

class MockkNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? useCase;
  MockkNumberTriviaRepository? mockkNumberTriviaRepository;

  setUp(() {
    mockkNumberTriviaRepository = MockkNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mockkNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tTrivia = NumberTrivia(text: 'text', number: 1);

  test('Should get a number trivia from the repository', () async {
    when(mockkNumberTriviaRepository!.getConcreteNumberTrivia(1)).thenAnswer((_) async => const Right(tTrivia));
    final result = await useCase!.execute(number: tNumber);

    expect(result, const Right(tTrivia));
    verify(mockkNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockkNumberTriviaRepository);
  });
}
