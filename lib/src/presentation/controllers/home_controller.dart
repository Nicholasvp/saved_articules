import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saved_articules/src/data/repositories/home_repository.dart';
import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/domain/models/tag_model.dart';
import 'package:saved_articules/src/presentation/widgets/articule_content.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    fetchPage();
  }
  // REPOSITORY
  final repository = HomeRepository();

  // VARIABLES
  bool isLoading = false;
  List<ArticuleModel> articules = [];
  List<TagModel> tags = [];

  // METHODS

  loading() {
    isLoading = true;
    notifyListeners();
  }

  completed() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPage() async {
    fetchArticules();
    fetchTags();
  }

  Future<void> fetchArticules() async {
    loading();
    var res = await repository.fetchArticules();
    articules = res.map((e) => ArticuleModel.fromMap(e)).toList();
    completed();
  }

  Future<void> fetchTags() async {
    try {
      loading();
      var res = await repository.fetchTags();
      tags = res['tags']
          .map<TagModel>((e) => TagModel.fromMap(e as Map<String, dynamic>))
          .toList();
      debugPrint(tags.toString());
      completed();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deselectAll() {
    tags = tags.map((e) => e.copyWith(isSelected: false)).toList();
    notifyListeners();
  }

  void onTagSelected(TagModel tag) {
    deselectAll();
    final index = tags.indexOf(tag);
    final tagSelected = tag.copyWith(isSelected: !tag.isSelected);
    if (index > -1) {
      tags[index] = tagSelected;
    }
    filterArticulesbyTags(tagSelected);
    notifyListeners();
  }

  void filterArticulesbyTags(TagModel tag) async {
    if (tag.isSelected) {
      await fetchArticules();
      articules = articules
          .where((element) => element.tags.contains(tag.title))
          .toList();
      debugPrint(articules.toString());
    } else {
      await fetchArticules();
    }
    notifyListeners();
  }

  void openArticule(ArticuleModel articule, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ArticuleContent(articule: articule);
      },
    );
  }

  void onFavoriteSelected(ArticuleModel articule) {
    final index = articules.indexOf(articule);
    final articuleSelected = articule.copyWith(favorite: !articule.favorite);
    if (index > -1) {
      articules[index] = articuleSelected;
    }
    notifyListeners();
  }
}

final homeController = ChangeNotifierProvider((ref) => HomeController());
