import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flipflow_app/features/centers/presentation/widgets/center_details/gymnastic_type_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymnasticsTypeListView extends StatelessWidget {
  const GymnasticsTypeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GymnasticsTypeItemWidget(
                entity: cubit.currentCenterEntity!.gymnasticTypes![index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: AppSize.s14,
              );
            },
            itemCount: cubit.currentCenterEntity?.gymnasticTypes?.length ?? 0);
      },
    );
  }
}
