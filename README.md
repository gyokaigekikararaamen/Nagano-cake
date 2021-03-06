## Nagano-cake
DMMWEBCAMPのチーム開発で作成したアプリです。

作成開始日:6/12
作成完了日:6/27

## ・アプリトップページ

![app_top](https://user-images.githubusercontent.com/81542430/123535521-4be38900-d75f-11eb-8954-26c485d2e171.jpeg)

-------------------------------

## ・アプリケーションの説明

⻑野県にある⼩さな洋菓⼦店「ながのCAKE」の商品を通販するためのECサイト  
という設定のもと作成されたアプリケーションです。

-------------------------------

## ・使っている言語  

　Ruby on Rails
  HTML&CSS  
  
-------------------------------
## ・アプリケーション機能一覧

#### ・会員側

1 ログイン機能

・メールアドレス、パスワードでログインできる。  
・ログイン時のみ利用できる機能が利用できるようになる。

2 ログアウト機能

・ログインしている状態からログアウト状態にする。  
・ログイン時のみ利用できる機能が利用できなくなる。

3 商品一覧表示機能

・商品一覧を表示する。  
・検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。

4 商品詳細情報表示機能

・商品一覧画面で選択した商品の詳細情報を表示する。  
・カート追加機能が表示されている。

5 カート追加機能

・カートに商品を追加することができる。

6 カート一覧機能

・カートの中身を一覧表示することができる。

7 カート編集機能

・カートの中身の個数を編集したり、削除したりすることができる。

8 注文機能

・カートの中身の購入をすることができる。  
・支払方法や発送先を設定することができる。

9 会員情報編集機能

・登録している情報を編集することができる。

10 退会機能(Gem不使用)

・退会手続きをすることができる。  
・倫理削除を実装しているので、退会した会員の情報も閲覧可能

11 配送先追加・編集機能

・登録している配送先を一覧で確認することができる。  
・配送先の新規追加・修正・削除をすることができる。

12 注文履歴一覧表示機能

・過去の注文概要を一覧で確認することができる。

13 注文履歴詳細表示機能

・注文の詳細（注文商品や個数など）を確認することができる。

14 検索機能

・ヘッダーにて商品名と説明から商品検索が行える。



#### ・管理者側


1 ログイン機能  
・メールアドレス、パスワードでログインできる。  
・ログイン時のみ利用できる機能が利用できるようになる。

2 ログアウト機能  
・ログインしている状態からログアウト状態にする。  
・ログイン時のみ利用できる機能が利用できなくなる。

3 注文履歴一覧表示機能  
・過去の注文概要を一覧で確認することができる。

4 注文履歴詳細表示機能  
・注文の詳細（注文商品や個数など）を確認することができる。  
・注文ステータス、製作ステータスを変更することができる。

5 会員一覧表示機能  
・顧客情報を一覧で確認することができる。

6 会員詳細情報表示機能  
・顧客の詳細情報を確認することができる。  
・顧客のステータス（有効/退会）を切り替えることができる。

7 商品一覧表示機能  
・登録商品を一覧で確認することができる。

8 商品詳細情報表示機能  
・商品の詳細情報を確認することができる。

9 商品情報変更機能  
・商品の登録情報を変更することができる。  
・販売ステータスを変更することができる。

10 ジャンル設定機能  
・ジャンルの追加
・変更

11 検索機能  
  商品名と説明から商品検索が可能

-------------------------------

## ・推奨環境

Ruby 2.5 以降 Rails 5.0 以降

-------------------------------

## ・開発者  

  沢辺侑夏  
  
  石田涼  
  
  勝見仁紀  
  
  吉田伊吹  
 
-------------------------------
## ・インストール
$ git clone git@github.com:gyokaigekikararaamen/Nagano-cake.git  
$ rails db:migrate  
$ rails db:seed  
$ bundle install  


-------------------------------
