import '../../../../data/datasources/{{feature_name.snakeCase()}}_{{datasource.snakeCase()}}_data_source.dart';
import '../../../../data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import '../../../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../../../domain/usecases/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_usecases.dart';
import '../../../../presentation/blocs/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_bloc.dart';
import 'dependency_injection.dart';

abstract class {{feature_name.pascalCase()}}InjectionContainer {
  static void init() {
    sl.registerLazySingleton<{{feature_name.pascalCase()}}Bloc>(
      () => {{feature_name.pascalCase()}}Bloc({{#usecases}}
        {{usecase_name.camelCase()}}{{feature_name.pascalCase()}}Usecase: sl(),{{/usecases}}
      ),
    );
    sl.registerLazySingleton<{{feature_name.pascalCase()}}Repository>(
      () => {{feature_name.pascalCase()}}RepositoryImpl(
        {{datasource.camelCase()}}DataSource: sl(),
      ),
    );
    sl.registerLazySingleton<{{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSource>(
      () => {{feature_name.pascalCase()}}{{datasource.pascalCase()}}DataSourceImpl(),
    );

    {{#usecases}}sl.registerLazySingleton<{{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Usecase>(() => {{usecase_name.pascalCase()}}{{feature_name.pascalCase()}}Usecase(repository: sl()));
    {{/usecases}}
  }
}