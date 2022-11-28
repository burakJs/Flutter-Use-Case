import 'package:flutter_use_case/use_case/cancelable_auto_complete/model/tv_model.dart';
import 'package:vexana/vexana.dart';

abstract class ITVService {
  ITVService(INetworkManager networkManager) : _manager = networkManager;

  Future<List<TVModel>?> fetchItems(String key);

  final INetworkManager _manager;
}

class TVService extends ITVService {
  TVService(super.networkManager);

  @override
  Future<List<TVModel>?> fetchItems(String key) async {
    final IResponseModel response = await _manager.send<TVModel, List<TVModel>>(
      _TVServicePath.search.path,
      parseModel: TVModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([
        _TVServiceQuery.q.value(key),
      ]),
    );

    return response.data;
  }
}

enum _TVServicePath {
  search('search/shows');

  final String path;

  const _TVServicePath(this.path);
}

enum _TVServiceQuery {
  q;

  MapEntry<String, String> value(String key) {
    return MapEntry(name, key);
  }
}
//https://api.tvmaze.com/search/shows?q=k