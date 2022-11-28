import 'package:vexana/vexana.dart';

class TVModel extends INetworkModel<TVModel> {
  final double? score;
  final Show? show;

  TVModel({
    this.score,
    this.show,
  });

  @override
  TVModel fromJson(Map<String, dynamic> json) => TVModel.fromJson(json);

  factory TVModel.fromJson(Map<String, dynamic> json) {
    return TVModel(
      score: json['score'] as double?,
      show: json['show'] == null ? null : Show.fromJson(json['show'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {
      'score': score,
      'show': show,
    };
  }

  TVModel copyWith({
    double? score,
    Show? show,
  }) {
    return TVModel(
      score: score ?? this.score,
      show: show ?? this.show,
    );
  }

  @override
  bool operator ==(covariant TVModel other) {
    if (identical(this, other)) return true;

    return other.score == score && other.show == show;
  }

  @override
  int get hashCode => score.hashCode ^ show.hashCode;
}

class Show extends INetworkModel<Show> {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final String? status;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.status,
  });

  @override
  Show fromJson(Map<String, dynamic> json) => Show.fromJson(json);

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      status: json['status'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'type': type,
      'language': language,
      'status': status,
    };
  }

  Show copyWith({
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    String? status,
  }) {
    return Show(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      type: type ?? this.type,
      language: language ?? this.language,
      status: status ?? this.status,
    );
  }
}
