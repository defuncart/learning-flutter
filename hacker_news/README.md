# hacker_news

A simple *Hacker News* client built in Flutter using MobX for state management.

![](_screenshots/01.gif)

The goal of this project were to utilize MobX as a state management solution.

## Overview

- The *HomePage* consists of three tabs, each rendering the first page feed of *latest*, *top* and *job* items.
- *FeedList* observes *HackerNewsStore* and renders a list of *FeedItemTile*s once the store loads the relevant feed. These items are cached once loaded, pull-to-refresh can be used to update these items.
- Clicking on an item in the list will open up the relevant article in the browser.

## Remarks

- The store part can be generated using 
```dart
flutter packages pub run build_runner build
```
- Instead of manually generated this file anytime the store is updated, we can automatically generated if need using 
```dart
flutter packages pub run build_runner watch
```
- Sometimes there may be conflicts between an updated store and the previous build part file, thus I generally supply the delete parameter also: 
```dart
flutter packages pub run build_runner watch --delete-conflicting-outputs
```
- MobX seems like a solid state management solution with minimal boiler plate code. Is it the best way to separate business logic and UI for small projects? Hard to say. In a future project I will investigate MVVM using *Provider* and *ChangeNotifier*.

## Resources

[MobX - Getting Started](https://mobx.pub/getting-started)

[mobx.dart](https://github.com/mobxjs/mobx.dart)