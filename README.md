A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

Added packages:
```bash
dart pub add 
dart pub add drift sqlite3_flutter_libs path_provider path dev:drift_dev dev:build_runner
dart pub add sqflite / remove

```
### Analyze:
```bash
 dart analyze
 ```

### Format:

```bash
# Format all in current
 dart format .

# Format multiple
 dart format lib bin/updater.dart 
```