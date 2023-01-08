import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_case/generic_log/core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  const GenericHomeDetailView({super.key, required this.id});
  final String id;

  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with LoggerMixin {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.id)),
    );
  }

  @override
  PageSpecialKeys get key => PageSpecialKeys.detail;

  @override
  CustomModel get model => CustomModel(
        id: widget.id,
        description: 'This is a detail page',
      );
}
