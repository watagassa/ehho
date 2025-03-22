import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
// import 'signup_view_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _viewModel = SignUpViewModel();
  bool isChecked = false; // valueプロパティに渡す変数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新規登録')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // TextField(
            //   // controller: _viewModel.emailController,
            //   decoration: InputDecoration(labelText: 'メールアドレス'),
            // ),
            // TextField(
            //   // controller: _viewModel.passwordController,
            //   decoration: InputDecoration(labelText: 'パスワード'),
            //   obscureText: true,
            // ),
            Text("aaa"),
            TextField(
              // controller: _viewModel.nameController,
              maxLength: 20,
              decoration: InputDecoration(labelText: '名前'),
            ),
            Text("aaa"),
            TextField(
              // controller: _viewModel.heightController,
              decoration: InputDecoration(labelText: '身長（cm）'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
              ],
            ),
            TextField(
              // controller: _viewModel.weightController,
              decoration: InputDecoration(labelText: '体重（kg）'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
              ],
            ),
            // gpsの許可チェックボックス
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!; // チェックボックスに渡す値を更新する
                    });
                  },
                ),
                Text("gpsの許可"),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // final success = await _viewModel.signUp();
                // if (success) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('登録成功！')),
                //   );
                //   // TODO: アクティビティ画面へ遷移
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('登録失敗')),
                //   );
                // }
                context.go("/home");
              },
              child: Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}
