import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Campo con la etiqueta encima y un OutlinedTextField de esquinas de 4 (`CampoCorreoLogin.kt`).
/// Con [obscureToggle] muestra el botón «Ver» / «Ocultar» de la contraseña.
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.obscureToggle = false,
    this.singleLine = true,
    this.onChanged,
    this.fieldKey,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureToggle;
  final bool singleLine;
  final ValueChanged<String>? onChanged;
  final Key? fieldKey;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _visible = false;

  OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color, width: width),
  );

  @override
  Widget build(BuildContext context) {
    final hidden = widget.obscureToggle && !_visible;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w500)),
        TextField(
          key: widget.fieldKey,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: hidden,
          maxLines: widget.singleLine ? 1 : null,
          minLines: widget.singleLine ? 1 : 3,
          onChanged: widget.onChanged,
          cursorColor: AppColors.deepLime,
          style: const TextStyle(fontSize: 16, letterSpacing: 0.5),
          decoration: InputDecoration(
            isDense: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: _border(AppColors.border, 1),
            focusedBorder: _border(AppColors.deepLime, 2),
            suffixIcon: widget.obscureToggle
                ? TextButton(
                    onPressed: () => setState(() => _visible = !_visible),
                    child: Text(
                      _visible ? 'Ocultar' : 'Ver',
                      style: const TextStyle(
                        color: AppColors.deepLime,
                        fontSize: 14,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
