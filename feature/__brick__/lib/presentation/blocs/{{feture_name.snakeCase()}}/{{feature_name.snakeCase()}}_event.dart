part of '{{feature_name.snakeCase()}}_bloc.dart';

abstract class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();

  @override
  List get props => [];
}
{{#usecases}}
class {{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Event extends {{feature_name.pascalCase()}}Event {
  {{#has_params}}{{#params}}final {{{param_type}}} {{param_name}};
  {{/params}}{{/has_params}}
  const {{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Event({{#has_params}}{
    {{#params}}required this.{{param_name}},
    {{/params}}
  }{{/has_params}});
  {{#has_params}}@override
  List<Object{{#has_nullables}}?{{/has_nullables}}> get props => [
    {{#params}}{{param_name}},
    {{/params}}
  ];{{/has_params}}
}
{{/usecases}}