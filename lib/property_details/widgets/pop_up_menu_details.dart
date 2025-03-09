import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_asset_management_app/app/common/widgets/home_modal.dart';
import 'package:home_asset_management_app/home/state/pods.dart';
import 'package:homes_repository/homes_repository.dart';

enum PopupOptions { edit, delete }

class PopUpMenuDetails extends ConsumerWidget {
  const PopUpMenuDetails({required this.home, super.key});

  final Home home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<PopupOptions>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case PopupOptions.delete:
            ref.read(deleteHomeNotifierPod.notifier).remove(home.id);
          case PopupOptions.edit:
            showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (context) => HomeModal.edit(home: home),
            );
        }
      },
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<PopupOptions>>[
            const PopupMenuItem<PopupOptions>(
              value: PopupOptions.edit,
              child: Text('Edit ✏️'),
            ),
            const PopupMenuItem<PopupOptions>(
              value: PopupOptions.delete,
              child: Text('Delete 🗑️'),
            ),
          ],
    );
  }
}
