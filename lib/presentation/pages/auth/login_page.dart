import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdriver/config/app_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Botón de retroceso (flecha izquierda)
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.darkColor),
                onPressed: () {
                  // Navegar a la pantalla anterior (Onboarding)
                  context.go('/onboarding');
                },
              ),
              const SizedBox(height: 20),

              // Icono de "Entrar" o "Login"
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios, // Simula el icono de flecha naranja
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),

              // Título y Subtítulo
              Text(
                'Bienvenido de nuevo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingresa tu número de teléfono para iniciar sesión',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 40),

              // Campo de Código de País
              const Text('Código de país', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                ),
                value: 'MX México (+52)',
                items: <String>['MX México (+52)', 'CO Colombia (+57)', 'AR Argentina (+54)']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
              const SizedBox(height: 20),

              // Campo de Número de Teléfono
              const Text('Número de teléfono', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '10 dígitos',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25), // Borde más redondeado
                    borderSide: const BorderSide(color: AppTheme.primaryColor), // Borde azul
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Botón Iniciar Sesión (Azul)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Simulación de inicio de sesión, debería ir a la verificación OTP
                    context.go('/verify-otp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor.withOpacity(0.8), // Color azul claro
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Iniciar sesión', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 20),

              // Separador "o"
              const Center(
                child: Text(
                  'o',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Botón Crear cuenta nueva (Borde blanco)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Navegar al flujo de registro (Ingresar número)
                    context.go('/register-number');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.darkColor,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Crear cuenta nueva', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),

              // Enlace de ayuda
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: '¿Problemas para iniciar sesión? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Obtener ayuda',
                          style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
