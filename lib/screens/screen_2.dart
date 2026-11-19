import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Pantalla 2 · Registro (`RegisterScreen.kt`): siete campos y botón, todo dentro de un scroll.
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 16);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthHeader(
              title: 'Crea tu cuenta',
              tagline: 'Únete a la comunidad de ReviewLab',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomTextField(
                    label: 'Nombre:',
                    fieldKey: Key('txtNombre'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'Usuario:',
                    fieldKey: Key('txtUsuario'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'Correo:',
                    keyboardType: TextInputType.emailAddress,
                    fieldKey: Key('txtEmail'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'Celular:',
                    keyboardType: TextInputType.phone,
                    fieldKey: Key('txtCelular'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'Contraseña:',
                    obscureToggle: true,
                    fieldKey: Key('txtPassword'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'País (opcional):',
                    fieldKey: Key('txtPais'),
                  ),
                  gap,
                  const CustomTextField(
                    label: 'Biografía (opcional):',
                    singleLine: false,
                    fieldKey: Key('txtBio'),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(label: 'Registrarse', onPressed: () {}),
                  gap,
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '¿Ya tienes cuenta? ',
                            style: TextStyle(color: AppColors.graySecondary),
                          ),
                          TextSpan(
                            text: 'Inicia sesión',
                            style: TextStyle(
                              color: AppColors.deepLime,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
