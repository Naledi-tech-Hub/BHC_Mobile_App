import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/loading_indicator.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:bhc_mobile_app/util/enums.dart' show BaseBlocStates;
import 'package:bhc_mobile_app/util/validators.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.labelTextKey,
    this.initialValue,
    this.decoration,
    this.onEditingComplete,
    this.controller,
    this.enabled,
    this.validator,
    this.style,
    this.keyboardType,
    this.readOnly = false,
    this.textFormatters,
    this.scrollPadding,
    this.textAlign,
    this.autoValidateMode,
    this.textInputAction,
    this.obscureText = false,
    this.autofocus = false,
    this.focusNode,
    this.maxLines = 1,
  });

  final ValueSetter<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final String? labelTextKey, initialValue;

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool? enabled;
  final bool readOnly, obscureText, autofocus;
  final int? maxLines;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? textFormatters;
  final AutovalidateMode? autoValidateMode;
  final EdgeInsets? scrollPadding;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autofocus: autofocus,
      maxLines: maxLines,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      scrollPadding: scrollPadding ?? const EdgeInsets.all(20),
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      onEditingComplete: onEditingComplete,
      initialValue: initialValue,
      style: style ?? AppTextStyles.s16w400,
      autovalidateMode: autoValidateMode,
      validator: validator,
      cursorHeight: Sizes.p24,
      cursorWidth: Sizes.p1_5,
      cursorRadius: const Radius.circular(999),
      textInputAction: textInputAction,
      contextMenuBuilder: _buildContextMenu,
      keyboardType: keyboardType,
      inputFormatters: textFormatters,
      decoration: decoration ?? InputDecoration(labelText: labelTextKey?.tr()),
    );
  }
}

Widget _buildContextMenu(
  BuildContext context,
  EditableTextState editableTextState,
) {
  return AdaptiveTextSelectionToolbar.buttonItems(
    anchors: editableTextState.contextMenuAnchors,
    buttonItems: <ContextMenuButtonItem>[
      if (editableTextState.cutEnabled)
        ContextMenuButtonItem(
          onPressed: () =>
              editableTextState.cutSelection(SelectionChangedCause.toolbar),
          type: ContextMenuButtonType.cut,
        ),
      if (editableTextState.copyEnabled)
        ContextMenuButtonItem(
          onPressed: () =>
              editableTextState.copySelection(SelectionChangedCause.toolbar),
          type: ContextMenuButtonType.copy,
        ),
      if (editableTextState.selectAllEnabled)
        ContextMenuButtonItem(
          onPressed: () =>
              editableTextState.selectAll(SelectionChangedCause.toolbar),
          type: ContextMenuButtonType.selectAll,
        ),
      if (editableTextState.pasteEnabled)
        ContextMenuButtonItem(
          onPressed: () =>
              editableTextState.pasteText(SelectionChangedCause.toolbar),
          type: ContextMenuButtonType.paste,
        ),
    ],
  );
}

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final controller = TextEditingController();
  late final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   if (!focusNode.hasFocus) focusNode.requestFocus();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            //onChanged: context.read<AnalysePageCubit>().searchWithDebounce,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: Sizes.p8),
              hintText: 'analyse.searchHint'.tr(),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary5),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary6),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary5),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary4),
              ),
            ),
          ),
        ),
        gapW16,
        // BlocBuilder<AnalysePageCubit, AnalysePageState>(
        //   builder: (context, state) {
        //     bool isLoading = state.when(BaseBlocStates.loading);
        //     return WidgetButton(
        //       onPressed: state.searchString.isNotEmpty
        //           ? () {
        //               FocusManager.instance.primaryFocus?.unfocus();
        //               controller.clear();
        //               context.read<AnalysePageCubit>().clearResults();
        //             }
        //           : () {},
        //       child: isLoading
        //           ? const LoadingIndicator(androidScaleFactor: 0.4)
        //           : state.searchString.isEmpty
        //               ? SvgPicture.asset(IconAssetsPaths.search)
        //               : const Icon(
        //                   Icons.close,
        //                   color: AppColors.black,
        //                   size: Sizes.p26,
        //                 ),
        //     );
        //   },
        // )
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.enabled,
  });

  final ValueSetter<String> onChanged;
  final String? initialValue;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: onChanged,
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validators.emailValidator,
      enabled: enabled,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      labelTextKey: 'createAccount.email',
    );
  }
}
