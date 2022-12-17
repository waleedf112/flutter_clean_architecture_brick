import 'package:mason/mason.dart';

void run(HookContext context) {
  final vars = context.vars;
  for (int i = 0; i < vars['entity_params'].length; i++) {
    vars['entity_params'][i]['is_last'] = i == vars['entity_params'].length - 1;
    final String type = vars['entity_params'][i]['param_type'];
    if (vars['entity_params'][i]['default'] == null) {
      if (type.endsWith('?')) {
        vars['entity_params'][i]['default'] = 'null';
      } else if (type == 'String') {
        vars['entity_params'][i]['default'] = '\'\'';
      } else if (type == 'int') {
        vars['entity_params'][i]['default'] = -1;
      } else if (type == 'DateTime') {
        vars['entity_params'][i]['default'] = 'DateTime.fromMicrosecondsSinceEpoch(0)';
      } else if (type.startsWith('Map')) {
        vars['entity_params'][i]['default'] = 'const {}';
      } else if (type.startsWith('List')) {
        vars['entity_params'][i]['default'] = 'const []';
      } else {
        throw "select a default value for ${vars['entity_params'][i]['param_name']}";
      }
    } else {
      if (type == 'String') {
        vars['entity_params'][i]['default'] = '\'${vars['entity_params'][i]['default']}\'';
      }
    }
  }
  for (int i = 0; i < vars['usecases'].length; i++) {
    vars['usecases'][i]['has_params'] = vars['usecases'][i]['params']?.isNotEmpty ?? false;
    vars['usecases'][i]['return'] ??= 'void';
    vars['usecases'][i]['return_model'] ??= 'void';
    vars['usecases'][i]['stream'] ??= false;
  }
  context.vars = vars;
}
