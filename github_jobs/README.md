# github_jobs

A simple GitHub Jobs client written in Flutter.

![](_screenshots/01.gif)

The goal of this project were:
- to use Provider v3 (especially `ProxyProvider`) for dependency injection
- to render HTML text as Flutter widgets

Color scheme taken from GitHub Desktop Client.

## Overview

- State management is handled using a global state `AppState` and `Provider`.
- An implementation of `IJobService` is injected into `AppState`.
- `HomeScreen` displays a list of job results using a given description and location.
    - Description and location text fields change focus by listening to `onSubmitted`.
- `JobScreen` displays info about a given job, clicking on urls opens the browser.

## Remarks

- The service locator [*get_it*](https://pub.dev/packages/get_it) has its uses but these service singletons can be accessed by any class throughout the project. I would much prefer constructor injection.
- After investigating [*kiwi*](https://pub.dev/packages/kiwi) and [*inject*](https://github.com/google/inject.dart), I feel that *Provider* is currently the best dependency injection solution, at least in my case for small projects.
- I've never actually used the `didChangeDependencies` callback before, definitely best place to assign `appState` in `HomeScreenState`.
- TextField: `onEditingComplete` is called before `onSubmitted`, however the documentation states that
    > `onSubmitted` can be used to manually move focus to another input widget when a user finishes with the currently focused input widget
- For some reason *url_launcher* does not seem to work with `mailto:test@test.de`.

## Resources

[GitHub Jobs](https://jobs.github.com/)

[Flutter API - EditableText](https://master-api.flutter.dev/flutter/widgets/EditableText-class.html)
