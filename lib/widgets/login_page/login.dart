import 'package:flutter/material.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/widgets/custom_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login>
    with AutomaticKeepAliveClientMixin<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: grey,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  _buildLoginSection(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Email CustomTextFormField
        CustomTextFormField(
          controller: _emailController,
          data: Icons.email,
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          isObscure: false,
        ),
      ],
    );
  }

  Widget _buildPasswordSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Password CustomTextFormField
        CustomTextFormField(
          controller: _passwordController,
          data: Icons.lock,
          labelText: 'Password',
          isObscure: true,
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              debugPrint("Tapped");
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  btncolor), // Background color
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(16)), // Button padding
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Button border radius
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                  const Size(180, 55)), // Set the width and height
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: orangedark, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          _buildEmailSection(context),
          _buildPasswordSection(context),
          _buildLoginButton(context),
        ],
      ),
    );
  }
}
