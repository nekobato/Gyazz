# Gyazz - 手軽で強力なWiki
<img src="http://gyazo.com/248389634c9f44bd08edcd94e21c3808.gif">

## 特徴

* <http://Gyazz.com>で運用しているものです
* URLにWiki名とページ名を指定してすぐにページを作成/編集できます
* 行を長クリックすると編集可能になり、編集すると自動的にセーブされます
* <a href="http://Gyazz.com/Gyazz/使い方">使い方のページ</a>、
  <a href="http://Gyazz.com/推薦Wiki">推薦Wiki</a>などをご覧下さい

## インストール

* 必要なrubygemをインストール

        % gem install bundler
        % bundle install

* データ格納ディレクトリをつくる

        % mkdir /your/data/directory

* 環境にあわせて lib/config_template.rb を編集して lib/config.rb をつくる

        FILEROOT = "/your/data/directory"
        DEFAULTPAGE = "/Gyazz/index"
        SESSION_SECRET = "special_arbitrary_secret_string"

## 起動

    % bundle exec rackup config.ru -p 3000

=> <http://localhost:3000>
