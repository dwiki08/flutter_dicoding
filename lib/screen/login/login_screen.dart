import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/providers/auth_provider.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routePath = '/login';

  const LoginScreen({
    super.key,
    required this.toRegister,
    required this.onLoggedIn,
  });

  final Function() toRegister;
  final Function(bool isLoggedIn) onLoggedIn;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _hidePassword = true;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final state = context.watch<AuthProvider>();
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;

    doLogin() {
      context.read<AuthProvider>().login(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
    }

    Widget checkAuth() {
      switch (state.state) {
        case DataState.error:
          return Text(
            localize.authNotMatch,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: Colors.red),
          );
        case DataState.hasData:
          if (isLoggedIn == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.onLoggedIn(true);
            });
          }
          break;
        default:
          return const SizedBox();
      }
      return const SizedBox();
    }

    fieldEmail() {
      return TextField(
        enabled: state.state != DataState.isLoading,
        controller: _emailTextController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: textFieldDecoration(
          context: context,
          icon: const Icon(Icons.email_outlined),
          label: localize.email,
          hint: localize.emailHint,
        ),
      );
    }

    fieldPassword() {
      return TextField(
        enabled: state.state != DataState.isLoading,
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
            icon:
                _hidePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
          ),
        ),
      );
    }

    buttonLogin() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(defaultCircularRadius),
            ),
            minimumSize: const Size(100, 42),
          ),
          onPressed: () {
            if (state.state != DataState.isLoading) doLogin();
          },
          child:
              state.state == DataState.isLoading
                  ? const LinearProgressIndicator()
                  : Text(localize.login),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: defaultPadding,
                  children: [
                    const SizedBox(height: 100),
                    Text(localize.login, style: textTheme.titleLarge),
                    Text(localize.welcomeApp),
                    const SizedBox(height: defaultPadding * 2),
                    fieldEmail(),
                    fieldPassword(),
                    checkAuth(),
                    buttonLogin(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localize.dontHaveAccount),
                InkWell(
                  child: Text(
                    localize.register,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  onTap: () {
                    widget.toRegister();
                  },
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
