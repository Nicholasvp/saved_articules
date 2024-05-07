import 'package:saved_articules/src/data/mock/my_mock.dart';

class HomeRepository {
  Future<List<Map<String, dynamic>>> fetchArticules() async {
    await Future.delayed(const Duration(seconds: 2));
    return MyMock.articulesMock;
  }

  Future<Map<String, dynamic>> fetchTags() async {
    await Future.delayed(const Duration(seconds: 2));
    return MyMock.tagsMock;
  }
}
