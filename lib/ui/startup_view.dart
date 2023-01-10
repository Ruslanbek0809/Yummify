import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../widgets/widgets.dart';
import 'startup_animated_text_hook.dart';
import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      // Fires once when the ViewModel is created or set for the first time
      onModelReady: (model) => WidgetsBinding.instance
          .addPostFrameCallback((_) => model.runStartupLogic()),

      /// A builder function that returns the ViewModel for this widget
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) {
        /// CALLED when user has INTERNET CONNECTION
        if (model.startAnimation == false) {
          model.navToHomeWithConnection(context.locale);
        }

        return Scaffold(
          body: Center(
            child: StartUpAnimatedTextHook(
              delay: 500,
              child: YummifyImage(
                image: 'assets/logo.png',
                width: 0.4.sw,
              ), // YummifyImage is a custom image widget
            ),
          ),
        );
      },
    );
  }
}
