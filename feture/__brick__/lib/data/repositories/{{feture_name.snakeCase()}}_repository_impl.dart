import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/{{feture_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feture_name.snakeCase()}}_repository.dart';
import '../../domain/usecases/{{feture_name.snakeCase()}}/{{feture_name.snakeCase()}}_usecases.dart';
import '../datasources/{{feture_name.snakeCase()}}_{{datasource.snakeCase()}}_data_source.dart';
import '../models/{{feture_name.snakeCase()}}_model.dart';

class {{feture_name.pascalCase()}}RepositoryImpl implements {{feture_name.pascalCase()}}Repository {
  final {{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {{datasource.camelCase()}}DataSource;

  {{feture_name.pascalCase()}}RepositoryImpl({
    required this.{{datasource.camelCase()}}DataSource,
  });

  {{#usecases}}{{#stream}}@override
  Stream<{{return}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async* {
    final Stream<{{feture_name.pascalCase()}}Model> stream = {{datasource.camelCase()}}DataSource.{{usecase_name.camelCase()}}({{#has_params}}params{{/has_params}});
    yield* stream.asyncExpand<{{feture_name.pascalCase()}}>(({{feture_name.camelCase()}}) async* {
      yield {{feture_name.camelCase()}};
    });
  }{{/stream}}
  {{^stream}}@override
  Future<Either<Failure, {{return}}>> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async {
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