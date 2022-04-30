import 'package:flutter/material.dart';
import 'package:flutter_todo_list/app/core/auth/auth_provider.dart';
import 'package:flutter_todo_list/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_list/app/services/user/user_service.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Selector<AuthProvider, String>(
            selector: (context, authProvider) =>
                authProvider.user?.displayName ?? 'Não informado',
            builder: (_, value, __) {
              return Text(
                'E ai, $value',
                style: context.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
