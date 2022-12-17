import 'package:mason/mason.dart';

void run(HookContext context) {
  final vars = context.vars;
  for (int i = 0; i < vars['usecases'].length; i++) {
    vars['usecases'][i]['has_params'] = vars['usecases'][i]['params']?.isNotEmpty ?? false;
    vars['usecases'][i]['return'] ??= 'void';
    vars['usecases'][i]['return_model'] ??= 'void';
    vars['usecases'][i]['stream'] ??= false;
  }
  context.vars = vars;
}
