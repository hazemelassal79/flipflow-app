import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/coaches/coaches_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachesView extends StatelessWidget {
  const CoachesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return Scaffold(
            appBar: AppBar(
              leading: const CustomBackArrow(),
              title: Text(
                cubit.currentGymnasticType!.name,
                style: StylesManager.bold20,
              ),
              centerTitle: true,
            ),
            body: const CustomGradiantContainer(
              child: CoachesViewBody(),
            ));
      },
    );
  }
}
