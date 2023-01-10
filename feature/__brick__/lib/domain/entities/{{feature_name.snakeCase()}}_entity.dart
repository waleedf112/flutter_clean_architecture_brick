import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}} extends Equatable {
  {{#entity.entity_params}}final {{{param_type}}} {{param_name}};
  {{/entity.entity_params}}
  const {{feature_name.pascalCase()}}({
    {{#entity.entity_params}}required this.{{param_name}},
    {{/entity.entity_params}}
  });

  const {{feature_name.pascalCase()}}.empty() : 
  {{#entity.entity_params}}{{param_name}} = {{{default}}}{{^is_last}},{{/is_last}}{{#is_last}};{{/is_last}}
  {{/entity.entity_params}}
  @override
  List<Object{{#entity.has_nullables}}?{{/entity.has_nullables}}> get props => [
    {{#entity.entity_params}}{{param_name}},
    {{/entity.entity_params}}];
}
