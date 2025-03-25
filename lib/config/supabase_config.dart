import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Supabaseクライアントのプロバイダー
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

// Supabaseの初期化
Future<void> initSupabase() async {
  final supabaseUrl = dotenv.env['PUBLIC_SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['PUBLIC_SUPABASE_ANON_KEY'];

  if (supabaseUrl == null || supabaseAnonKey == null) {
    throw Exception('envファイルにsupabase関連の値が見つかりませんでした。');
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}