import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/error/failure.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_usecases.dart';

abstract class {{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {
  {{#usecases}}{{#stream}}Stream{{/stream}}{{^stream}}Future{{/stream}}<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}});
  {{/usecases}}
}

class {{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSourceImpl implements {{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSource {
  {{#usecases}}{{#stream}}
  @override
  Stream<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}}) async* {
    //TODO: implement {{usecase_name}}
    final Stream stream = Stream.empty();
    yield* stream.asyncExpand<{{return_model}}>((result) async* {
      throw UnimplementedError();
    });
  }{{/stream}}{{^stream}}
  @override
  Future<{{return_model}}> {{usecase_name.camelCase()}}({{#has_params}}{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Params params{{/has_params}}) async {
    //TODO: implement {{usecase_name}}
  }{{/stream}}{{/usecases}}
}
