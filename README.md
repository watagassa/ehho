# ehho

## ディレクトリ構成

```
.env                         # 環境変数ファイル（SupabaseのURLやAPIキーを格納）
lib/
│── main.dart                # エントリーポイント。dotenvを読み込み、runApp()でAppを起動
│── app.dart                 # MaterialAppやルーティング設定を管理
│
├── core/                    # アプリ全体で共通のロジックや設定
│   ├── services/            # Supabase認証やデータ取得関連のサービス層
│   │   ├── auth_service.dart        # ログイン・ログアウト・ユーザー登録の処理
│   │   ├── activity_service.dart    # アクティビティのCRUD処理
│   │   ├── user_service.dart        # ユーザー情報の取得・更新処理
│   │
│   ├── models/              # データモデルの定義
│   │   ├── user.dart              # ユーザー情報（身長・体重・氏名・アクティビティID）
│   │   ├── activity.dart          # アクティビティ情報（id・日時・運動時間・運動種別・距離）
│   │
│   ├── utils/               # 共通のヘルパー関数
│   │   ├── date_formatter.dart    # 日付や時間のフォーマット変換関数
│   │   ├── validators.dart        # 入力フォームのバリデーション
│   │
│   ├── theme/               # アプリのデザイン関連
│       ├── colors.dart            # カラーコードの定義
│       ├── typography.dart        # テキストスタイルの統一管理
│
├── data/                    # データアクセス層（リポジトリパターン）
│   ├── repositories/
│   │   ├── user_repository.dart        # ユーザー情報の取得・更新
│   │   ├── activity_repository.dart    # アクティビティのCRUD処理
│   │
│   ├── sources/             # APIやローカルデータアクセス
│       ├── supabase_client.dart  # SupabaseのAPIラッパー
│
├── logic/                   # 状態管理（Bloc, Provider）
│   ├── auth/
│   │   ├── auth_cubit.dart         # 認証状態の管理
│   │   ├── auth_state.dart         # 認証状態（ログイン/未ログイン）
│   │
│   ├── activity/
│   │   ├── activity_cubit.dart     # アクティビティの状態管理
│   │   ├── activity_state.dart     # アクティビティ状態（一覧・詳細など）
│
├── presentation/            # UI（画面とコンポーネント）
│   ├── screens/             # 各画面
│   │   ├── auth/
│   │   │   ├── login_screen.dart       # ログイン画面のUI
│   │   │   ├── register_screen.dart    # 新規登録画面のUI
│   │   │
│   │   ├── activity/
│   │   │   ├── activity_screen.dart       # アクティビティ一覧
│   │   │   ├── activity_detail_screen.dart# アクティビティ詳細
│   │   │
│   │   ├── history/
│   │       ├── history_screen.dart        # 計測履歴画面
│   │
│   ├── widgets/             # 再利用可能なUIコンポーネント
│   │   ├── custom_button.dart      # 汎用的なカスタムボタン
│   │   ├── activity_card.dart      # アクティビティ情報をカード表示するウィジェット
│   │   ├── input_field.dart        # テキスト入力フィールド
│
└── config/                  # 設定ファイル
    ├── supabase_config.dart        # Supabaseの設定（envから読み込む）
    ├── routes.dart                 # ルーティング定義
    ├── app_constants.dart           # アプリ内で共通利用する定数
    ├── environment.dart             # 環境ごとの設定読み込み

assets/                      # 画像・フォント・アイコンなどのアセット
└── images/                  # 画像ファイルを格納
    ├── logo.png             # ロゴ画像
    ├── running_icon.png     # ランニングアイコン
    ├── background.jpg       # 背景画像

```

