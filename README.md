# ehho

## ディレクトリ構成
```
.env                         # プロジェクトルートに配置する環境変数ファイル（例: SUPABASE_URL, SUPABASE_API_KEY など）
lib/
│── main.dart                # エントリーポイント。dotenvを読み込み、runApp()でAppを起動する
│── app.dart                 # MaterialAppやルーティング設定を管理するウィジェット
│
├── core/                    # アプリ全体で共通のロジックや設定
│   ├── services/            # Supabase認証やデータ取得関連のサービス層
│   │   ├── auth_service.dart      # ログイン・ログアウト・ユーザー登録の処理を管理
│   │   ├── activity_service.dart  # アクティビティの記録のCRUD処理を管理
│   │   ├── user_service.dart      # ユーザー情報の取得・更新処理を管理
│   │
│   ├── models/              # データモデルの定義
│   │   ├── user.dart              # ユーザー情報（身長・体重・氏名・アクティビティID）をモデル化
│   │   ├── activity.dart          # アクティビティ情報（id・日時・運動時間・運動種別・距離）をモデル化
│   │
│   ├── utils/               # アプリ共通の便利関数やバリデーション
│   │   ├── date_formatter.dart    # 日付や時間のフォーマット変換関数
│   │   ├── validators.dart        # 入力フォームのバリデーション関数（例: 身長・体重の入力チェック）
│   │
│   ├── theme/               # アプリのデザイン関連
│       ├── colors.dart            # カラーコードを定義（例: プライマリカラー、背景色）
│       ├── typography.dart        # テキストスタイルの統一管理
│
├── features/                # 各機能ごとのUIとロジック
│   ├── auth/                # 認証関連の画面
│   │   ├── login_screen.dart      # ログイン画面のUIとロジック
│   │   ├── register_screen.dart   # 新規登録画面のUIとロジック
│   │
│   ├── activity/            # アクティビティ画面
│   │   ├── activity_screen.dart        # アクティビティの一覧表示画面
│   │   ├── activity_detail_screen.dart # アクティビティ詳細画面
│   │
│   ├── history/             # 計測履歴画面
│   │   ├── history_screen.dart   # 計測履歴一覧を表示する画面
│
├── widgets/                 # 再利用可能なUIコンポーネント
│   ├── custom_button.dart        # カスタムボタン（例: PrimaryButton, SecondaryButton）
│   ├── activity_card.dart        # アクティビティ情報をカード表示するウィジェット
│   ├── input_field.dart          # テキスト入力フィールド（例: 名前・身長・体重の入力）
│
└── config/                  # 設定ファイル関連
    ├── supabase_config.dart       # SupabaseのURL・APIキーなどを管理（envから読み込む）
    ├── routes.dart                # 画面遷移のルーティング定義（GoRouterやNavigatorを使用）
    
assets/                      # 画像・フォント・アイコンなどのアセット
└── images/                  # 画像ファイルを格納
    ├── logo.png             # ロゴ画像
    ├── running_icon.png     # ランニング用アイコン
    ├── background.jpg       # 背景画像
```

