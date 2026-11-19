import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Pantalla 1 · Login (`LoginScreen.kt`). Formulario con scroll para que no se desborde en pantallas bajas.
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: Listenable.merge([_email, _password]),
        builder: (context, _) {
          final canLogin =
              _email.text.trim().isNotEmpty && _password.text.isNotEmpty;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                  title: 'ReviewLab',
                  tagline: 'Opiniones reales de compradores reales',
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        label: 'Correo:',
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        fieldKey: const Key('txtCorreo'),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Contraseña:',
                        controller: _password,
                        obscureToggle: true,
                        fieldKey: const Key('txtPassword'),
                      ),
                      const SizedBox(height: 8),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: AppColors.deepLime,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        label: 'Iniciar Sesión',
                        onPressed: canLogin ? () {} : null,
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Text(
                            '  o  ',
                            style: TextStyle(color: AppColors.graySecondary),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomOutlinedButton(
                        label: 'Continuar con Google',
                        height: 52,
                        bold: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '¿No tienes cuenta? ',
                                    style: TextStyle(
                                      color: AppColors.graySecondary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Regístrate',
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
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
