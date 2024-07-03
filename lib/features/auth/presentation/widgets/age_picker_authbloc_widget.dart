import 'package:flipflow_app/core/widgets/age_picker_widget.dart';
import 'package:flipflow_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgePickerDialogWidget extends StatefulWidget {
  const AgePickerDialogWidget({super.key});

  @override
  State<AgePickerDialogWidget> createState() => _AgePickerDialogWidgetState();
}

class _AgePickerDialogWidgetState extends State<AgePickerDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return AgePickerWidget(
            value: cubit.age,
            onChanged: (value) => cubit.setAge(value),
          );
        },
      ),
    );
  }
}
