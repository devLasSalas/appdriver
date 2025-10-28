import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdriver/config/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isOnline = false;

  void _toggleOnlineStatus() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Ocultar botón de back
        title: const Text('Driver App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Simular cierre de sesión y navegar a login
              context.go('/login');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Simulación de mapa (área principal)
          Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'Simulación de Mapa y Viajes',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
          // Panel inferior de estado
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isOnline ? 'Conectado' : 'Desconectado',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: _isOnline ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _isOnline ? 'Esperando solicitudes...' : 'Toca para conectarte',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Switch.adaptive(
                        value: _isOnline,
                        onChanged: (value) => _toggleOnlineStatus(),
                        activeColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Placeholder para información de viaje
                  if (_isOnline)
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.lightColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.directions_car, color: AppTheme.primaryColor, size: 30),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Próximo Viaje', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Recogida: Av. Principal 123', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
