import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';

import '../../core/presentation/routes/app_router.gr.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                MdiIcons.github,
                size: 150,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Welcome to Repo Viewer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(authNotifierProvider.notifier)
                    .signIn((authorizationUrl) {
                  final completer = Completer<Uri>();
                  AutoRouter.of(context).push(
                  AuthorizationRoute(
                      authorizationUrl: authorizationUrl,
                      onAuthorizationCodeRedirectAttempt: (redirctedUrl) {
                        completer.complete(redirctedUrl);
                      },
                    ),
                  );
                  return completer.future;
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text(
                  'Sign in',
                  // style: Theme.of(context).textTheme.headline3,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
