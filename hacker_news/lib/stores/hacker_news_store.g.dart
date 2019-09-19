// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HackerNewsStore on _HackerNewsStore, Store {
  final _$_latestItemsFutureAtom =
      Atom(name: '_HackerNewsStore._latestItemsFuture');

  @override
  ObservableFuture<List<FeedItem>> get _latestItemsFuture {
    _$_latestItemsFutureAtom.context
        .enforceReadPolicy(_$_latestItemsFutureAtom);
    _$_latestItemsFutureAtom.reportObserved();
    return super._latestItemsFuture;
  }

  @override
  set _latestItemsFuture(ObservableFuture<List<FeedItem>> value) {
    _$_latestItemsFutureAtom.context.conditionallyRunInAction(() {
      super._latestItemsFuture = value;
      _$_latestItemsFutureAtom.reportChanged();
    }, _$_latestItemsFutureAtom, name: '${_$_latestItemsFutureAtom.name}_set');
  }

  final _$_topItemsFutureAtom = Atom(name: '_HackerNewsStore._topItemsFuture');

  @override
  ObservableFuture<List<FeedItem>> get _topItemsFuture {
    _$_topItemsFutureAtom.context.enforceReadPolicy(_$_topItemsFutureAtom);
    _$_topItemsFutureAtom.reportObserved();
    return super._topItemsFuture;
  }

  @override
  set _topItemsFuture(ObservableFuture<List<FeedItem>> value) {
    _$_topItemsFutureAtom.context.conditionallyRunInAction(() {
      super._topItemsFuture = value;
      _$_topItemsFutureAtom.reportChanged();
    }, _$_topItemsFutureAtom, name: '${_$_topItemsFutureAtom.name}_set');
  }

  final _$_jobItemsFutureAtom = Atom(name: '_HackerNewsStore._jobItemsFuture');

  @override
  ObservableFuture<List<FeedItem>> get _jobItemsFuture {
    _$_jobItemsFutureAtom.context.enforceReadPolicy(_$_jobItemsFutureAtom);
    _$_jobItemsFutureAtom.reportObserved();
    return super._jobItemsFuture;
  }

  @override
  set _jobItemsFuture(ObservableFuture<List<FeedItem>> value) {
    _$_jobItemsFutureAtom.context.conditionallyRunInAction(() {
      super._jobItemsFuture = value;
      _$_jobItemsFutureAtom.reportChanged();
    }, _$_jobItemsFutureAtom, name: '${_$_jobItemsFutureAtom.name}_set');
  }

  final _$fetchAsyncAction = AsyncAction('fetch');

  @override
  Future fetch(FeedType type, {bool refresh = false}) {
    return _$fetchAsyncAction.run(() => super.fetch(type, refresh: refresh));
  }
}
