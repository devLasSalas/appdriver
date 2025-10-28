import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdriver/config/app_theme.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Botón de retroceso
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.darkColor),
                onPressed: () {
                  // Navegar a la pantalla anterior (Register Number)
                  context.go('/register-number');
                },
              ),
              const SizedBox(height: 20),

              // Icono de mensaje
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.message_outlined,
                  size: 30,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 20),

              // Título y Subtítulo
              Text(
                'Verifica tu número',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingresa el código de 6 dígitos que enviamos a +523052322603',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 40),

              // Campos de OTP (Simulación)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 40,
                    child: TextFormField(
                      autofocus: index == 0,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: const EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                        // Lógica para verificar si se completó el OTP
                        if (index == 5 && value.isNotEmpty) {
                          // Simulación de OTP correcto, navegar a completar perfil
                          context.go('/complete-profile');
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Reenviar código (Simulación de temporizador)
              Center(
                child: Text(
                  'Reenviar código en 59s',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 150),

              // Enlace de número incorrecto
              Center(
                child: TextButton(
                  onPressed: () {
                    context.go('/register-number');
                  },
                  child: const Text(
                    '¿Número incorrecto? Cambiar',
                    style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
