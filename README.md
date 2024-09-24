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

[![Image from Gyazo](https://i.gyazo.com/d84bb89fd1cdcd944d2d3db4cc8d5e28.png)](https://gyazo.com/d84bb89fd1cdcd944d2d3db4cc8d5e28)
## 機能一覧
* ユーザログイン機能(device)
* 投稿機能
* カレンダー機能
* 消費カロリー計算機能
* グラフ表示機能


## 利用方法

#### 1.ログインページで新規登録を行う
[![Image from Gyazo](https://i.gyazo.com/1b561d81034b483ddc880d4f3a7bfb35.gif)](https://gyazo.com/1b561d81034b483ddc880d4f3a7bfb35)

#### 2.投稿するボタンを押すと運動した「日付、運動名を選択、時間、回数、メモ」を入力すると投稿するを押すとカレンダーに表示される

[![Image from Gyazo](https://i.gyazo.com/637a0b1e9588d8eb3be7a331271c0f71.gif)](https://gyazo.com/637a0b1e9588d8eb3be7a331271c0f71)

#### 3.カレンダーを押すと運動した内容の詳細ページへ遷移する。詳細画面で内容の変更・削除。戻るすることができる[![Image from Gyazo](https://i.gyazo.com/3e002fbd85f4ebc7cf54c4514d36c5a5.gif)](https://gyazo.com/3e002fbd85f4ebc7cf54c4514d36c5a5)
#### 4.記録するボタンで体重を記録し記録を見るを押すと過去のデータがグラフとして表示される

[![Image from Gyazo](https://i.gyazo.com/6ee2bf364ba8761cd1f47383184bf9d0.gif)](https://gyazo.com/6ee2bf364ba8761cd1f47383184bf9d0)
[![Image from Gyazo](https://i.gyazo.com/94799cea690c4b5d7b33b2d61df0226c.png)](https://gyazo.com/94799cea690c4b5d7b33b2d61df0226c)



#### 5.身長と体重を入力するとBMI計算がされる

[![Image from Gyazo](https://i.gyazo.com/6c5b4bd6b0298318f119d7aecf5fbe91.gif)](https://gyazo.com/6c5b4bd6b0298318f119d7aecf5fbe91)





## 工夫した点
* 運動した記録がすぐわかるようにカレンダーで内容が見やすく表示させたところ
* 記録した体重を期間ごとに分けることによって、ユーザーにより詳細な体重の変化をグラフで見ることができる


## 実装予定の機能
* セットメニュー機能
(部位によって用意されているメニューを作ることで、ユーザーがなんの運動をするかを考えることなく始められる)


## 改善点
* デザインがシンプルすぎるので、イラストにすることでよりユーザーが瞬時に理解できるようにする

* 入力欄が多いことで、ユーザーが打つのが面倒になる。
マイページなどに普段行う運動内容を保存しておく機能があると良いと思いました
