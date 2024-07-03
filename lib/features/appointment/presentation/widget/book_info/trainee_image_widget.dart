import 'dart:io';

import 'package:flipflow_app/core/res/color_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/features/appointment/presentation/cubit/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TraineeImageWidget extends StatelessWidget {
  const TraineeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: GestureDetector(
                onTap: () {
                  cubit.pickImage();
                },
                child: Center(
                    child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: AppSize.s120,
                        height: AppSize.s120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          color: ColorManager.primaryWith10Opacity,
                        ),
                        child: cubit.imageFile == null
                            ? _buildImagePlaceholder()
                            : _buildImageWidget(cubit.imageFile!)))));
      },
    );
  }

  _buildImageWidget(File image) {
    return Image.file(
      image,
      width: AppSize.s120,
      height: AppSize.s120,
      fit: BoxFit.cover,
    );
  }

  _buildImagePlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          size: AppSize.s30,
          color: ColorManager.primary.withOpacity(0.6),
        ),
        Text("Pick image",
            textAlign: TextAlign.center,
            style: StylesManager.regular14.copyWith(
              color: ColorManager.primary.withOpacity(0.8),
            )),
      ],
    );
  }
}
