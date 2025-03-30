import 'package:ehho/core/services/auth_service.dart';
import 'package:ehho/presentation/widgets/gpsAllow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // final _viewModel = SignUpViewModel();
  bool isChecked = false; // valueプロパティに渡す変数
  bool isToggle = false;

  String name = "";
  double height = 0;
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    final header = AppBar(
      leading: Padding(
        //左側に画像読み込み
        padding: EdgeInsets.all(1), // 左側の余白を追加
        child: Image.asset(
          'assets/images/ehho_nomal.png',
          fit: BoxFit.contain, //画像のサイズを調整
        ),
      ),
      leadingWidth: 100, //画像配置の幅広げてる
      title: FittedBox(child: Text("新規登録", style: TextStyle(fontSize: 28))),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
      toolbarHeight: 80,
    );
    return Scaffold(
      appBar: header,
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
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
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
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
            ),
            TextField(
              // controller: _viewModel.weightController,
              decoration: InputDecoration(labelText: '体重（kg）'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
              ],
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            // gpsの許可チェックボックス
            Text("3.gpsの許可はする？"),
            GpsallowButton(),
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
            SizedBox(
              child: ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(authServiceProvider)
                      .registerUser(name: name, height: height, weight: weight);
                  if (context.mounted) {
                    //home画面に移動
                    context.go("/home");
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(800, 50),
                  backgroundColor: Colors.amber[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '新規登録',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
