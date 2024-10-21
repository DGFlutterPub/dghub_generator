# DGHub Studio

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://raw.githubusercontent.com/dghub-founder/storage/refs/heads/main/icon.png" style="height: 170px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Group

<a href="https://t.me/dghub_dev" target="_blank"><img src="https://raw.githubusercontent.com/dghub-founder/storage/refs/heads/main/telegram_button.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dghub_generator)

## 🚀 Introducing DGHUB Generator — Automate Your Flutter Project’s Backend and Frontend Integration! 🚀

I'm Dimi, 
Let me show you a package that I have developed.
This package connects the front-end to the back-end.

I’m Dimi, Let me show you a package that I have developed.

Are you tired of spending hours setting up MVC or MVVM systems manually in your Flutter projects? Let me introduce you to DGHUB Generator, a package that can do it all for you in just a few steps.

What Does DGHUB Generator Do?

✅ Automatic MVC/MVVM System Generation: Say goodbye to repetitive work! DGHUB Generator automates the creation of complete MVC or MVVM systems for your Flutter apps.

✅ Node.js Model Creation: Your Dart models are automatically converted into Node.js models, eliminating the need to use external servers like Firebase or Supabase. Build and control your own server!

✅ Providers, API Service, Forms & Validators: It takes care of the most common elements of your app, building essential providers, forms, validators, and API services.

✅ Background Services & More: Need a notification service, native splash screen, cron jobs, or Riverpod widgets? DGHUB Generator has you covered!

Why You’ll Love It:

Save Time: Focus on building your app’s core features rather than worrying about setting up back-end infrastructure.

Flexibility: You have full control over your backend system without relying on third-party servers.

All-In-One: From background services to notification handling, it generates everything you need in one go.

🎯 Ready to try it out?

Head over to the documentation and see how easy it is to integrate DGHUB Generator into your project. I promise, once you try it, you won’t go back!

📥 Get it now on pub.dev: DGHUB Generator

If you’re interested in contributing or have any feedback, feel free to reach out. Also, stay tuned — I have exciting plans for future projects and I’m looking for potential investors!

You can share this across Flutter forums, social media, and developer communities! Let me know if you’d like any changes or if you need this translated into other languages.

Developed by DGHub Studio ( Myanmar )

Telegram group: t.me/dghub_dev

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


## Example for model generate.
### After using 'dg -c product' will see the: 
- 'lib/gen/product/product_generator.dart' file.
### Don't forget:
- 'flutter pub run build_runner build --delete-conflicting-outputs',
### Check auto generated files:
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



## Example for apis generate.
### Check auto generated files:
- 'lib/gen/product/apis/' or 'lib/gen/product/providers'
- 'node/gen/product/apis/' or 'node/gen/product/providers'
- 'python/gen/product/apis/' or 'python/gen/product/providers'
```dart
import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(apis: [
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.store,
      authenticated: true,
      roles: ['admin']),
  DGApi(method: DGApiMethod.get, action: DGApiAction.getOne),
  ])
class ProductGenerator {}
```

## Developers
- Min Thant Htet (Dimi Gol) (Founder)
- Thit Lwin 