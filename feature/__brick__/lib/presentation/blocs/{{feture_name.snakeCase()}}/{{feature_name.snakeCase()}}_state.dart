part of '{{feature_name.snakeCase()}}_bloc.dart';

enum {{feature_name.pascalCase()}}CurrentState {
  {{#states}}{{state_name.camelCase()}},
  {{/states}}
}

abstract class {{feature_name.pascalCase()}}State extends Equatable {
  final {{feature_name.pascalCase()}} {{feature_name.camelCase()}};
  final {{feature_name.pascalCase()}}CurrentState currentState;

  const {{feature_name.pascalCase()}}State._({
    required this.{{feature_name.camelCase()}},
    required this.currentState,
  });
  {{#states}}{{#has_params}}factory {{feature_name.pascalCase()}}State.{{state_name.camelCase()}}({
    {{#contains_model}}required {{feature_name.pascalCase()}} {{feature_name.camelCase()}},{{/contains_model}}
    {{#params}}required {{{param_type.pascalCase()}}} {{param_name.camelCase()}},
    {{/params}}
  }) => {{state_name.pascalCase()}}{{feature_name.pascalCase()}}State(
    {{#contains_model}}{{feature_name.camelCase()}}: {{feature_name.camelCase()}},{{/contains_model}}
    {{#params}}{{param_name.camelCase()}}: {{param_name.camelCase()}},
    {{/params}}
  );
  {{/has_params}}{{^has_params}}factory {{feature_name.pascalCase()}}State.{{state_name.camelCase()}}() => const {{state_name.pascalCase()}}{{feature_name.pascalCase()}}State();
  {{/has_params}}{{/states}}
  @override
  List get props => [{{feature_name.camelCase()}}, currentState];
}
{{#states}}
class {{state_name.pascalCase()}}{{feature_name.pascalCase()}}State extends {{feature_name.pascalCase()}}State {
  {{#params}}final {{{param_type.pascalCase()}}} {{param_name.camelCase()}};
  {{/params}}
  const {{state_name.pascalCase()}}{{feature_name.pascalCase()}}State({{#has_params}}{
    {{#params}}required this.{{param_name.camelCase()}},{{/params}}
    {{#contains_model}}required super.{{feature_name.camelCase()}},{{/contains_model}}
  }{{/has_params}}) : super._(
          {{^contains_model}}{{feature_name.camelCase()}}: const {{feature_name.pascalCase()}}.empty(),{{/contains_model}}
          currentState: {{feature_name.pascalCase()}}CurrentState.{{state_name.camelCase()}},
        );

  {{#has_params}}@override
  List<Object{{#has_nullables}}?{{/has_nullables}}> get props => [
    {{feature_name.camelCase()}},
    currentState,
    {{#params}}{{param_name.camelCase()}},
    {{/params}}
    ];{{/has_params}}
}
{{/states}}