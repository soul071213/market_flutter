import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/controllers/auth_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final authController = Get.put(AuthController());
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  _submit() async{
    bool result = await authController.register(
      _passwordController.text,
      _nameController.text,
      null
    );
    if(result){
      Get.off(()=>const Home());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.camera_alt,color: Colors.white,size: 30,),
            ),
            SizedBox(height: 16,),
            Text('비밀번호',style: Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 8,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '비밀번호를 입력해주세요'
              ),
            ),
            const SizedBox(height: 16,),
            Text('비밀번호 확인',style:Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 7,),
            TextField(
              obscureText: true,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '비밀번호를 한번 더 입력해주세요',
              ),
            ),
            Text('닉네임',style:Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 8,),
            TextField(
              controller: _nameController,
              obscureText: true,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '닉네임을 입력해주세요'
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: _submit, child: const Text('회원 가입')),
          ],
        ),
      ),
    );
  }
}