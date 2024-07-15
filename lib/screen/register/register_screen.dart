import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/custom_snackbar.dart';
import 'package:dicoding_flutter/providers/auth_provider.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.toLogin});

  final Function() toLogin;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _hidePassword = true;

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final state = context.watch<AuthProvider>();

    doRegister() async {
      await context.read<AuthProvider>().register(
            name: _nameTextController.text,
            email: _emailTextController.text,
            password: _passwordTextController.text,
          );
    }

    onRegisterSuccess() {
      ScaffoldMessenger.of(context)
          .showSnackBar(defaultSnackBar(localize.registerSuccess));
      widget.toLogin();
    }

    checkAuth() {
      switch (state.state) {
        case DataState.error:
          return Text(
            localize.registerFailed,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: Colors.red),
          );
        default:
          return const SizedBox();
      }
    }

    fieldName() {
      return TextField(
        enabled: state != DataState.isLoading,
        controller: _nameTextController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: textFieldDecoration(
            context: context,
            icon: const Icon(Icons.person_outline),
            label: localize.name,
            hint: localize.name),
      );
    }

    fieldEmail() {
      return TextField(
        enabled: state != DataState.isLoading,
        controller: _emailTextController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: textFieldDecoration(
            context: context,
            icon: const Icon(Icons.email_outlined),
            label: localize.email,
            hint: localize.emailHint),
      );
    }

    fieldPassword() {
      return TextFormField(
        enabled: state != DataState.isLoading,
        controller: _passwordTextController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: _hidePassword,
        decoration: textFieldDecoration(
          context: context,
          icon: const Icon(Icons.password),
          label: localize.password,
          hint: '****',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            icon: _hidePassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
      );
    }

    buttonRegister() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(defaultCircularRadius),
              ),
              minimumSize: const Size(100, 42)),
          onPressed: () async {
            if (state.state != DataState.isLoading) await doRegister();
            if (state.isRegister == true) onRegisterSuccess();
          },
          child: state.state == DataState.isLoading
              ? const LinearProgressIndicator()
              : Text(localize.register),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localize.register,
                        style: textTheme.titleLarge,
                      ),
                      Text(localize.createNewAccount),
                      const SizedBox(height: defaultPadding * 4),
                      fieldName(),
                      const SizedBox(height: defaultPadding * 2),
                      fieldEmail(),
                      const SizedBox(height: defaultPadding * 2),
                      fieldPassword(),
                      const SizedBox(height: defaultPadding * 2),
                      checkAuth(),
                      const SizedBox(height: defaultPadding * 2),
                      buttonRegister(),
                      const SizedBox(height: defaultPadding * 4),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(localize.haveAnAccount),
                  InkWell(
                    child: Text(
                      localize.login,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    onTap: () {
                      widget.toLogin();
                    },
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding)
            ],
          ),
        ),
      ),
    );
  }
}
