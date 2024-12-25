# アプリケーション名 : MY STEP

# URL:  https://my-step.onrender.com/

## アプリケーションの概要

普段運動しない人や仕事や家事で時間が取れない人でも簡単に運動習慣を身につけることができるアプリです。
1分単位で行なった運動を記録できるためちょっとした隙間時間でも記録をつけることができます。



## 開発した背景
自分自身、運動する習慣がなくなってしまい体を動かすことが億劫な気持ちを持つようになりました。
運動の時間を取るのが難しいと考える人でも最初は1分から始めて徐々に運動習慣に慣れてもらえれば将来健康的に過ごせていけるのではないかと思い考えました。


## テスト用アカウント

* Basic認証パスワード：admin
* Basic ID         :2222
* ログインパスワード：azaz@azaz.com
* メールアドレス　：azaz22



## データベース設計

[![Image from Gyazo](https://i.gyazo.com/c51bf56453e2ec658fea203608bc0a0f.png)](https://gyazo.com/c51bf56453e2ec658fea203608bc0a0f)
## アプリ機能一覧
* ユーザログイン機能(device)
* 投稿機能
* カレンダー機能
* 消費カロリー計算機能
* グラフ表示機能

## アプリ技術機能機能
#### バックエンド
* ruby 3.2.0
* rails 7.0.0
* puma 5.0.0

####  フロントエンド
* HTML
* CSS
* JavaScript （jQuery）

#### データベース
* My SQL


## 利用方法

#### 1.ログインページで新規登録を行う
[![Image from Gyazo](https://i.gyazo.com/e21b25f3585e09a52b7b6fbd68243283.gif)](https://gyazo.com/e21b25f3585e09a52b7b6fbd68243283)

#### 2.運動するボタンを押し、運動した「日付、運動名を選択、時間、回数、メモ」を入力すると投稿するを押すとカレンダーに表示される
[![Image from Gyazo](https://i.gyazo.com/2396d872b8c280be3ea17c5203a405e3.gif)](https://gyazo.com/2396d872b8c280be3ea17c5203a405e3)

#### 3.カレンダーを押すと運動した内容の詳細ページへ遷移する。詳細画面で内容の変更・削除。戻るすることができる
[![Image from Gyazo](https://i.gyazo.com/88555bed6f3ee459b3b3cd57bc61c2bd.gif)](https://gyazo.com/88555bed6f3ee459b3b3cd57bc61c2bd)
#### 4.記録するボタンで体重を記録し記録を見るを押すと過去のデータがグラフとして表示される
[![Image from Gyazo](https://i.gyazo.com/8d6a8732d38b191c558952b762f553c2.gif)](https://gyazo.com/8d6a8732d38b191c558952b762f553c2)

#### 5.身長と体重を入力するとBMI計算がされる
[![Image from Gyazo](https://i.gyazo.com/a7d3bc97f28ae0d9b4ba81d5f012a9a7.gif)](https://gyazo.com/a7d3bc97f28ae0d9b4ba81d5f012a9a7)



## 工夫した点
* 運動した記録がすぐわかるようにカレンダーで内容が見やすく表示させたところ
* 記録した体重を期間ごとに分けることによって、ユーザーにより詳細な体重の変化をグラフで見ることができる


## 実装予定の機能
* セットメニュー機能
(部位によって用意されているメニューを作ることで、ユーザーがなんの運動をするかを考えることなく始められる)
* 労いの言葉を添える機能

## 改善点
* デザインがシンプルすぎるので、イラストにすることでよりユーザーが瞬時に理解できるようにする

* 入力欄が多いことで、ユーザーが打つのが面倒になる。
マイページなどに普段行う運動内容を保存しておく機能があると良いと思いました
[![Image from Gyazo](https://i.gyazo.com/e21b25f3585e09a52b7b6fbd68243283.gif)](https://gyazo.com/e21b25f3585e09a52b7b6fbd68243283)
