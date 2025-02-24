import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompleteDropdown extends StatefulWidget {
  final String? label;
  final List<CompletionType> items;
  final ValueChanged<CompletionType>? onChanged;
  final CompletionType? selectedItem;

  const CompleteDropdown({
    super.key,
    this.label,
    required this.items,
    this.onChanged,
    this.selectedItem,
  });

  @override
  _CompleteDropdownState createState() => _CompleteDropdownState();
}

class _CompleteDropdownState extends State<CompleteDropdown> {
  CompletionType? selectedValue;
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
              children: widget.items.map((CompletionType item) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.plaster, width: 0.5),
                    ),
                  ),
                  child: ListTile(
                    title: Text(item.toDatabaseValue()),
                    onTap: () {
                      setState(() {
                        selectedValue = item;
                      });
                      widget.onChanged?.call(item);
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
              hintText: selectedValue == null
                  ? "${AppStrings.select} ${AppStrings.completionType}"
                  : selectedValue!.toDatabaseValue(),
              labelText: widget.label ?? AppStrings.completionLabel,
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
