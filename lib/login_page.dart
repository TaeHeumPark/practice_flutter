import 'package:flutter/material.dart';
import 'package:workout_tracker/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/show_snackbar.dart';
import 'firebase_auth_service.dart';
import 'package:workout_tracker/frame_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child:FractionallySizedBox(
                  child: Image.asset('assets/exercise/logo.png'),
                  widthFactor: 0.5,
                ),
              ),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Workout Tracker',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@example.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return '이메일 입력하세요.';
                  }
                  if(value.toString().contains('@')){
                    return '골뱅이 쓰세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                validator: (value){
                  if(value!.isEmpty){
                    return '입력하세요.';
                  }
                  if(value.toString().length < 6) {
                    return '너무 짧아요.';
                  }
                  return null;
                },
                onSaved: (value){
                  password = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.go('/settings/login/reset_password');
                    },
                    child: Text('Forgot your password?'),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      auth.signInWithEmail(
                        email: email!,
                        password: password!,
                      ).then((_) {
                        showSnackBar(context, '로그인이 되었습니다.');
                      }).catchError((error) {
                        showSnackBar(context, error.toString());
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '로그인',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: (){
                        context.go('/settings/login/registration');
                      },
                      style: ButtonStyle(
                        // 버튼 스타일 패딩 없애기
                        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                      ),
                      child: Text('Sign up')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
