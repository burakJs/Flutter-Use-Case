import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_case/cancelable_auto_complete/model/durations.dart';
import 'package:flutter_use_case/use_case/cancelable_auto_complete/model/errors.dart';
import 'package:vexana/vexana.dart';

import 'model/tv_model.dart';
import 'service/tv_service.dart';

class AutoCancelableView extends StatefulWidget {
  const AutoCancelableView({super.key});

  @override
  State<AutoCancelableView> createState() => _AutoCancelableViewState();
}

class _AutoCancelableViewState extends State<AutoCancelableView> with ServiceNetworkMixin, _AutoCancel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Autocomplete<TVModel>(
        displayStringForOption: (option) => option.show?.name ?? '',
        optionsBuilder: (TextEditingValue textEditingValue) async {
          return await search(textEditingValue.text, _tvService);
        },
      ),
    );
  }
}

mixin ServiceNetworkMixin on State<AutoCancelableView> {
  late final ITVService _tvService;
  late final INetworkManager _networkManager;
  @override
  void initState() {
    super.initState();
    _networkManager = NetworkManager<TVModel>(
      options: BaseOptions(baseUrl: 'https://api.tvmaze.com/'),
    );
    _tvService = TVService(_networkManager);
  }
}

mixin _AutoCancel on State<AutoCancelableView> {
  CancelableOperation<void>? _cancelableOperation;

  Future<List<TVModel>> search(String key, ITVService service) async {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(Durations.low.value),
      onCancel: () {
        ErrorsMixin.print('Operation is canceled');
      },
    );
    List<TVModel> items = [];

    await _cancelableOperation?.value.then((result) async {
      items = await service.fetchItems(key) ?? [];
    });

    return items;
  }
}
