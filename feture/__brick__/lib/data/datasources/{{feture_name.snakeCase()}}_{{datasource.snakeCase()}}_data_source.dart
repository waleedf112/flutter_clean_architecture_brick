import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/error/failure.dart';
import '../models/{{feture_name.snakeCase()}}_model.dart';

abstract class {{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {
  {{#usecases}}{{#stream}}Stream{{/stream}}{{^stream}}Future{{/stream}}<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}});
  {{/usecases}}
}

class {{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSourceImpl implements {{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {
  {{#usecases}}{{#stream}}
  @override
  Stream<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async* {
    yield* stream.asyncExpand<{{return_model}}>((result) async* {
      //TODO: implement {{usecase_name}}
    });
  }{{/stream}}{{^stream}}
  @override
  Future<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Params params{{/has_params}}) async {
    //TODO: implement {{usecase_name}}
  }{{/stream}}{{/usecases}}
}
