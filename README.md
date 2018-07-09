# wp_unit_test

## 前提
Wordpressのインストールと初期設定が完了していること  
wp-cliなら  
```
wp core install --url=http://example.com/ --title=test --admin_user=wordpress_user --admin_password=password --admin_email=test@example.com
```

## テストモジュールのインストール
wp-cliを使ってプラグインのテストに必要なものをインストールする  
```
wp scaffold plugin-tests hogePlugin
```

※注意  
root権限でwpコマンドを打つとやると怒られるので、root以外のユーザーで実行する(推奨)
```
sudo -u USER -i wp scaffold plugin-tests hogePlugin
```
または、—allow-rootオプションをつける(非推奨)
```
sudo wp —allow-root scaffold plugin-tests hogePlugin
```

新規プラグイン作成の際に以下コマンドでも良い  
```
wp scaffold plugin hogePlugin
```

## テストケースの作成
phpunit用のテストケースを作る  
内容は割愛

## テスト用WPの作成
テストを行いたいプラグインの配下で以下コマンドを実施  
```
./bin/install-wp-tests.sh <db-name> <db-user> <db-pass> [db-host] [wp-version] [skip-database-creation]
```

wp-configに記載のあるDB情報でOK

ex. caitsithの場合  
```
./bin/install-wp-tests.sh wp_db root pman7170 mysql 4.3.11
```

## bootstrap.phpの設定を変更する
デフォルトではプラグイン名になっているので、index.phpとかに変更する

```
function _manually_load_plugin() {
	require dirname( dirname( __FILE__ ) ) . ‘/<プラグイン名>.php';
}
```

## その他
phpunitのバージョン違いでもできるみたい  
できなければ以下をbootstrap.phpに記述すること  
```
if (! class_exists('PHPUnit_Framework_TestCase')) {
    class_alias('PHPUnit\Framework\TestCase', 'PHPUnit_Framework_TestCase');
}
```