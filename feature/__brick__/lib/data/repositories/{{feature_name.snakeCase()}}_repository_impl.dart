import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_usecases.dart';
import '../datasources/{{feature_name.snakeCase()}}_{{datasource.snakeCase()}}_data_source.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {{datasource.camelCase()}}DataSource;

  {{feature_name.pascalCase()}}RepositoryImpl({
    required this.{{datasource.camelCase()}}DataSource,
  });

  {{#usecases}}{{#stream}}@override
  Stream<{{return}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}}) async* {
    final Stream<{{feature_name.pascalCase()}}Model> stream = {{datasource.camelCase()}}DataSource.{{usecase_name.camelCase()}}({{#has_params}}params{{/has_params}});
    yield* stream.asyncExpand<{{feature_name.pascalCase()}}>(({{feature_name.camelCase()}}) async* {
      yield {{feature_name.camelCase()}};
    });
  }{{/stream}}
  {{^stream}}@override
  Future<Either<Failure, {{return}}>> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}}) async {
    try {
      final result = await {{datasource.camelCase()}}DataSource.{{usecase_name.camelCase()}}({{#has_params}}params{{/has_params}});
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }{{/stream}}{{/usecases}}
}