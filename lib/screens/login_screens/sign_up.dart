import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/screens/home.dart';
import 'package:email_password_practice/screens/login_screens/sign_in.dart';
import 'package:email_password_practice/values/custom_snack_bar.dart';
import 'package:email_password_practice/values/decoration.dart';
import 'package:email_password_practice/values/string.dart';
import 'package:email_password_practice/widgets/button.dart';
import 'package:email_password_practice/widgets/spacer.dart';
import 'package:email_password_practice/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = Size(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height - 86);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var email = '';
    var password = '';
    var firebaseAuth = FirebaseAuth.instance;
    void signUpWithEmailPassword() async {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        CustomSnackBar.showSnackBar('account create and login', context);
        NavigationTo.pushAndRemoveUntil(
            Home(email: email, name: password), context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          CustomSnackBar.showSnackBar('weak password', context);
        } else if (e.code == 'email-already-in-use') {
          CustomSnackBar.showSnackBar('email-already-in-use', context);
        } else if (e.code == 'invalid-email') {
          CustomSnackBar.showSnackBar('invalid-email', context);
        } else {
          CustomSnackBar.showSnackBar('operation-not-allowed', context);
        }
      } catch (e) {
        CustomSnackBar.showSnackBar(e.toString(), context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.SIGN_UP),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: Decorations.boxDecorationForEntireScreen(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                StringConst.SIGN_UP,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MySpacer(size: size),
              const Text(
                StringConst.CREATE_AN_ACCOUNT,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              MySpacer(size: size),
              //email
              MyTextField(
                  text: StringConst.EMAIL,
                  size: size,
                  onChanged: (value) {
                    email = value;
                  }),
              MySpacer(size: size),
              //password
              MyTextField(
                  text: StringConst.PASSWORD,
                  size: size,
                  onChanged: (value) {
                    password = value;
                  }),
              MySpacer(size: size),
              MyTextField(
                  text: StringConst.CONFIRM_PASSWORD,
                  size: size,
                  onChanged: (value) {}),
              MySpacer(size: size),
              //sign up
              CustomButton(
                bgColor: Colors.blue,
                text: StringConst.SIGN_UP,
                size: size,
                onPressed: signUpWithEmailPassword,
              ),
              MySpacer(size: size),
              lastLine(),
            ]),
      ),
    );
  }

  ///
//   Other option if already have an account
  ///
  Widget lastLine() {
    return GestureDetector(
      onTap: () {
        NavigationTo.push(const SignIn(), context);
      },
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(text: StringConst.ALREADY_HAVE_ACCOUNT),
        TextSpan(
            text: ' ${StringConst.SIGN_IN}',
            style: TextStyle(color: Colors.blue, fontSize: 20))
      ])),
    );
  }
}
