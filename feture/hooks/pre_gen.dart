import 'package:mason/mason.dart';

void run(HookContext context) {
  final vars = context.vars;
  vars['entity']['has_nullables'] = false;

  for (int i = 0; i < vars['entity']['entity_params'].length; i++) {
    vars['entity']['entity_params'][i]['is_last'] = i == vars['entity']['entity_params'].length - 1;
    final String type = vars['entity']['entity_params'][i]['param_type'];
    var defaultValue = vars['entity']['entity_params'][i]['default'];
    if (defaultValue == null) {
      if (type.endsWith('?')) {
        defaultValue = 'null';
      } else if (type == 'String') {
        defaultValue = '\'\'';
      } else if (type == 'int') {
        defaultValue = -1;
      } else if (type == 'DateTime') {
        defaultValue = 'DateTime.fromMicrosecondsSinceEpoch(0)';
      } else if (type.startsWith('Map')) {
        defaultValue = 'const {}';
      } else if (type.startsWith('List')) {
        defaultValue = 'const []';
      } else {
        throw "select a default value for ${vars['entity']['entity_params'][i]['param_name']}";
      }
    } else {
      if (type == 'String') {
        defaultValue = '\'${defaultValue}\'';
      }
    }

    vars['entity']['entity_params'][i]['default'] = defaultValue;
    if (type.endsWith('?') && !vars['entity']['has_nullables']) {
      vars['entity']['has_nullables'] = true;
    }
  }

  for (int i = 0; i < vars['usecases'].length; i++) {
    vars['usecases'][i]['has_nullables'] = false;
    vars['usecases'][i]['has_params'] = vars['usecases'][i]['params']?.isNotEmpty ?? false;
    vars['usecases'][i]['return'] ??= 'void';
    vars['usecases'][i]['return_model'] ??= 'void';
    vars['usecases'][i]['stream'] ??= false;
    if (vars['usecases'][i]['has_params']) {
      for (int j = 0; j < vars['usecases'][i]['params']?.length; j++) {
        final String type = vars['usecases'][i]['params'][j]['param_type'];
        if (type.endsWith('?') && !vars['usecases'][i]['has_nullables']) {
          vars['usecases'][i]['has_nullables'] = true;
        }
      }
    }
  }

  for (int i = 0; i < vars['states'].length; i++) {
    vars['states'][i]['has_nullables'] = false;
    vars['states'][i]['contains_model'] ??= false;
    vars['states'][i]['has_params'] = vars['states'][i]['params']?.isNotEmpty ?? false || vars['states'][i]['contains_model'];
    if (vars['states'][i]['has_params']) {
      if (vars['states'][i]['params'] != null) {
        for (int j = 0; j < vars['states'][i]['params'].length; j++) {
          final String type = vars['states'][i]['params'][j]['param_type'];
          if (type.endsWith('?') && !vars['states'][i]['has_nullables']) {
            vars['states'][i]['has_nullables'] = true;
          }
        }
      }
    }
  }
  context.vars = vars;
}
