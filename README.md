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

## Documents
https://codeburst.io/save-get-update-delete-queries-on-parse-objects-b124cd4be5af
https://docs.parseplatform.org/js/guide/#queries 

