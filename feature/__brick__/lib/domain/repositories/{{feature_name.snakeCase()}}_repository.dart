import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../usecases/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_usecases.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  {{#usecases}}{{#stream}}Stream<{{return}}>{{/stream}}{{^stream}}Future<Either<Failure, {{return}}>>{{/stream}} {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}});
  {{/usecases}}
}
