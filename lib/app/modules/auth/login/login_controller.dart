import 'package:flutter_todo_list/app/core/notifier/default_change_notifier.dart';
import 'package:flutter_todo_list/app/exception/auth_exception.dart';
import 'package:flutter_todo_list/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({
    required UserService userService,
  }) : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> googleLogin() async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userService.googleLogin();

      if (user != null) {
        success();
      } else {
        _userService.googleLogout();
        setError('Erro ao realizar login com Google');
      }
    } on AuthException catch (e) {
      _userService.googleLogout();
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userService.login(email, password);
      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválido!');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      await _userService.forgotPassword(email);
      infoMessage = 'Reset de seha enviado para seu e-mail';
    } on AuthException catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro ao resetar a senha!');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
