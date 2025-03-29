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
<<<<<<< HEAD
      title: FittedBox(child: Text("新規登録", style: TextStyle(fontSize: 28))),
=======
      title: FittedBox(
        child: Text(
          "ehho へようこそ！", 
          style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold,
          ),
        ),
      ),
>>>>>>> Uchida_map_02
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
            Text("3.GPSの許可はする？"),
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
                Text("GPSの許可"),
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
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  //home画面に移動
                  context.go("/home");
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
