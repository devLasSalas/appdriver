import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdriver/config/app_theme.dart';

class RegisterNumberPage extends StatelessWidget {
  const RegisterNumberPage({super.key});

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
                  // Navegar a la pantalla anterior (Login)
                  context.go('/login');
                },
              ),
              const SizedBox(height: 20),

              // Icono de llamada
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  size: 30,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 20),

              // Título y Subtítulo
              Text(
                'Ingresa tu número',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                'Te enviaremos un código de verificación para confirmar tu número de teléfono',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 40),

              // Campo Código de país (Simulación con Dropdown)
              const Text('Código de país', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: 'MX México (+52)',
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: <String>['MX México (+52)', 'CO Colombia (+57)', 'AR Argentina (+54)']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Lógica de cambio de país
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo Número de teléfono
              const Text('Número de teléfono', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '10 dígitos',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingresa tu número sin espacios ni guiones',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 40),

              // Botón Continuar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la página de verificación de OTP
                    context.go('/verify-otp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Continuar', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 40),

              // Texto de términos y condiciones
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Al continuar, aceptas nuestros ',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Términos de Servicio',
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: ' y '),
                      TextSpan(
                        text: 'Política de Privacidad',
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
