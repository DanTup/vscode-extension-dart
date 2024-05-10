import 'dart:js_interop';
import 'dart:js_interop_unsafe';

void main() {
  print('In Dart main!');
  globalContext.setProperty(
    'vscode_dart'.toJS,
    // Why doesn't any of this work, but putting something
    // like '1'.toJs does?
    // createJSInteropWrapper(Extension()),
    // Extension().activate,
    '1'.toJS,
  );
}

void activate() {
  print('Activated!');
}

@JSExport()
class Extension {
  @JSExport()
  void activate() {
    print('Activated');
  }

  @JSExport()
  void deactivate() {
    print('Deactivated');
  }
}
