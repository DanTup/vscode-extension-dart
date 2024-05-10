import 'dart:io';
import 'package:path/path.dart' as path;

final vmPath = Platform.resolvedExecutable;
final sdkRootPath = path.dirname(path.dirname(Platform.resolvedExecutable));
final preambleFile = File(
    path.join(sdkRootPath, r'lib\_internal\js_runtime\lib\preambles\d8.js'));
final compiledExtensionFile = File('out/extension.js');

Future<void> main() async {
  print('Deleting old compiled file...');
  try {
    compiledExtensionFile.deleteSync();
  } catch (_) {}

  print('Compiling Dart extension...');
  final proc = await Process.start(
    Platform.resolvedExecutable,
    [
      "compile",
      "js",
      "lib/extension.dart",
      "-o",
      "out/extension.js",
    ],
  );

  await Future.wait([
    stdout.addStream(proc.stdout),
    stderr.addStream(proc.stderr),
    proc.exitCode,
  ]);

  print('Inserting preamble...');
  final preambleContents = preambleFile
      .readAsStringSync()
      // https://github.com/dart-lang/sdk/issues/55684
      .replaceAll(
        r'var re = /^ *at (?:[^(]*\()?(.*):[0-9]*:[0-9]*\)?$/mg',
        r'var re = /^\s*at (?:[^(]*\()?(.*):[0-9]*:[0-9]*\)?$/mg',
      );
  final extensionContents = compiledExtensionFile.readAsStringSync();

  // compiledExtensionFile.writeAsStringSync(preambleContents + extensionContents);

  print('Done!');
}
