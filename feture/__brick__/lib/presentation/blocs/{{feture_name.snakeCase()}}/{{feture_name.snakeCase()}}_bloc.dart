import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/{{feture_name.snakeCase()}}_entity.dart';
import '../../../domain/usecases/{{feture_name.snakeCase()}}/{{feture_name.snakeCase()}}_usecases.dart';

part '{{feture_name.snakeCase()}}_event.dart';
part '{{feture_name.snakeCase()}}_state.dart';

class {{feture_name.pascalCase()}}Bloc extends Bloc<{{feture_name.pascalCase()}}Event, {{feture_name.pascalCase()}}State> {
  {{#usecases}}final {{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Usecase {{usecase_name.camelCase()}}{{feture_name.pascalCase()}}Usecase;
  {{/usecases}}
  {{feture_name.pascalCase()}}Bloc({
    {{#usecases}}required this.{{usecase_name.camelCase()}}{{feture_name.pascalCase()}}Usecase,
    {{/usecases}}
  }) : super({{feture_name.pascalCase()}}State.initial()) {
    {{#usecases}}on<{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Event>(_on{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Event);
    {{/usecases}}}
    {{#usecases}}
    Future<void> _on{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Event(
      {{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Event event,
      Emitter<{{feture_name.pascalCase()}}State> emit,
    ) async {
      {{#stream}}return emit.forEach<{{return.pascalCase()}}>(
        {{usecase_name.camelCase()}}{{feture_name.pascalCase()}}Usecase({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params(
        {{#params}}{{param_name}}: event.{{param_name}},
        {{/params}}
      ){{/has_params}}{{^has_params}}NoParams(){{/has_params}}),
        onData: ({{feture_name.camelCase()}}) {
          /// TODO: implement [{{feture_name.camelCase()}}] handling.
          throw UnimplementedError();
        },
        onError: (error, stackTrace) {
          final Failure failure;
          if (error is Failure) {
            failure = error;
          } else {
            failure = UnknownFailure(error.toString());
          }
          throw failure;
        },
      );{{/stream}}{{^stream}}final originalState = state;
      // TODO: emit loading state.
      // emit({{feture_name.pascalCase()}}State.);
      final result = await {{usecase_name.camelCase()}}{{feture_name.pascalCase()}}Usecase({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params(
        {{#params}}{{param_name}}: event.{{param_name}},
        {{/params}}
      ){{/has_params}}{{^has_params}}NoParams(){{/has_params}});
      result.fold(
        (failure) {
          ///TODO: implement [failure] handling.
          throw UnimplementedError();
        },
        ({{feture_name.camelCase()}}) {
          ///TODO: implement [{{feture_name.camelCase()}}] handling.
          throw UnimplementedError();
        },
      );
      if(state is ErrorState) emit(originalState);{{/stream}}
    }
    {{/usecases}}

  @override
  void onTransition(Transition<{{feture_name.pascalCase()}}Event, {{feture_name.pascalCase()}}State> transition) {
    super.onTransition(transition);
    log(transition.nextState.toString());
  }
}
