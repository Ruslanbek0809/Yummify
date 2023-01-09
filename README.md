# <img width="64" src="https://github.com/Ruslanbek0809/Yummify/blob/main/assets/logo.png?raw=true"> Yummify

Yummify is a fully-functional restaurant menu app to demonstrate how we can make a scalable, and maintainable app in an understandable manner using an MVVM inspired architecture in Flutter.

## Screenshots 📷

## App Features:
* Flutter + Firebase (Firestore, Authentication, Storage)
  Test account: haonguyen.uet@gmail.com / 123456
* Use Stacked pattern
* Responsive (Mobil + Tablet)
* User-friendly interface
* Clean Architecture
* Custom resuable widgets
* Login or register by email and password
* Search, filter and sort products
* Send your feedback and rating
* Contact with admin by message
* Payment by 2 methods: Cash or Credit card
* Track your orders
* Select your delivery address
* Change app language
* More...

## Installation

- Clone the repo
  ```sh
  git clone https://github.com/Ruslanbek0809/Yummify.git
  ```
- And then we can use the normal build and run procedure
  ```sh
  flutter pub get
  flutter run
  ```
- Some files like `*.freezed.dart`, `*.g.dart`, `*.iconfig.dart` are auto generated. If there is any issue from these files just run this command to regenerate them.
  ```sh
  flutter pub run build_runner build --delete-conflicting-outputs
  ```
  

