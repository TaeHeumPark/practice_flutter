import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:workout_tracker/show_snackbar.dart';
import '../../services/firebase_auth_service.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuthService();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 재설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '비밀번호 재설정을 위해\n이메일을 입력해주세요',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  hintText: 'example@example.com',
                  border: UnderlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return '유효한 이메일을 입력하세요';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      auth.resetPassword(email: email!).then((_) {
                        showSnackBar(context, '비밀번호 재설정 이메일이 전송되었습니다.');
                      }).catchError((error) {
                        showSnackBar(context, error.toString());
                      });;
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
                      '비밀번호 재설정 이메일 보내기',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                      )
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                  '* 이메일을 통해 비밀번호 재설정 링크를 확인하세요.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
