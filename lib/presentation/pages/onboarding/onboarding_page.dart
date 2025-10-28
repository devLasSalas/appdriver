import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appdriver/config/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'Viaja a donde quieras',
      'description': 'Solicita un viaje en segundos y llega a tu destino de forma rápida y segura.',
      'icon': Icons.location_on_outlined,
      'color': AppTheme.primaryColor,
    },
    {
      'title': 'Viaja con confianza',
      'description': 'Conductores verificados, seguimiento en tiempo real y soporte 24/7.',
      ''icon': Icons.verified_user_outlined,
      'color': Colors.deepOrange,
    },
    {
      'title': 'Rápido y fácil',
      'description': 'Pago sin efectivo, tarifas transparentes y llegada en minutos.',
      'icon': Icons.flash_on_outlined,
      'color': Colors.amber,
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      // Navegar a la página de inicio de sesión
      context.go('/login');
    }
  }

  void _skip() {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return _OnboardingContent(
                  data: _onboardingData[index],
                  onSkip: _skip,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => _buildDot(index, context),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(_currentPage == _onboardingData.length - 1 ? 'Comenzar' : 'Siguiente'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 24 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppTheme.primaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onSkip;

  const _OnboardingContent({required this.data, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Iniciar sesión', style: TextStyle(color: AppTheme.primaryColor)),
              ),
              TextButton(
                onPressed: onSkip,
                child: const Text('Saltar', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: data['color'].withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              data['icon'] as IconData,
              size: 60,
              color: data['color'] as Color,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            data['title'] as String,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.darkColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              data['description'] as String,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
