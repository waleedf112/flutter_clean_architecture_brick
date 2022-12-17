import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/{{feture_name.snakeCase()}}_entity.dart';
import '../../repositories/{{feture_name.snakeCase()}}_repository.dart';

{{#usecases}}part '../../../../domain/usecases/{{feture_name.snakeCase()}}/{{usecase_name.snakeCase()}}_{{feture_name.snakeCase()}}_usecase.dart';
{{/usecases}}