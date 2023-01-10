import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}} {
  const {{feature_name.pascalCase()}}Model({
    {{#entity.entity_params}}required super.{{param_name}},
    {{/entity.entity_params}}
  });

  /// TODO: [{{feature_name.pascalCase()}}Model.fromX] method name.
  factory {{feature_name.pascalCase()}}Model.fromX(Map<String, dynamic> document) {
    return {{feature_name.pascalCase()}}Model(
      {{#entity.entity_params}}{{param_name}}: document['{{param_name}}'],
      {{/entity.entity_params}}
    );
  }
}
