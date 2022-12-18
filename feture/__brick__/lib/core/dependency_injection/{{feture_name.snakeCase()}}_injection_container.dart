import '../../../../data/datasources/{{feture_name.snakeCase()}}_{{datasource.snakeCase()}}_data_source.dart';
import '../../../../data/repositories/{{feture_name.snakeCase()}}_repository_impl.dart';
import '../../../../domain/repositories/{{feture_name.snakeCase()}}_repository.dart';
import '../../../../domain/usecases/{{feture_name.snakeCase()}}/{{feture_name.snakeCase()}}_usecases.dart';
import '../../../../presentation/blocs/{{feture_name.snakeCase()}}/{{feture_name.snakeCase()}}_bloc.dart';
import 'dependency_injection.dart';

abstract class {{feture_name1.pascalCase()}}InjectionContainer {
  static void init() {
    sl.registerLazySingleton<{{feture_name.pascalCase()}}Bloc>(
      () => {{feture_name.pascalCase()}}Bloc({{#usecases}}
        {{usecase_name.camelCase()}}{{feture_name.pascalCase()}}Usecase: sl(),{{/usecases}}
      ),
    );
    sl.registerLazySingleton<{{feture_name.pascalCase()}}Repository>(
      () => {{feture_name.pascalCase()}}RepositoryImpl(
        {{datasource.camelCase()}}DataSource: sl(),
      ),
    );
    sl.registerLazySingleton<{{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSource>(
      () => {{feture_name.pascalCase()}}{{datasource.pascalCase()}}DataSourceImpl(),
    );

    {{#usecases}}sl.registerLazySingleton<{{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Usecase>(() => {{usecase_name.pascalCase()}}{{feture_name.pascalCase()}}Usecase(repository: sl()));
    {{/usecases}}
  }
}