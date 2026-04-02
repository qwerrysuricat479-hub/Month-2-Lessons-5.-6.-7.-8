import 'package:flutter/material.dart';

void main() => runApp(const RegistrationApp());

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showConfirmation() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Подтверждение'),
          content: Text('Имя: ${nameController.text}\nФамилия: ${surnameController.text}\nEmail: ${emailController.text}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      name: nameController.text,
                      surname: surnameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      login: loginController.text,
                    ),
                  ),
                );
              },
              child: const Text('ОК'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                label: 'Имя',
                validator: (v) => (v == null || v.isEmpty) ? 'Введите имя' : null,
              ),
              buildTextField(
                controller: surnameController,
                label: 'Фамилия',
                validator: (v) => (v == null || v.isEmpty) ? 'Введите фамилию' : null,
              ),
              buildTextField(
                controller: phoneController,
                label: 'Телефон',
                keyboardType: TextInputType.phone,
                validator: (v) => (v == null || v.length < 10) ? 'Неверный формат' : null,
              ),
              buildTextField(
                controller: emailController,
                label: 'Email',
                validator: (v) => (v == null || !v.contains('@')) ? 'Некорректный email' : null,
              ),
              buildTextField(
                controller: loginController,
                label: 'Логин',
                validator: (v) => (v == null || v.length < 4) ? 'Минимум 4 символа' : null,
              ),
              buildTextField(
                controller: passwordController,
                label: 'Пароль',
                obscureText: true,
                validator: (v) => (v == null || v.length < 6) ? 'Минимум 6 символов' : null,
              ),
              buildTextField(
                controller: confirmPasswordController,
                label: 'Повторите пароль',
                obscureText: true,
                validator: (v) {
                  if (v != passwordController.text) return 'Пароли не совпадают';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: showConfirmation,
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String name, surname, phone, email, login;
  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Данные пользователя')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: $name', style: const TextStyle(fontSize: 18)),
            Text('Фамилия: $surname', style: const TextStyle(fontSize: 18)),
            Text('Телефон: $phone', style: const TextStyle(fontSize: 18)),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
            Text('Логин: $login', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}