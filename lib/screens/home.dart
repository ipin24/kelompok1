import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubit/auth_cubit.dart';
import 'package:example/screens/loginView.dart';
import 'package:example/theme.dart';
import 'package:example/widgets/primary_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Text(
                    'Hello ${state.user.name}, Welcome',
                    style: heading2,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade700,
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Container(
                  width: 220,
                  child: CustomPrimaryButton(
                    buttonColor: Colors.red.shade700,
                    textValue: 'Log Out',
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
