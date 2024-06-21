import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final _textInputBorderRadius = BorderRadius.circular(Sizes.p12);

ThemeData appTheme(BuildContext context) => ThemeData(
      fontFamily: fontFamily,
      primaryColor: AppColors.blue,
      useMaterial3: true,
      iconTheme: const IconThemeData(color: AppColors.black),
      scaffoldBackgroundColor: AppColors.secondary7,
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: AppColors.blue,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: fontFamily,
          ),
        ),
      ),
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.black,
            displayColor: AppColors.black,
            fontFamily: fontFamily,
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.black,
            displayColor: AppColors.black,
            fontFamily: fontFamily,
          ),
      dividerTheme: const DividerThemeData(color: AppColors.secondary6),
      radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(AppColors.blue),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.blue,
        selectionHandleColor: AppColors.blue,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.p16),
          side: const BorderSide(color: AppColors.secondary5),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        modalBarrierColor: AppColors.secondary6.withOpacity(0.8),
        dragHandleColor: AppColors.secondary4,
        dragHandleSize: const Size(Sizes.p80, Sizes.p6),
      ),
      tabBarTheme: TabBarTheme(
        dividerColor: AppColors.transparent,
        labelStyle: AppTextStyles.s11w600,
        unselectedLabelStyle: AppTextStyles.s11w500,
        overlayColor: WidgetStateProperty.all(AppColors.transparent),
        unselectedLabelColor: AppColors.secondary2,
        labelColor: AppColors.blue,
        labelPadding: EdgeInsets.zero,
        indicatorColor: AppColors.transparent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        titleTextStyle: AppTextStyles.s24w600.apply(color: AppColors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p12,
        ),
        errorStyle: AppTextStyles.s14w400.copyWith(color: AppColors.red_2),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary5),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red_2),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red_2),
        ),
        labelStyle: AppTextStyles.s18w400.copyWith(color: AppColors.grey01),
        floatingLabelStyle:
            AppTextStyles.s12w400.copyWith(color: AppColors.grey01),
        hintStyle: AppTextStyles.s16w400.copyWith(color: AppColors.grey01),
        //  contentPadding: const EdgeInsets.only(bottom: Sizes.p12),
      ),
    );
