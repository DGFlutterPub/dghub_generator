# DGHub Studio

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://raw.githubusercontent.com/dghub-founder/storage/refs/heads/main/icon.png" style="height: 170px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Group

<a href="https://t.me/dghub_dev" target="_blank"><img src="https://raw.githubusercontent.com/dghub-founder/storage/refs/heads/main/telegram_button.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dghub_generator)

## What is

I'm Dimi, 
Let me show you a package that I have developed.
This package connects the front-end to the back-end.

Let me explain.
After we make a project in Flutter, we usually use MVC or MVVM systems.
This package can generate these automatically.
You no longer need to use dependent servers like Firebase or Supabase.  You can build your own server easily.

For example - a model written in Dart is automatically built for Node.js.  Not only that, it also builds Providers, API Service, Forms, Validator, Queries.

This package can generate the MVVM system as well as generate the things needed in the project at once.  For example - Background service, River pod wrap widget, Native splash, Notification service, Cron service and anything.

To try it out now, see how to use it in the document and give it a try.  You will like it very much.

So let me tell you.  I have plans for the next project. You can come to me to start investing.

- Telegram account:
t.me/dghub_founder

- Telegram group: 
t.me/dghub_dev

# Developed by DGHub Studio ( Myanmar Development )

- I like my country.
- I will fix anything.

- New dictionary word =>  Full Stacker
- Backend auto generator
- Ai Full stack auto generator
- DGHub Generator

# Please try for new project, Do not try in existing project.

## Installation package

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dghub_generator: <latest_version>
```

## Activate Cli
Activate it easily from Terminal
```
dart pub global activate dghub_generator
```

## Init
Initial generate
```
dg -i
```

##  Create
You can write anything in the 'product' field.
```
dg -c product
```

## Help
```
dg -h
```

##  Generate
Run this every time you build with 'dg -c'
```
flutter pub run build_runner build --delete-conflicting-outputs
```

## Import package
```dart
import 'package:dghub_generator/dghub_generator.dart';
```


## Example for model create.
### After using 'dg -c product' will see the: 
- 'lib/gen/product/product_generator.dart' file.
### Don't forget:
- 'flutter pub run build_runner build --delete-conflicting-outputs',
### Check generated files:
- 'lib/gen/product/models/'
- 'node/gen/product/models/'
- 'python/gen/product/models/'
```dart
import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(models: [
  DGModel(
    validate: DGValidate(isString: true), 
    key: 'title'
  ),
  DGModel(
    validate: DGValidate(isDouble: true), 
    key: 'price'
  ),
  DGModel(
    validate: DGValidate(isFile: true), 
    key: 'photo'
    ),
  DGModel(
    validate: DGValidate(isBoolean: true), 
    key: "enabled"
    )
])
class ProductGenerator {}
```

## Developers
- Min Thant Htet (Dimi Gol) (Founder)
- Thit Lwin 