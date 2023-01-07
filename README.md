# Yummify

[![Actions Status](https://github.com/excogitatr/rick-and-morty-info/workflows/deploy/badge.svg?branch=v1.1.0)](https://github.com/excogitatr/rick-and-morty-info/actions?query=workflow%3Adeploy)
[![Actions Status](https://github.com/excogitatr/rick-and-morty-info/workflows/build/badge.svg)](https://github.com/excogitatr/rick-and-morty-info/actions?query=workflow%3Abuild)
[![codecov](https://codecov.io/gh/excogitatr/rick-and-morty-info/branch/master/graph/badge.svg)](https://codecov.io/gh/excogitatr/rick-and-morty-info)
[![Flutter version](https://img.shields.io/badge/flutter-v2.0.1-blue?logo=flutter)](https://flutter.dev/docs/development/tools/sdk/releases)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

Yummify is a restaurant menu app developed using MVVM clean architecture.

## Screenshots

## Installation

- Check if you are in the beta channel of flutter SDK and the version v2.0.1 or higher. [Instruction to change flutter channel](https://github.com/flutter/flutter/wiki/Flutter-build-release-channels#how-to-change-channels).
- Clone the repo
  ```sh
  git clone https://github.com/excogitatr/rick-and-morty-info.git
  ```
- And then we can use the normal build and run procedure
  ```sh
  flutter pub get
  flutter run
  ```
- Some files like `*.freezed.dart`, `*.g.dart`, `*.iconfig.dart` are auto generated. If there is any issue from these files just run this command to regenerate them.
  ```sh
  flutter pub run build_runner watch --delete-conflicting-outputs
  ```
  
## Credit 🙏

Thanks to all the people who created and are maintaining these awesome packages used in this project.

Maintainers                                      | Packages
-------------------------------------------------|-------------------------------------------
[Felix Angelov](https://github.com/felangel)     | [bloc & flutter_bloc][bloc_link], [equatable][equatable_link], [mocktail][mocktail_link]
[Thomas Burkhart](https://github.com/escamoteur) | [get_it][get_it_link]
[Milad akarie](https://github.com/Milad-Akarie)  | [injectable][injectable_link]
[Chris Sells](https://github.com/csells)         | [go_router][go_router_link]
[Very Good Ventures][vgv_link]                   | For their awesome README [template][very_good_cli_link]
And everyone else                                | [dio][dio_link], [hive][hive_link], and many more...

## Features and bugs

You can file features requests (not intending to add new features, but I will try to add based on requests), bugs or any
questions at the [issue tracker][issue_tracker_link]. 

And don't forget to give a star if you find this repo helpful, or
you have learned something from it!

### Maintainers

* [Elias Andualem](https://github.com/elias8)

[vgv_link]: https://github.com/VeryGoodOpenSource

[bloc_link]: https://github.com/felangel/bloc

[equatable_link]: https://github.com/felangel/equatable

[mocktail_link]: https://github.com/felangel/mocktail

[get_it_link]: https://github.com/fluttercommunity/get_it

[injectable_link]: https://github.com/Milad-Akarie/injectable

[go_router_link]: https://github.com/csells/go_router

[very_good_cli_link]: https://github.com/verygoodopensource/very_good_cli

[dio_link]: https://github.com/flutterchina/dio

[hive_link]: https://github.com/hivedb/hive
