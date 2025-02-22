import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssignDropdown extends StatefulWidget {
  final String? label;
  // final List<String> items;
  final ValueChanged<User>? onChanged;
  final User? selectedItem;
  final List<User> members;

  const AssignDropdown(
      {super.key,
      this.label,
      // required this.items,
      this.onChanged,
      this.selectedItem,
      required this.members});

  @override
  _AssignDropdownState createState() => _AssignDropdownState();
}

class _AssignDropdownState extends State<AssignDropdown> {
  User? selectedValue;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _textFieldKey = GlobalKey();
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  void _toggleDropdown() {
    if (isDropdownOpen) {
      _closeDropdown();
    } else {
      _showDropdownMenu();
    }
  }

  void _showDropdownMenu() {
    final RenderBox renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        width: size.width,
        top: position.dy + size.height + 1,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          color: AppColors.satin,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: AppColors.satin,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.grey.withOpacity(0.4)),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: widget.members.map((User member) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.plaster, width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    title: Text(member.fullname),
                    onTap: () {
                      setState(() {
                        selectedValue = member;
                      });
                      widget.onChanged?.call(member);
                      _closeDropdown();
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: AbsorbPointer(
          child: TextFormField(
            key: _textFieldKey,
            readOnly: true,
            style: _textTheme.bodyLarge!.copyWith(
              color: AppColors.grey,
              letterSpacing: 0,
            ),
            decoration: InputDecoration(
              hintText: "${AppStrings.select} ${AppStrings.members}",
              labelText: widget.label ?? AppStrings.dob,
              suffixIcon: SizedBox(
                height: 12,
                width: 12,
                child: Center(
                  child: isDropdownOpen
                      ? SvgPicture.asset(
                          AppIcons.upward,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        )
                      : SvgPicture.asset(
                          AppIcons.dropdown,
                          height: 8,
                          width: 8,
                          fit: BoxFit.scaleDown,
                        ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
