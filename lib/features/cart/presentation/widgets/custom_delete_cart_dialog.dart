import 'package:flutter/material.dart';
import 'package:market_app_task/core/theme/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteConfirmationDialog({
    super.key,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Delete Confirmation'),
      content: const Text(
          'Are you sure you want to remove this item from the cart?'),
      actions: [
        TextButton(
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
