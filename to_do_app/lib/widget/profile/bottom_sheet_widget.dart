import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screen/profile/bloc/profile_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return Container(
      color: AppColors.darkGrey,
      width: MediaQuery.of(context).size.width,
      height: 255,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Change account Image",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ).tr(),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {
                bloc.add(UploadImgfromGallery());
              },
              child:
                  Text(
                    "Import from gallery",
                    style: AppTextStyles.subText,
                  ).tr(),
            ),
          ),
        ],
      ),
    );
  }
}
