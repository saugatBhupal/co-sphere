import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/assign_dropdown.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/date_field.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/selected_members_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddTaskForm extends StatefulWidget {
  final String projectId;
  final List<User> members;
  const AddTaskForm({
    super.key,
    required this.members,
    required this.projectId,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  late final TextEditingController _dateController;
  List<User> selected = [];
  User? selectedMember;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    const gap = SizedBox(height: 18);
    final _formKey = GlobalKey<FormState>();
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          print(state);
          buildToast(
              toastType: ToastType.success, msg: "Task Added Successfully");
          Navigator.of(context).pop();
        }
        if (state is CreateTaskFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.createNewTask,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.black,
                ),
              ),
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
              DateField(
                onDatePicked: (pickedDate) {
                  setState(() {
                    _dateController.text = pickedDate;
                  });
                },
                labelText: AppStrings.due,
                dateController: _dateController,
              ),
              gap,
              AssignDropdown(
                label: AppStrings.assign,
                members: widget.members,
                selectedItem: selectedMember,
                onChanged: (value) {
                  if (value != null && !selected.contains(value)) {
                    setState(() {
                      selectedMember = value;
                      selected.add(value);
                    });
                  }
                },
              ),
              if (selected.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    height:
                        selected.length > 3 ? 200.0 : selected.length * 60.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: selected.length,
                        itemBuilder: (context, index) {
                          final reversedList = selected.reversed.toList();
                          return SelectedMembersCard(
                              name: reversedList[index].fullname);
                        }),
                  ),
                ),
              gap,
              DarkRoundedButton(
                title: AppStrings.createTask,
                fontSize: 12,
                onPressed: () {
                  context.read<ProjectBloc>().add(CreateTask(
                        dto: CreateTaskReqDto(
                          projectId: widget.projectId,
                          taskName: _titleController.text,
                          taskDescription: _descController.text,
                          deadline: DateFormat('dd-MM-yyyy')
                              .parse(_dateController.text.replaceAll(' ', '')),
                          members: selected.map((user) => user.uid).toList(),
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