## :package: Packages
This repository makes use of the following pub packages:
| Package | Version | Usage |
| ------ | ------ | ------ |
| [dio](https://pub.dev/packages/dio/versions/4.0.6) | ^4.0.6 | API*
| [graphql_flutter](https://pub.dev/packages/graphql_flutter/versions/5.1.0) | ^5.1.0 | API*
| [web_socket_channel](https://pub.dev/packages/web_socket_channel/versions/2.2.0) | ^2.2.0 | API
| [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus/versions/1.0.1) | ^1.0.1 | Network
| [fresh_dio](https://pub.dev/packages/fresh_dio/versions/0.3.2) | ^0.3.2 | Auth*
| [fresh_graphql](https://pub.dev/packages/fresh_graphql/versions/0.5.2) | ^0.5.2 | Auth*
| [keframe](https://pub.dev/packages/keframe/versions/3.0.0) | ^3.0.0 | Performance*
| [flutter_bloc](https://pub.dev/packages/flutter_bloc/versions/8.1.1) | ^8.1.1 | State & Architecture*
| [hydrated_bloc](https://pub.dev/packages/hydrated_bloc/versions/8.1.0) | ^8.1.0 | State Persistance*
| [very_good_analysis](https://pub.dev/packages/very_good_analysis/versions/3.1.0) | ^3.1.0 | Linting*
| [dart_code_metrics](https://pub.dev/packages/dart_code_metrics/versions/4.19.1) | ^4.19.1 | Linting*
| [reactive_forms](https://pub.dev/packages/reactive_forms/versions/14.1.0) | ^14.1.0 | Forms*
| [injectable](https://pub.dev/packages/injectable/versions/1.5.4) | ^1.5.4 | Dependency Injection*
| [get_it](https://pub.dev/packages/get_it/versions/7.2.0) | ^7.2.0 | Service Locator*
| [freezed](https://pub.dev/packages/freezed/versions/2.2.0) | ^2.2.0 | Code Generation for Classes*
| [artemis](https://pub.dev/packages/artemis/versions/7.9.0-beta) | ^7.9.0-beta | Code Generation for GraphQL*
| [build_runner](https://pub.dev/packages/build_runner/versions/2.3.0) | ^2.3.0 | Code Generation for Others*
| [json_serializable](https://pub.dev/packages/json_serializable/versions/6.5.4) | ^6.5.4 | Code Generation for JSON*
| [slang_flutter](https://pub.dev/packages/slang_flutter/versions/3.3.0) | ^3.3.0 | Code Generation for Languages*
| [slang_build_runner](https://pub.dev/packages/slang_build_runner/versions/3.3.0) | ^3.3.0 | Code Generation for Languages*
| [r_resources](https://pub.dev/packages/r_resources/versions/1.0.1) | ^1.0.1 | Code Generation for Assets*
| [auto_route](https://pub.dev/packages/auto_route/versions/5.0.2) | ^5.0.2 | Routing*
| [data_channel](https://pub.dev/packages/data_channel/versions/2.0.0+1) | ^2.0.0+1 | Exceptions*
| [hive_flutter](https://pub.dev/packages/hive_flutter/versions/1.1.0) | ^1.1.0 | Storage*
| [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage/versions/6.0.0) | ^6.0.0 | Storage*
| [slang](https://pub.dev/packages/slang/versions/3.3.1) | ^3.3.1 | Localization*
| [permission_handler](https://pub.dev/packages/permission_handler/versions/10.2.0) | ^10.2.0 | Permission
| [logger](https://pub.dev/packages/logger/versions/1.1.0) | ^1.1.0 | Logging*
| [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger/versions/1.2.0-beta-1) | ^1.2.0-beta-1 | Logging*
| [sentry_flutter](https://pub.dev/packages/sentry_flutter/versions/6.13.1) | ^6.13.1 | Tracking*
| [sentry_dart_plugin](https://pub.dev/packages/sentry_dart_plugin/versions/1.0.0-beta.4) | ^1.0.0-beta.4 | Tracking*
| [sentry_dio](https://pub.dev/packages/sentry_dio/versions/6.13.1) | ^6.13.1 | Tracking*
| [statsfl](https://pub.dev/packages/statsfl/versions/2.3.0) | ^2.3.0 | Tracking
| [flutter_displaymode](https://pub.dev/packages/flutter_displaymode/versions/0.4.0) | ^0.4.0 | Refresh Rate
| [animations](https://pub.dev/packages/animations/versions/2.0.7) | ^2.0.7 | Animations
| [golden_toolkit](https://pub.dev/packages/golden_toolkit/versions/0.13.0) | ^0.13.0 | Testing
| [bloc_test](https://pub.dev/packages/bloc_test/versions/9.1.0) | ^9.1.0 | Testing
| [mocktail](https://pub.dev/packages/mocktail/versions/0.3.0) | ^0.3.0 | Testing
| [mocktail_image_network](https://pub.dev/packages/mocktail_image_network/versions/0.3.1) | ^0.3.1 | Testing
| [universal_platform](https://pub.dev/packages/universal_platform/versions/1.0.0+1) | ^1.0.0+1 | Tool*
| [json_theme](https://pub.dev/packages/json_theme/versions/4.0.2+2) | ^4.0.2+2 | Tool*
| [ionicons](https://pub.dev/packages/ionicons/versions/0.2.1) | ^0.2.1 | Icons
| [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view/versions/0.6.2) | ^0.6.2 | Others
| [custom_sliding_segmented_control](https://pub.dev/packages/custom_sliding_segmented_control/versions/1.7.3) | ^1.7.3 | Others
| [url_launcher](https://pub.dev/packages/url_launcher/versions/6.1.6) | ^6.1.6 | Others
| [path_provider](https://pub.dev/packages/path_provider/versions/2.0.11) | ^2.0.11 | Others*
| [intl](https://pub.dev/packages/intl/versions/0.17.0) | ^0.17.0 | Others
| [http](https://pub.dev/packages/http/versions/0.13.5) | ^0.13.5 | Others
| [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination/versions/3.2.0) | ^3.2.0 | Others
| [spring_button](https://pub.dev/packages/spring_button/versions/2.0.0) | ^2.0.0 | Others
| [rounded_loading_button](https://pub.dev/packages/rounded_loading_button/versions/2.1.0) | ^2.1.0 | Others
| [auto_size_text](https://pub.dev/packages/rounded_loading_button/versions/3.0.0) | ^3.0.0 | Others*
| [styled_text](https://pub.dev/packages/styled_text/versions/6.0.0) | ^6.0.0 | Others*
| [shimmer](https://pub.dev/packages/shimmer/versions/2.0.0) | ^2.0.0 | Others
| [url_strategy](https://pub.dev/packages/url_strategy/versions/0.2.0) | ^0.2.0 | Others
| [image_picker](https://pub.dev/packages/image_picker/versions/0.8.6) | ^0.8.6 | Others

> *Recommended to keep regardless of your project.

## Conclusion
I will be happy to answer any questions, please feel free to submit an issue and/or pull request 🙂

If you liked my project, don’t forget to ⭐ star the repo to show your support.

### Maintainers

* [Ruslanbek](https://github.com/Ruslanbek0809)

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
