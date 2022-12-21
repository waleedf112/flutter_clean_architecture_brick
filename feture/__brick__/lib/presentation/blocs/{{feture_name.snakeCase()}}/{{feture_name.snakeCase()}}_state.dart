part of '{{feture_name.snakeCase()}}_bloc.dart';

enum {{feture_name.pascalCase()}}CurrentState {
  {{#states}}{{state_name.camelCase()}},
  {{/states}}
}

abstract class {{feture_name.pascalCase()}}State extends Equatable {
  final {{feture_name.pascalCase()}} {{feture_name.camelCase()}};
  final {{feture_name.pascalCase()}}CurrentState currentState;

  const {{feture_name.pascalCase()}}State._({
    required this.{{feture_name.camelCase()}},
    required this.currentState,
  });
  {{#states}}{{#has_params}}factory {{feture_name.pascalCase()}}State.{{state_name.camelCase()}}({
    {{#contains_model}}required {{feture_name.pascalCase()}} {{feture_name.camelCase()}},{{/contains_model}}
    {{#params}}required {{{param_type.pascalCase()}}} {{param_name.camelCase()}},
    {{/params}}
  }) => {{state_name.pascalCase()}}{{feture_name.pascalCase()}}State(
    {{#contains_model}}{{feture_name.camelCase()}}: {{feture_name.camelCase()}},{{/contains_model}}
    {{#params}}{{param_name.camelCase()}}: {{param_name.camelCase()}},
    {{/params}}
  );
  {{/has_params}}{{^has_params}}factory {{feture_name.pascalCase()}}State.{{state_name.camelCase()}}() => const {{state_name.pascalCase()}}{{feture_name.pascalCase()}}State();
  {{/has_params}}{{/states}}
  @override
  List get props => [{{feture_name.camelCase()}}, currentState];
}
{{#states}}
class {{state_name.pascalCase()}}{{feture_name.pascalCase()}}State extends {{feture_name.pascalCase()}}State {
  {{#params}}final {{{param_type.pascalCase()}}} {{param_name.camelCase()}};
  {{/params}}
  const {{state_name.pascalCase()}}{{feture_name.pascalCase()}}State({{#has_params}}{
    {{#params}}required this.{{param_name.camelCase()}},{{/params}}
    {{#contains_model}}required super.{{feture_name.camelCase()}},{{/contains_model}}
  }{{/has_params}}) : super._(
          {{^contains_model}}{{feture_name.camelCase()}}: const {{feture_name.pascalCase()}}.empty(),{{/contains_model}}
          currentState: {{feture_name.pascalCase()}}CurrentState.{{state_name.camelCase()}},
        );

  {{#has_params}}@override
  List<Object{{#has_nullables}}?{{/has_nullables}}> get props => [
    {{feture_name.camelCase()}},
    currentState,
    {{#params}}{{param_name.camelCase()}},
    {{/params}}
    ];{{/has_params}}
}
{{/states}}