import 'dart:js_interop';
import 'dart:js_interop_unsafe';

void main() {
  activate = _activateImpl.toJS;
  deactivate = _deactivateImpl.toJS;
}

@JS('vs_code_dart_activate')
external set activate(JSAny x);

@JS('vs_code_dart_deactivate')
external set deactivate(JSAny x);

void _activateImpl(JSObject context) {
  print('HELLO FROM DART (at ${context.getProperty('extensionPath'.toJS)})');

  // TODO: Implement registering the helloWorld command
  //  and and remove the "*" from activation events.
}

void _deactivateImpl() {
  print('GOODBYE FROM DART');
}
