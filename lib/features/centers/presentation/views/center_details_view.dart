import 'package:flipflow_app/core/widgets/custom_back_arrow.dart';
import 'package:flipflow_app/core/widgets/custom_gradiant_widget.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/center_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterDetailsView extends StatelessWidget {
  const CenterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return Scaffold(
            appBar: cubit.currentCenterEntity == null
                ? AppBar(
                    leading: const CustomBackArrow(),
                  )
                : null,
            body:
                const CustomGradiantContainer(child: CenterDetailsViewBody()));
      },
    );
  }
}
