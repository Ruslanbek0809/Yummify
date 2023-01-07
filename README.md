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
  
## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
