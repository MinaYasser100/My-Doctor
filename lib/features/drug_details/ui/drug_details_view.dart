import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/core/utils/colors.dart';
import 'package:my_doctor/features/drug_details/data/model/medicine_details_model/drug_details_model.dart';

import 'widgets/drug_details_body_view.dart';

class DrugDetailsView extends StatelessWidget {
  final DrugDetailsModel details;

  const DrugDetailsView({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsTheme().primaryColor,
        title: Text(
          details.title ?? 'Drug Details',
          style: TextStyle(
            color: ColorsTheme().whiteColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: DrugDetailsBodyView(details: details),
    );
  }
}
