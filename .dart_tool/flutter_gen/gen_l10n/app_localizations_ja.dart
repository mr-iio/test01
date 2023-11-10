import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get termsOfService => '利用規約';

  @override
  String get mainTitle => 'ブックマーク一覧';

  @override
  String get deleteConf => '削除しますか?';

  @override
  String get cancel => 'キャンセル';

  @override
  String get yes => 'はい';

  @override
  String get noDataOrLoading => '何も登録されていません、若しくはロード中かも';

  @override
  String get addTitle => 'ブックマーク登録';

  @override
  String get title => 'タイトル';

  @override
  String get url => 'URL';

  @override
  String get required => 'を入力してください';

  @override
  String get tooLong => 'が長すぎます';

  @override
  String get regist => '登録';

  @override
  String get successRegist => 'の登録に成功しました';

  @override
  String get failureRegist => 'の登録に失敗しました';

  @override
  String get back => '戻る';

  @override
  String get forward => '進む';

  @override
  String get reload => '更新';

  @override
  String get close => '終了';
}
