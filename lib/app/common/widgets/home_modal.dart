import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_asset_management_app/app/common/utils/validators.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/home/state/home_modal.state.dart';
import 'package:home_asset_management_app/home/state/pods.dart';
import 'package:homes_repository/homes_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Popup modal that you can use by default to create/edit a Home
enum HomeModalType {
  /// Create Home Modal
  create,

  /// Edit Home Modal
  edit,
}

/// {@template HomeModal}
/// Show the modal to Add/Update a Home
/// {@endtemplate}
class HomeModal extends HookConsumerWidget {
  /// Creates a modal to add a new Home.
  const HomeModal.create({
    super.key,
    this.type = HomeModalType.create,
    this.home,
  });

  /// Creates a modal to edit a Home.
  const HomeModal.edit({
    required Home this.home,
    super.key,
    this.type = HomeModalType.edit,
  });

  /// The type of the modal.
  /// Can be [HomeModalType.create] or [HomeModalType.edit].
  final HomeModalType type;

  /// Home to edit
  final Home? home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController(text: home?.name);
    final addressController = useTextEditingController(text: home?.address);
    final (title, buttonLabel) = switch (type) {
      HomeModalType.create => ('Add new Home', 'Save'),
      HomeModalType.edit => ('Edit Home', 'Update'),
    };

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
                title,
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
                      final homeModalNotifier = ref.read(
                        homeModalNotifierPod.notifier,
                      );
                      switch (type) {
                        case HomeModalType.create:
                          homeModalNotifier.addHome(
                            nameController.text,
                            addressController.text,
                          );
                        case HomeModalType.edit:
                          if (home == null) return;
                          homeModalNotifier.update(
                            home!.copyWith(
                              name: nameController.text,
                              address: addressController.text,
                            ),
                          );
                      }
                    }
                  },
                  child: Text(buttonLabel),
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
