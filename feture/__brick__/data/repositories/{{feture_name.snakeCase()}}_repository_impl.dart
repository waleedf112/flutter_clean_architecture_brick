import 'package:dartz/dartz.dart';

import '../datasources/core/error/failure.dart';
import '../datasources/domain/entities/{{feture_name.snakeCase()}}_entity.dart';
import '../datasources/domain/repositories/{{feture_name.snakeCase()}}_repository.dart';
import '../datasources/domain/usecases/partnership/{{feture_name.snakeCase()}}_usecases.dart';
{{#datasources}}import '../datasources/{{feture_name.snakeCase()}}_{{datasource_name.snakeCase()}}_data_source.dart';
{{/datasources}}import '../models/{{feture_name.snakeCase()}}_model.dart';

class {{feture_name.pascalCase()}}RepositoryImpl implements {{feture_name.pascalCase()}}Repository {
  {{#datasources}}final {{feture_name.pascalCase()}}{{datasource_name.pascalCase()}}DataSource {{datasource_name.camelCase()}}DataSource;
  {{/datasources}}
  {{feture_name.pascalCase()}}RepositoryImpl({
    {{#datasources}}required this.{{datasource_name.camelCase()}}DataSource,
  {{/datasources}}});

  {{#usecases}}{{#stream}}@override
  Stream<{{return}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async* {
    {{#datasources}}final Stream<{{feture_name.pascalCase()}}Model> stream = {{datasource_name.camelCase()}}DataSource.{{usecase_name.camelCase()}}({{#has_params}}params{{/has_params}});
    {{/datasources}}yield* stream.asyncExpand<{{feture_name.pascalCase()}}>(({{feture_name.camelCase()}}) async* {
      yield {{feture_name.camelCase()}};
    });
  }{{/stream}}
  {{^stream}}@override
  Future<Either<Failure, {{return}}>> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async {
    try {
      {{#datasources}}final result = {{datasource_name.camelCase()}}DataSource.{{usecase_name.camelCase()}}({{#has_params}}params{{/has_params}});
      {{/datasources}}return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }{{/stream}}{{/usecases}}
}