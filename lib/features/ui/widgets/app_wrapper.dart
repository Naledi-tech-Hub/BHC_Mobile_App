// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bhc_mobile_app/di/injector.dart';
// import 'package:bhc_mobile_app/features/ui/common_blocs/connection_cubit/connection_cubit.dart';
// import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
// import 'package:bhc_mobile_app/util/alert_utils.dart';
// import 'package:easy_localization/easy_localization.dart'
//     show StringTranslateExtension;
//
// /// App wrapper contains logics and blocs needed in the entire app
//
// class AppWrapper extends StatelessWidget {
//   const AppWrapper({
//     super.key,
//     required this.child,
//     required this.navigator,
//   });
//
//   final Widget child;
//   final GlobalKey<NavigatorState> navigator;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => getIt.get<ConnectionCubit>()),
//         ],
//         child: GestureDetector(
//           onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//           child: BlocListener<ConnectionCubit, UserConnectionState>(
//             listener: (context, state) {
//               if (state is TokenExpiredError) {
//                 navigator.currentState?.pushNamedAndRemoveUntil(
//                   LoginPage.routeName,
//                   (route) => false,
//                 );
//                 AlertUtils.showCustomDialog(
//                   context: navigator.currentContext ?? context,
//                   isDismissible: true,
//                   bodyText: 'alert.expiredToken'.tr(),
//                   buttonTextKey: 'buttons.ok',
//                 );
//               }
//               if (state is InternetConnectionState) {
//                 state.hasConnection
//                     ? ScaffoldMessenger.of(context).hideCurrentSnackBar()
//                     : ScaffoldMessenger.of(context).showSnackBar(
//                         AlertUtils.snackBar(
//                             messageKey: 'alert.noConnection'.tr(),
//                             isError: true,
//                             showLoading: true,
//                             duration: const Duration(days: 3)),
//                       );
//               }
//             },
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
