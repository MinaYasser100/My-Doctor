class DrugDetailsModel {
  String? setid;
  String? title;
  String? publishedDate;
  String? description;
  String? indicationsAndUsage;
  String? dosageAndAdministration;
  String? manufacturer;
  String? warnings;
  String? contraindications;
  String? adverseReactions;

  DrugDetailsModel({
    this.setid,
    this.title,
    this.publishedDate,
    this.description,
    this.indicationsAndUsage,
    this.dosageAndAdministration,
    this.manufacturer,
    this.warnings,
    this.contraindications,
    this.adverseReactions,
  });

  factory DrugDetailsModel.fromJson(Map<String, dynamic> json) {
    return DrugDetailsModel(
      setid: json['setid'] as String?,
      title: json['title'] as String?,
      publishedDate: json['published_date'] as String?,
      description: json['description'] as String?,
      indicationsAndUsage: json['indications_and_usage'] as String?,
      dosageAndAdministration: json['dosage_and_administration'] as String?,
      manufacturer: json['manufacturer'] as String?,
      warnings: json['warnings'] as String?,
      contraindications: json['contraindications'] as String?,
      adverseReactions: json['adverse_reactions'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'setid': setid,
    'title': title,
    'published_date': publishedDate,
    'description': description,
    'indications_and_usage': indicationsAndUsage,
    'dosage_and_administration': dosageAndAdministration,
    'manufacturer': manufacturer,
    'warnings': warnings,
    'contraindications': contraindications,
    'adverse_reactions': adverseReactions,
  };
}

final drugDetails = DrugDetailsModel.fromJson({
  "setid": "3d4c51e2-b09b-9fd0-e063-6294a90ae699",
  "title": "ANTIBACTERIAL WASHING LIQUID- benzalkonium chloride soap",
  "published_date": "2025-01-12",
  "description":
      "Antibacterial washing liquid containing benzalkonium chloride for topical use.",
  "indications_and_usage": "For cleansing and reducing bacteria on the skin.",
  "dosage_and_administration":
      "Apply to wet skin, lather, and rinse thoroughly.",
  "manufacturer": "Manufacturer Name",
  "warnings": "For external use only. Avoid contact with eyes.",
  "contraindications": "Do not use if allergic to benzalkonium chloride.",
  "adverse_reactions": "May cause skin irritation in sensitive individuals.",
});
