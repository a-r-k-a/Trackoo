import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Obx(
          () => Text(
            Get.find<AuthController>().isLogin.value ? 'Login' : 'Register',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Toggle Buttons
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap:
                                Get.find<AuthController>().isLogin.value
                                    ? null
                                    : Get.find<AuthController>().onToggleView,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color:
                                    Get.find<AuthController>().isLogin.value
                                        ? Colors.blue[50]
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Get.find<AuthController>().isLogin.value
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap:
                                Get.find<AuthController>().isLogin.value
                                    ? Get.find<AuthController>().onToggleView
                                    : null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color:
                                    !Get.find<AuthController>().isLogin.value
                                        ? Colors.green[50]
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      !Get.find<AuthController>().isLogin.value
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Form Fields
                  if (!Get.find<AuthController>().isLogin.value)
                    _buildTextField('Name'),
                  const SizedBox(height: 16),
                  _buildTextField('Email'),
                  const SizedBox(height: 16),
                  _buildTextField('Password', isPassword: true),
                  const SizedBox(height: 16),
                  if (!Get.find<AuthController>().isLogin.value)
                    _buildTextField('Confirm Password', isPassword: true),
                  const SizedBox(height: 32),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {}, // Dummy placeholder
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        Get.find<AuthController>().isLogin.value
                            ? 'Login'
                            : 'Create Account',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Toggle Text
                  TextButton(
                    onPressed: Get.find<AuthController>().onToggleView,
                    child: Text(
                      Get.find<AuthController>().isLogin.value
                          ? 'Don\'t have an account? Sign up'
                          : 'Already have an account? Login',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[100]!, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
