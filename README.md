# my_portfolio

A new Flutter project.

## Run with web
flutter run -d chrome --web-renderer html

## How to deploy to Github
Generate env by 
    `flutter clean`
    `flutter pub get`
    `flutter pub run build_runner build --delete-conflicting-outputs`

Use peanut
flutter pub global activate peanut
flutter pub global run peanut:peanut
then push to github

## Note
When run at local machine, please use <base href="/"> in web/index.html
When deploy to github page by peanut, please use  <base href="/my_portfolio/"/> in web/index.html

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
