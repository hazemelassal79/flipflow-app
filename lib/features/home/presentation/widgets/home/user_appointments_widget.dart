import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipflow_app/core/res/strings_manager.dart';
import 'package:flipflow_app/core/res/styles_manager.dart';
import 'package:flipflow_app/core/res/values_manager.dart';
import 'package:flipflow_app/core/widgets/custom_loading_widget.dart';
import 'package:flipflow_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/no_appointments_card_widget.dart';
import 'package:flipflow_app/features/home/presentation/widgets/home/user_appointment_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppointmentsWidget extends StatelessWidget {
  const UserAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p18, bottom: AppPadding.p18),
          child: Text(
            AppStrings.appointments,
            style: StylesManager.bold18,
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetUserAppointmentsLoadingState) {
              return const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p28),
                  child: CustomLoadingWidget());
            }
            final cubit = context.read<HomeCubit>();
            if (cubit.appointments?.isEmpty ?? true) {
              return const NoAppointmentsCardWidget();
            }
            return Visibility(
              visible: cubit.appointments?.isNotEmpty ?? false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p18),
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: true  ,
                    aspectRatio: 2.5 / 1,
                    padEnds: false,
                  ),
                  items: cubit.appointments
                      ?.map((entity) => UserAppointmentItemWidget(
                            entity: entity,
                          ))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
