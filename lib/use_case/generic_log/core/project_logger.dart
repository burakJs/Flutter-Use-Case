import 'dart:developer';

import 'package:flutter_use_case/use_case/generic_log/core/logger_mixin.dart';

class ProjectCustomLog {
  static ProjectCustomLog? _instance;
  static ProjectCustomLog get instance => _instance ??= ProjectCustomLog._init();
  ProjectCustomLog._init();

  void logClassName<T>(T page) {
    log(page.toString());
    // SERVICE
  }

  void logPageName(PageSpecialKeys keys) {
    log(keys.name);
  }

  void logCustomModel(CustomModel model) {
    log(model.toJson());
  }
}
