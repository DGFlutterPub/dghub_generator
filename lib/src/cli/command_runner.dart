import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_completion/cli_completion.dart';
import 'package:dghub_generator/src/bundles/init/init_bundle.dart';
import 'package:dghub_generator/src/bundles/main/main_bundle.dart';
import 'package:dghub_generator/src/cli/commands/update_command.dart';
import 'package:dghub_generator/src/cli/version.dart';
import 'package:mason/mason.dart' hide packageVersion;
import 'package:path/path.dart' as p;
import 'package:pub_updater/pub_updater.dart';

const executableName = 'dg';
const packageName = 'dghub_generator';
const description = 'DGHub Studio. www.dghub.dev';
//Created by DGHub Studio

/// {@template dghub_generator_command_runner}
/// A [CommandRunner] for the CLI.
///
/// ```
/// $ dg --version
/// ```
/// {@endtemplate}
class DGHubCliCommandRunner extends CompletionCommandRunner<int> {
  /// {@macro dghub_generator_command_runner}
  DGHubCliCommandRunner({
    Logger? logger,
    PubUpdater? pubUpdater,
  })  : _logger = logger ?? Logger(),
        _pubUpdater = pubUpdater ?? PubUpdater(),
        super(executableName, description) {
    // Add root options and flags
    argParser
      ..addFlag(
        'version',
        abbr: 'v',
        negatable: false,
        help: 'Print the current version.',
      )
      ..addSeparator('Generator')
      ..addFlag(
        'init',
        abbr: 'i',
        negatable: false,
        help: 'Init project.',
      )
      ..addOption(
        'create',
        abbr: 'c',
        help: 'Create main file.',
      )
      ..addOption(
        'gen',
        abbr: 'g',
        help: 'Generate from main file.',
      );

    // Add sub commands
    addCommand(UpdateCommand(logger: _logger, pubUpdater: _pubUpdater));
  }

  @override
  void printUsage() => _logger.info(usage);

  final Logger _logger;
  final PubUpdater _pubUpdater;

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final topLevelResults = parse(args);
      return await runCommand(topLevelResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      // On format errors, show the commands error message, root usage and
      // exit with an error code
      _logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      // On usage errors, show the commands usage message and
      // exit with an error code
      _logger
        ..err(e.message)
        ..info('')
        ..info(e.usage);
      return ExitCode.usage.code;
    }
  }

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    // Fast track completion command
    if (topLevelResults.command?.name == 'completion') {
      await super.runCommand(topLevelResults);
      return ExitCode.success.code;
    }

    // Verbose logs
    _logger
      ..detail('Argument information:')
      ..detail('  Top level options:');
    for (final option in topLevelResults.options) {
      if (topLevelResults.wasParsed(option)) {
        _logger.detail('  - $option: ${topLevelResults[option]}');
      }
    }
    if (topLevelResults.command != null) {
      final commandResult = topLevelResults.command!;
      _logger
        ..detail('  Command: ${commandResult.name}')
        ..detail('    Command options:');
      for (final option in commandResult.options) {
        if (commandResult.wasParsed(option)) {
          _logger.detail('    - $option: ${commandResult[option]}');
        }
      }
    }

    // Run the command or show version
    final int? exitCode;
    if (topLevelResults['version'] == true) {
      _logger.info(packageVersion);
      exitCode = ExitCode.success.code;
    } else if (topLevelResults.wasParsed('init')) {
      exitCode = (await _init(topLevelResults)).code;
    } else if (topLevelResults.wasParsed('create')) {
      await _createMainFile(topLevelResults);
      exitCode = ExitCode.success.code;
    } else if (topLevelResults.wasParsed('gen')) {
      exitCode = (await _genFile(topLevelResults)).code;
    } else {
      exitCode = await super.runCommand(topLevelResults);
    }

    // Check for updates
    if (topLevelResults.command?.name != UpdateCommand.commandName) {
      await _checkForUpdates();
    }

    return exitCode;
  }

  /// Checks if the current version (set by the build runner on the
  /// version.dart file) is the most recent one. If not, show a prompt to the
  /// user.
  Future<void> _checkForUpdates() async {
    try {
      final latestVersion = await _pubUpdater.getLatestVersion(packageName);
      final isUpToDate = packageVersion == latestVersion;
      if (!isUpToDate) {
        _logger
          ..info('')
          ..info(
            '''
${lightYellow.wrap('Update available!')} ${lightCyan.wrap(packageVersion)} \u2192 ${lightCyan.wrap(latestVersion)}
Run ${lightCyan.wrap('$executableName update')} to update''',
          );
      }
    } catch (_) {}
  }

  Future<void> _createMainFile(ArgResults topLevelResults) async {
    final name = topLevelResults.option('create');

    final generator = await MasonGenerator.fromBundle(mainBundle);
    final target = DirectoryGeneratorTarget(Directory.current);

    final progress = _logger.progress('Generate ${name}_generator.dart');

    await generator.generate(target, vars: {'name': name});

    progress.update('Dart format');
    await Process.run('dart', ['format', '.']);
    progress.complete('Created lib/gen/$name/${name}_generator.dart');
  }

  Future<ExitCode> _genFile(ArgResults topLevelResults) async {
    final name = topLevelResults.option('gen')!.snakeCase;

    final path = p.join(
      Directory.current.path,
      'lib',
      'gen',
      name,
      '${name}_generator.dart',
    );
    final file = File(path);

    final isExists = file.existsSync();

    if (!isExists) return ExitCode.cantCreate;

    final str = await file.readAsString();

    final haveAnnotation = str.contains('@DGHubGenerator(');

    if (!haveAnnotation) return ExitCode.usage;

    final annotation = str
        .split('@DGHubGenerator(')[1]
        .split('class ${name.pascalCase}Generator')[0]
        .trim();

    final haveModels = annotation.contains('models:');

    print('models: $haveModels');

    return ExitCode.success;
  }

  Future<ExitCode> _init(ArgResults topLevelResults) async {
    final path = p.join(Directory.current.path, 'pubspec.yaml');
    final file = File(path);

    var read = await file.readAsString();

    read = read.replaceFirst('dependencies:', '''
dependencies:
  #DGHub Generator 
  flutter_riverpod: ^2.5.1
  auto_route: ^9.2.2
  dghub_generator:
    path: ../
  path_provider: ^2.1.3
  path: ^1.9.0
  dio: ^5.4.3+1
  dio_cache_interceptor: ^3.5.0
  socket_io_client: ^2.0.3+1
  json_annotation: ^4.9.0
  #DGHub Generator 
''');

    read = read.replaceFirst('dev_dependencies:', '''
dev_dependencies:\
  #DGHub Generator
  build_runner: ^2.4.9
  auto_route_generator: ^9.0.0
  json_serializable: ^6.8.0
  #DGHub Generator
''');

    await file.writeAsString(read);

    final generator = await MasonGenerator.fromBundle(initBundle);
    final target = DirectoryGeneratorTarget(Directory.current);

    final progress = _logger.progress('Project Initializing');
    await generator.generate(target);

    progress.update('Dart format');
    await Process.run('dart', ['format', '.']);
    progress.complete('Project Initializing Success');

    return ExitCode.success;
  }
}
