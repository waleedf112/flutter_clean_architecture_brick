import '../../domain/entities/{{feture_name.snakeCase()}}_entity.dart';

class {{feture_name.pascalCase()}}Model extends {{feture_name.pascalCase()}} {
  const {{feture_name.pascalCase()}}Model({
    {{#entity_params}}required super.{{param_name}},
    {{/entity_params}}
  });

  /// TODO: [{{feture_name.pascalCase()}}Model.fromX] method name.
  factory {{feture_name.pascalCase()}}Model.fromX(Map<String, dynamic> document) {
    return {{feture_name.pascalCase()}}Model(
      {{#entity_params}}{{param_name}}: document['{{param_name}}'],
      {{/entity_params}}
    );
  }
}
