import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/{{feture_name.snakeCase()}}_entity.dart';
import '../usecases/{{feture_name.snakeCase()}}/{{feture_name.snakeCase()}}_usecases.dart';

abstract class {{feture_name.pascalCase()}}Repository {
  {{#usecases}}{{#stream}}Stream<{{return}}>{{/stream}}{{^stream}}Future<Either<Failure, {{return}}>>{{/stream}} {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}});
  {{/usecases}}
}
