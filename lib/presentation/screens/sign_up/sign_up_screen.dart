import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
// import 'signup_view_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _viewModel = SignUpViewModel();
  bool isChecked = false; // valueプロパティに渡す変数
  bool isToggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新規登録')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 20.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1.ｴｯﾎｴｯﾎ 名前を登録しなくちゃ"),
            TextField(
              // controller: _viewModel.nameController,
              maxLength: 20,
              decoration: InputDecoration(labelText: '名前'),
            ),
            SizedBox(height: 20),
            Text("2.ｴｯﾎｴｯﾎ 身長・体重を入力しなきゃ"),
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
            SizedBox(height: 20),
            // gpsの許可チェックボックス
            Text("3.gpsの許可はする？"),
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
            // 通知の許可トグルスイッチ
            Text("4.通知の許可はする？"),
            SizedBox(height: 10),
            Row(
              children: [
                CupertinoSwitch(
                  value: isToggle,
                  onChanged: (value) {
                    setState(() {
                      isToggle = value;
                    });
                  },
                ),
                Text("通知の許可"),
              ],
            ),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //home画面に移動
                  context.go("/home");
                },
                child: Text('登録'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
