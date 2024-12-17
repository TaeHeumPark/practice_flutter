import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  // flutter constructor initializer list 방식
  FirebaseAuthService():_auth=FirebaseAuth.instance{
    _auth.setLanguageCode('kr');
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    String? errorMessage;
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'weak-password':
          errorMessage = '취약한 패스워드입니다. 최소 6자리 이상의 문자를 입력하세요.';
          break;
        case 'email-already-in-use':
          errorMessage = '이미 사용 중인 이메일입니다. 다른 이메일을 입력하세요.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일입니다.';
          break;
        default:
          errorMessage = error.message ?? '알 수 없는 에러 발생';
      }
    } catch(error){
      errorMessage = '알 수 없는 에러 발생';
    }
    // 널이 아니면 = 에러가 발생했으면
    if(errorMessage != null) {
      throw Exception(errorMessage);
    }
  }


  Future<void> signInWithEmail() async {
    //로그인 코드 작성
  }

  Future<void> resetPassword(String email) async {
    // 비밀번호 재설정 코드 작성
  }

  Future<void> signOut() async {
    //로그아웃 코드 작성
  }

  Future<void> deleteAccount() async {
    //계정삭제 코드 작성
  }
}