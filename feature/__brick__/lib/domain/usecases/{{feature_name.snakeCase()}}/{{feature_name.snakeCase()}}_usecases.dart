import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../repositories/{{feature_name.snakeCase()}}_repository.dart';

{{#usecases}}part '{{usecase_name.snakeCase()}}_{{feature_name.snakeCase()}}_usecase.dart';
{{/usecases}}