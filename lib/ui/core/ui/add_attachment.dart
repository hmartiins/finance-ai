import 'package:dotted_border/dotted_border.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AddAttachment extends StatelessWidget {
  const AddAttachment({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [8, 8],
        color: AppColors.light20,
        strokeWidth: 1,
        radius: const Radius.circular(16),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.light100,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Transform.rotate(
                  angle: 450,
                  child: const Icon(
                    Icons.attach_file,
                    color: AppColors.dark25,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Add attachment',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.dark25,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
