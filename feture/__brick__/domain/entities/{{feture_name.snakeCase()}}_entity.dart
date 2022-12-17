import 'package:equatable/equatable.dart';

class {{feture_name.pascalCase()}} extends Equatable {
  {{#entity_params}}final {{param_type}} {{param_name}};
  {{/entity_params}}
  const {{feture_name.pascalCase()}}({
    {{#entity_params}}required this.{{param_name}},
    {{/entity_params}}
  });

  const {{feture_name.pascalCase()}}.empty() : 
  {{#entity_params}}{{param_name}} = {{{default}}}{{^is_last}},{{/is_last}}{{#is_last}};{{/is_last}}
  {{/entity_params}}
  @override
  List<Object> get props => [
    {{#entity_params}}{{param_name}},
    {{/entity_params}}];
}
