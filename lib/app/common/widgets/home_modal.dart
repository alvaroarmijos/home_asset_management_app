import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_asset_management_app/app/common/utils/validators.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/home/state/home_modal.state.dart';
import 'package:home_asset_management_app/home/state/pods.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// {@template HomeModal}
/// Show the modal to Add/Update a Home
/// {@endtemplate}
class HomeModal extends HookConsumerWidget {
  /// {@macro HomeModal}
  const HomeModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final addressController = useTextEditingController();

    final homeModalState = ref.watch(homeModalNotifierPod);

    ref.listen(homeModalNotifierPod, (_, currentState) {
      if (currentState is HomeModalStateSaved) {
        Navigator.pop(context);
      }
    });

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.space16),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            spacing: AppSpacing.space16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add new Home',
                style: textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.space20),
              Text('Name', style: textTheme.titleLarge),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Property name'),
                validator: HomeValidator.nameValidation,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.space20),

              Text('Address', style: textTheme.titleLarge),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(hintText: 'Property address'),
                validator: HomeValidator.addressValidation,
              ),
              const SizedBox(height: AppSpacing.space20),
              const Spacer(),
              switch (homeModalState) {
                HomeModalStateInitial() ||
                HomeModalStateFailure() => ElevatedButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      ref
                          .read(homeModalNotifierPod.notifier)
                          .addHome(nameController.text, addressController.text);
                    }
                  },
                  child: const Text('Save'),
                ),
                HomeModalStateLoading() || HomeModalStateSaved() =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              },
            ],
          ),
        ),
      ),
    );
  }
}
