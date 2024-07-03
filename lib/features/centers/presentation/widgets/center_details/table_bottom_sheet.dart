import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/features/centers/presentation/cubit/center_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableBottomSheetWidget extends StatelessWidget {
  const TableBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CentersCubit, CentersState>(
      builder: (context, state) {
        final cubit = context.read<CentersCubit>();
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.all(color: ColorManager.black),
              headingRowColor: MaterialStateProperty.all(ColorManager.primary),
              decoration:
              const BoxDecoration(color: ColorManager.tableBackgroundColor),
              dataRowMaxHeight: double.infinity,
              headingTextStyle: StylesManager.semiBold16,
              columns: const [
                DataColumn(
                    label: Text(AppStrings.day, textAlign: TextAlign.center)),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        AppStrings.gymnasticsType,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    )),
                DataColumn(
                  label: Text(AppStrings.trainer, textAlign: TextAlign.center),
                ),
              ],
              rows: List.generate(
                  cubit.currentCenterEntity?.schedule?.length ?? 0, (index) {
                return DataRow(cells: [
                  DataCell(Text(
                    cubit.currentCenterEntity!.schedule![index].day,
                    textAlign: TextAlign.center,
                    style: StylesManager.semiBold16
                        .copyWith(color: ColorManager.primary),
                  )),
                  DataCell(Text(
                    cubit.currentCenterEntity!.schedule![index]
                        .gymnasticTypeName,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: StylesManager.semiBold16
                        .copyWith(color: ColorManager.black),
                  )),
                  DataCell(Text(
                    cubit.currentCenterEntity!.schedule![index].coachName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: StylesManager.semiBold16
                        .copyWith(color: ColorManager.black),
                  )),
                ]);
              }),
            ),
          ),
        );
      },
    );
  }
}