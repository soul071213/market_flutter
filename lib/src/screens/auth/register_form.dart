import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_flutter/src/screens/controllers/auth_controller.dart';
import 'package:market_flutter/src/widgets/forms/label_textfield.dart';
import 'package:market_flutter/src/screens/home.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final authController = Get.put(AuthController());
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _nameController = TextEditingController();

  _submit() async{
    bool result = await authController.register(
      _passwordController.text,
      _nameController.text,
      null
    );
    if(result){
      Get.offAll(()=>const Home());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입'),),
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
            LabelTextfield(
              controller: _passwordController,
              isObscure: true,
              label: '비밀번호',
              hintText: '비밀번호를 입력해주세요'
            ),
            const SizedBox(height: 16,),
            Text('비밀번호 확인',style:Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 7,),
            LabelTextfield(
              controller: _passwordConfirmController,
              isObscure: true,
              label: '비밀번호를 확인',
              hintText: '비밀번호를 한번 더 입력해주세요',
            ),
            Text('닉네임',style:Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 8,),
            LabelTextfield(
              controller: _nameController,
              isObscure: true,
              label: '닉네임',
              hintText: '닉네임을 입력해주세요'
            ),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: _submit, child: const Text('회원 가입')),
          ],
        ),
      ),
    );
  }
}