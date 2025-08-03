import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'drug_model.g.dart';

@HiveType(typeId: 0)
class DrugModel extends Equatable {
  @HiveField(0)
  final String? setId;
  @HiveField(1)
  final int? splVersion;
  @HiveField(2)
  final String? publishedDate;
  @HiveField(3)
  final String? title;

  const DrugModel({
    this.setId,
    this.splVersion,
    this.publishedDate,
    this.title,
  });

  factory DrugModel.fromJson(Map<String, dynamic> json) {
    return DrugModel(
      setId: json['setid'] as String?,
      splVersion: json['spl_version'] as int?,
      publishedDate: json['published_date'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setid': setId,
      'spl_version': splVersion,
      'published_date': publishedDate,
      'title': title,
    };
  }

  @override
  List<Object?> get props => [setId, splVersion, publishedDate, title];
}
