import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ja.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja')
  ];

  /// No description provided for @termsOfService.
  ///
  /// In ja, this message translates to:
  /// **'利用規約'**
  String get termsOfService;

  /// No description provided for @mainTitle.
  ///
  /// In ja, this message translates to:
  /// **'ブックマーク一覧'**
  String get mainTitle;

  /// No description provided for @deleteConf.
  ///
  /// In ja, this message translates to:
  /// **'削除しますか?'**
  String get deleteConf;

  /// No description provided for @cancel.
  ///
  /// In ja, this message translates to:
  /// **'キャンセル'**
  String get cancel;

  /// No description provided for @yes.
  ///
  /// In ja, this message translates to:
  /// **'はい'**
  String get yes;

  /// No description provided for @noDataOrLoading.
  ///
  /// In ja, this message translates to:
  /// **'何も登録されていません、若しくはロード中かも'**
  String get noDataOrLoading;

  /// No description provided for @addTitle.
  ///
  /// In ja, this message translates to:
  /// **'ブックマーク登録'**
  String get addTitle;

  /// No description provided for @title.
  ///
  /// In ja, this message translates to:
  /// **'タイトル'**
  String get title;

  /// No description provided for @url.
  ///
  /// In ja, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @required.
  ///
  /// In ja, this message translates to:
  /// **'を入力してください'**
  String get required;

  /// No description provided for @tooLong.
  ///
  /// In ja, this message translates to:
  /// **'が長すぎます'**
  String get tooLong;

  /// No description provided for @regist.
  ///
  /// In ja, this message translates to:
  /// **'登録'**
  String get regist;

  /// No description provided for @successRegist.
  ///
  /// In ja, this message translates to:
  /// **'の登録に成功しました'**
  String get successRegist;

  /// No description provided for @failureRegist.
  ///
  /// In ja, this message translates to:
  /// **'の登録に失敗しました'**
  String get failureRegist;

  /// No description provided for @back.
  ///
  /// In ja, this message translates to:
  /// **'戻る'**
  String get back;

  /// No description provided for @forward.
  ///
  /// In ja, this message translates to:
  /// **'進む'**
  String get forward;

  /// No description provided for @reload.
  ///
  /// In ja, this message translates to:
  /// **'更新'**
  String get reload;

  /// No description provided for @close.
  ///
  /// In ja, this message translates to:
  /// **'終了'**
  String get close;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
