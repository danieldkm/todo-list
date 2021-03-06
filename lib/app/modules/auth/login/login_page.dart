import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_todo_list/app/core/notifier/default_listener_notifier.dart';
import 'package:flutter_todo_list/app/core/ui/message.dart';
import 'package:flutter_todo_list/app/core/widget/todo_list_field.dart';
import 'package:flutter_todo_list/app/core/widget/todo_list_logo.dart';
import 'package:flutter_todo_list/app/modules/auth/login/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFaocus = FocusNode();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(
      changeNotifier: context.read<LoginController>(),
    ).listener(
      context: context,
      successCallback: (notifier, listenerNotifier) {
        listenerNotifier.dispose();
        Navigator.of(context).pop();
      },
      everCallback: (notifier, listenerNotifier) {
        if (notifier is LoginController) {
          if (notifier.hasInfo) {
            Message.of(context).showInfo(notifier.infoMessage!);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const TodoListLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TodoListField(
                            controller: _emailEC,
                            label: 'E-mail',
                            focusNode: _emailFaocus,
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigat??rio!'),
                              Validatorless.email('E-mail inv??lido!'),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TodoListField(
                            label: 'Senha',
                            obscureText: true,
                            controller: _passwordEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigat??rio!'),
                              Validatorless.min(
                                6,
                                'Senha deve conter pelo menos 6 caracteres!',
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (_emailEC.text.isNotEmpty) {
                                    context
                                        .read<LoginController>()
                                        .forgotPassword(
                                          _emailEC.text,
                                        );
                                  } else {
                                    _emailFaocus.requestFocus();
                                    Message.of(context).showError(
                                        'Digite um e-mail para recuperar a senha!');
                                  }
                                },
                                child: const Text('Esqueceu a senha?'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final formValid =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  if (formValid) {
                                    final email = _emailEC.text;
                                    final password = _passwordEC.text;
                                    context
                                        .read<LoginController>()
                                        .login(email, password);
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('Login'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F3F7),
                        border: Border(
                          top: BorderSide(
                            width: 2,
                            color: Colors.grey.withAlpha(50),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SignInButton(
                            Buttons.Google,
                            text: 'Continue com o Google',
                            padding: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            onPressed: () async {
                              await context
                                  .read<LoginController>()
                                  .googleLogin();
                              Navigator.of(context).pushNamed('/home');
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('N??o tem conta?'),
                              TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed('/register'),
                                child: const Text('Cadastre-se'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
