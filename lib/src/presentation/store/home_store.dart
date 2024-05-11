import 'package:saved_articules/src/domain/models/articule_model.dart';
import 'package:saved_articules/src/domain/models/tag_model.dart';

class HomeStore {
  // VARIABLES
  bool isLoading = false;
  List<ArticuleModel> articules = [];
  List<TagModel> tags = [];

  ArticuleModel? articuleSelected;
}
