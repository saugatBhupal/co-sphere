import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/dob_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/button/add_section_button.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/create_project_skills.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/section_form.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _minController;
  late final TextEditingController _maxController;
  List<Widget> sectionWidgets = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _minController = TextEditingController();
    _maxController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
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
        appBar: const CommonAppbar(title: AppStrings.createProject),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap,
                TextspanField(
                  textController: _titleController,
                  label: AppStrings.title,
                  minLines: 2,
                  charCount: 100,
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
                      child: DobField(
                        dobController: _minController,
                        labelText: AppStrings.from,
                        hintText: "dd-mm-yyyy",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: DobField(
                        dobController: _maxController,
                        labelText: AppStrings.to,
                        hintText: "dd-mm-yyyy",
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
                      child: DobField(
                        dobController: _minController,
                        labelText: AppStrings.from,
                        hintText: "dd-mm-yyyy",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 1,
                      child: DobField(
                        dobController: _maxController,
                        labelText: AppStrings.to,
                        hintText: "dd-mm-yyyy",
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
                const CreateProjectSkills(),
                gap,
                Text(
                  AppStrings.description,
                  style: _textTheme.bodyLarge!
                      .copyWith(fontWeight: FontThickness.medium),
                ),
                gap,
                if (sectionWidgets.isNotEmpty)
                  Column(
                    children: sectionWidgets,
                  ),
                gap,
                AddSectionButton(
                  title: AppStrings.newSec,
                  onPressed: () {
                    setState(() {
                      sectionWidgets.add(const SectionForm());
                    });
                  },
                ),
                DarkRoundedButton(
                  title: AppStrings.create,
                  onPressed: () {
                    CreateProjectReqDto dto = CreateProjectReqDto(
                      projectName: "DevOps Developer",
                      companyName: "Codemandu Real Estate",
                      position: "Trainee",
                      address: "Chitwan, Nepal",
                      postedBy: "67b05057151bd4f0a904a0ba",
                      skills: ["Figma", "Pika", "Node JS"],
                      site: "Hybrid",
                      salary: const Salary(min: 120000, max: 125000),
                    );
                    print(dto.toJson());
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
