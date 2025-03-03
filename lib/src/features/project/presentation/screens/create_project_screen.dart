import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/custom_dropdown.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/create_project_skills.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProjectScreen extends StatefulWidget {
  final User user;
  const CreateProjectScreen({super.key, required this.user});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _companyController;
  late final TextEditingController _addressController;
  late final TextEditingController _minController;
  late final TextEditingController _maxController;
  late final TextEditingController _fromController;
  late final TextEditingController _toController;
  late final TextEditingController _descController;
  List<String> skills = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _companyController = TextEditingController();
    _addressController = TextEditingController();
    _minController = TextEditingController();
    _maxController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _maxController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _addSkill(String skill) {
    setState(() {
      skills.add(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    List<String> posts = ["Intern", "Associate", "Junior", "Mid", "Senior"];
    List<String> site = ["On-Site", "Hybrid", "Remote"];

    String? selectedValue = posts[0];
    String? selectedSite = site[0];
    const gap = SizedBox(height: 18);
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is CreateProjectSuccess) {
          buildToast(
              toastType: ToastType.success,
              msg: "Project Created Successfully");
          context.read<DashboardBloc>().add(const ChangeScreenModule(0));
        }
        if (state is CreateProjectFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap,
                TextspanField(
                  textController: _titleController,
                  label: AppStrings.projectName,
                  minLines: 2,
                  charCount: 100,
                ),
                gap,
                InputField(
                  textController: _companyController,
                  label: AppStrings.companyName,
                ),
                gap,
                InputField(
                  textController: _addressController,
                  label: AppStrings.address,
                ),
                gap,
                Text(
                  AppStrings.budget,
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontThickness.medium),
                ),
                gap,
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: InputField(
                        textController: _minController,
                        label: AppStrings.min,
                        hintText: "5000",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: InputField(
                        textController: _maxController,
                        label: AppStrings.max,
                        hintText: "15000",
                      ),
                    ),
                  ],
                ),
                gap,
                Text(
                  AppStrings.duration,
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontThickness.medium),
                ),
                gap,
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: InputField(
                        textController: _fromController,
                        label: AppStrings.min,
                        hintText: "2",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: InputField(
                        textController: _toController,
                        label: AppStrings.min,
                        hintText: "5",
                      ),
                    ),
                  ],
                ),
                gap,
                Text(
                  AppStrings.position,
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontThickness.medium),
                ),
                gap,
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomDropdown(
                        label: AppStrings.post,
                        items: posts,
                        onChanged: (value) {
                          selectedValue = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: CustomDropdown(
                        label: AppStrings.site,
                        items: site,
                        onChanged: (value) {
                          selectedSite = value;
                        },
                      ),
                    ),
                  ],
                ),
                gap,
                Text(
                  AppStrings.skill,
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontThickness.medium),
                ),
                gap,
                CreateProjectSkills(
                  skills: skills,
                  onSkillAdded: _addSkill,
                ),
                gap,
                TextspanField(
                  textController: _descController,
                  label: AppStrings.description,
                  minLines: 8,
                  charCount: 500,
                ),
                gap,
                DarkRoundedButton(
                  title: AppStrings.create,
                  onPressed: () {
                    CreateProjectReqDto dto = CreateProjectReqDto(
                        projectName: _titleController.text,
                        companyName: _companyController.text,
                        position: selectedValue!,
                        address: _addressController.text,
                        postedBy: widget.user.uid,
                        description: _descController.text,
                        skills: skills,
                        site: selectedSite!,
                        salary: Salary(
                            min: int.parse(_minController.text),
                            max: int.parse(_maxController.text)),
                        duration: DurationTime(
                          from: int.parse(_fromController.text),
                          to: int.parse(_toController.text),
                        ));
                    context.read<ProjectBloc>().add(CreateProject(dto: dto));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
