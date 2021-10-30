import 'package:email_password_practice/routes/navigation.dart';
import 'package:email_password_practice/screens/home.dart';
import 'package:email_password_practice/screens/login_screens/sign_up.dart';
import 'package:email_password_practice/values/custom_snack_bar.dart';
import 'package:email_password_practice/values/decoration.dart';
import 'package:email_password_practice/values/sizes.dart';
import 'package:email_password_practice/values/string.dart';
import 'package:email_password_practice/values/styles.dart';
import 'package:email_password_practice/widgets/button.dart';
import 'package:email_password_practice/widgets/spacer.dart';
import 'package:email_password_practice/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = Size(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height - 86);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    var firebaseAuth = FirebaseAuth.instance;
    // sign in with email password
    void signInWithEmailPassword() async {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        NavigationTo.pushAndRemoveUntil(
            Home(email: email, name: password), context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          CustomSnackBar.showSnackBar(StringConst.USER_NOT_FOUND_LINE, context);
        } else if (e.code == 'wrong-password') {
          CustomSnackBar.showSnackBar(StringConst.WRONG_PASSWORD_LINE, context);
        } else if (e.code == 'invalid-email') {
          CustomSnackBar.showSnackBar('invalid email', context);
        } else {
          CustomSnackBar.showSnackBar('user disable', context);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.SIGN_IN),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: Decorations.boxDecorationForEntireScreen(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                StringConst.SIGN_IN,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MySpacer(
                size: size,
              ),
              const Text(
                StringConst.WELCOME_CREDIENTIAL,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              MySpacer(
                size: size,
              ),
              //email
              MyTextField(
                text: StringConst.EMAIL,
                size: size,
                onChanged: (value) {
                  email = value;
                },
              ),
              MySpacer(size: size),
              //email
              MyTextField(
                text: StringConst.PASSWORD,
                size: size,
                onChanged: (value) {
                  password = value;
                },
              ),
              MySpacer(size: size),
              //sign in button
              CustomButton(
                  bgColor: Colors.blue,
                  text: StringConst.SIGN_IN,
                  onPressed: signInWithEmailPassword,
                  size: size),
              MySpacer(
                size: size,
                heightFactor: 0.02,
              ),
              forgetPassword(),
              MySpacer(
                size: size,
                heightFactor: 0.02,
              ),
              lastLine()
            ]),
      ),
    );
  }

  ///
//   Forget password
  ///
  Widget forgetPassword() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        StringConst.FORGET_PASSWORD,
        style: Styles.customTextStyle2()
            .copyWith(fontSize: Sizes.WIDTH_18, color: Colors.white),
      ),
    );
  }

  ///
//  last line of the screen
  ///
  Widget lastLine() {
    return GestureDetector(
      onTap: () {
        NavigationTo.push(const SignUp(), context);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(text: StringConst.DO_YOU_HAVE_ALREADY_ACCOUNT),
          TextSpan(
              text: "  ${StringConst.SIGN_UP}",
              style: TextStyle(color: Colors.blue, fontSize: 20))
        ])),
      ),
    );
  }
}
