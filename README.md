# アプリケーション名
my_step

#　アプリケーションの概要
普段運動しない人や仕事や家事で時間が取れない人でも簡単に運動習慣を身につけることができるアプリです。
1分単位で行なった運動を記録できるためちょっとした隙間時間でも記録をつけることができます。
また、他にも消費カロリーの計算や体重をグラフ化した項目があります。
# URL

## テスト用アカウント
・Basic認証パスワード：admin
・Basic ID         :2222

##　データベース設計

[![Image from Gyazo](https://i.gyazo.com/d84bb89fd1cdcd944d2d3db4cc8d5e28.png)](https://gyazo.com/d84bb89fd1cdcd944d2d3db4cc8d5e28)
## 機能一覧
・ユーザー登録。ログイン機能(device)
・投稿機能
・カレンダー機能
・消費カロリー計算機能
・グラフ表示機能


## 利用方法

1、ログインページで新規登録を行う
https://i.gyazo.com/7aef8c4c9fc9d0a7a4fd145e85589095.mp4
2、投稿するボタンを押すと運動した「日付、運動名を選択、時間、回数、メモ」を入力する
3、カレンダーを押すと運動した内容の詳細ページへ遷移する

4、記録するボタンで体重を記録し記録を見るを押すと過去のデータがグラフとして表示される

5、身長と体重を入力するとBMI計算がされる









## User名

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false |
 has many :logs
 has_one :profile,dependent: :destroy
has_many :weights, dependent: :destroy


## profileテーブル
| Column               | Type       | Options     |
| -----------------    | ------     | ----------- |
| user                 | references | null: false, foreign_key: true |
| height               | float        |  |
| weight               | float        | null: false |
| goal_weight          | float        | |
belongs_to :user




##　Logsテーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| date           |  date      | null: false                    |
| duration       | int        | null: false, greater_than_or_equal_to: 0 |
| reps           | int        | null: false, greater_than:0    |
| memo           | text       |                                |
### モデルの関連付け
belongs_to:user




weightsテーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| date           |  date      | null: false                    |
| weight         | float        | null: false |


 ### モデルの関連付け
belongs_to :user
