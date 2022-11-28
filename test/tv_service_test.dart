import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_use_case/use_case/cancelable_auto_complete/model/tv_model.dart';
import 'package:flutter_use_case/use_case/cancelable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ITVService tvService;
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager<TVModel>(options: BaseOptions(baseUrl: 'https://api.tvmaze.com/'));
    tvService = TVService(networkManager);
  });
  test('Fetch TV Shows', () async {
    List<TVModel>? modelList = await tvService.fetchItems('a');
    expect(modelList, isNotNull);
  });
}
