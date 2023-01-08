import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_case/network_change/network_change_manager.dart';
import 'package:kartal/kartal.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _networkChange.dispose();
  }

  void fetchFirstResult() {
    waitForScreen(() async {
      final NetworkResult result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: context.durationLow,
      crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(height: context.dynamicHeight(0.1), color: context.colorScheme.onSurface),
      secondChild: const SizedBox.shrink(),
    );
  }
}

mixin StateMixin on State<NoNetworkWidget> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
