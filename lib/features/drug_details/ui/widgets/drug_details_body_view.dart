import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/custom_body_background.dart';
import 'package:my_doctor/features/drug_details/data/model/medicine_details_model/drug_details_model.dart';

import 'custom_drug_title_and_desc.dart';
import 'drug_detatils_item_widget.dart';

class DrugDetailsBodyView extends StatelessWidget {
  const DrugDetailsBodyView({super.key, required this.details});

  final DrugDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return CustomBodyBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            // Drug Title and Description Card
            CustomDrugTitleAndDesc(details: details),
            SizedBox(height: 16.h),

            // Indications and Usage
            if (details.indicationsAndUsage != null)
              DrugDetailsItemWidget(
                title: 'Indications & Usage',
                textItem: details.indicationsAndUsage!,
              ),
            SizedBox(height: 16.h),

            // Dosage and Administration
            if (details.dosageAndAdministration != null)
              DrugDetailsItemWidget(
                title: 'Dosage & Administration',
                textItem: details.dosageAndAdministration!,
              ),
            SizedBox(height: 16.h),

            // Warnings
            if (details.warnings != null)
              DrugDetailsItemWidget(
                title: 'Warnings',
                textItem: details.warnings!,
              ),
            SizedBox(height: 16.h),

            // Contraindications
            if (details.contraindications != null)
              DrugDetailsItemWidget(
                title: 'Contraindications',
                textItem: details.contraindications!,
              ),
            SizedBox(height: 16.h),

            // Adverse Reactions
            if (details.adverseReactions != null)
              DrugDetailsItemWidget(
                title: 'Adverse Reactions',
                textItem: details.adverseReactions!,
              ),
          ],
        ),
      ),
    );
  }
}
