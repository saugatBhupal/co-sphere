import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/button/add_section_button.dart';
import 'package:flutter/material.dart';

class SectionForm extends StatefulWidget {
  final Function(JobSection) onSectionAdded;
  const SectionForm({super.key, required this.onSectionAdded});

  @override
  State<SectionForm> createState() => _SectionFormState();
}

class _SectionFormState extends State<SectionForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 18);
    return SizedBox(
      width: context.width,
      child: Column(
        children: [
          gap,
          TextspanField(
            textController: _titleController,
            label: AppStrings.title,
            minLines: 2,
            charCount: 100,
          ),
          gap,
          TextspanField(
            textController: _descController,
            label: AppStrings.description,
          ),
          gap,
          AddSectionButton(
            title: AppStrings.addSec,
            onPressed: () {
              final newSection = JobSection.initial().copywith(
                title: _titleController.text,
                description: _descController.text,
              );

              widget.onSectionAdded(newSection);
            },
          )
        ],
      ),
    );
  }
}
