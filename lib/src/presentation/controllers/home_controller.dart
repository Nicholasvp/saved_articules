import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saved_articules/src/data/repositories/home_repository.dart';
import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/domain/models/tag_model.dart';
import 'package:saved_articules/src/presentation/store/home_store.dart';
import 'package:saved_articules/src/presentation/widgets/articule_content.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    fetchPage();
  }
  // REPOSITORY
  final repository = HomeRepository();
  final store = HomeStore();

  // METHODS

  loading() {
    store.isLoading = true;
    notifyListeners();
  }

  completed() {
    store.isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPage() async {
    fetchArticules();
    fetchTags();
  }

  Future<void> fetchArticules() async {
    loading();
    var res = await repository.fetchArticules();
    store.articules = res.map((e) => ArticuleModel.fromMap(e)).toList();
    completed();
  }

  Future<void> fetchTags() async {
    try {
      loading();
      var res = await repository.fetchTags();
      store.tags = res['tags']
          .map<TagModel>((e) => TagModel.fromMap(e as Map<String, dynamic>))
          .toList();
      debugPrint(store.tags.toString());
      completed();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deselectAll() {
    store.tags = store.tags.map((e) => e.copyWith(isSelected: false)).toList();
    notifyListeners();
  }

  void onTagSelected(TagModel tag) {
    deselectAll();
    final index = store.tags.indexOf(tag);
    final tagSelected = tag.copyWith(isSelected: !tag.isSelected);
    if (index > -1) {
      store.tags[index] = tagSelected;
    }
    filterArticulesbyTags(tagSelected);
    notifyListeners();
  }

  void filterArticulesbyTags(TagModel tag) async {
    if (tag.isSelected) {
      await fetchArticules();
      store.articules = store.articules
          .where((element) => element.tags.contains(tag.title))
          .toList();
      debugPrint(store.articules.toString());
    } else {
      await fetchArticules();
    }
    notifyListeners();
  }

  void openArticule(ArticuleModel articule, BuildContext context) {
    store.articuleSelected = articule;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return const ArticuleContent();
      },
    );
  }

  void onFavoriteSelected(ArticuleModel articule) {
    articule.favorite = !articule.favorite;
    notifyListeners();
  }

  ArticuleModel getArticule(ArticuleModel articule) {
    final index = store.articules.indexOf(articule);
    return store.articules[index];
  }
}

final homeController = ChangeNotifierProvider((ref) => HomeController());
