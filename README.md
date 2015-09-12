# めろんぐま

agrarian-jp の slack bot です

## instrall

1. npm と node をinstall
2. npm i
3. bin/hubot

## command

| コマンド | 実行結果 |
|---|---|
| agrarian ranking rails | rails ランキングTOP10を表示 |
| agrarian enemy [id] |  enemy詳細表示 |
| agrarian player [id] |  player詳細表示 |
| agrarian help | help表示 |

## how to run

```sh
HUBOT_FILE_BRAIN_PATH=./brain.json HUBOT_SLACK_TOKEN=[API_TOKEN] bin/hubot -a slack
```

