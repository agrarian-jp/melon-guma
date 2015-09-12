# Description
# A Hubot script that agrarian api
#
# Dependencies:
# None
#
# Configuration:
#
# Commands:
#
# Author:
# MaxMEllon
# https://github.com/MaxMEllon/melon-guma/blob/master/scripts/agrarian.coffee

module.exports = (robot) ->
  robot.respond /agrarian help/i, (msg) ->
    msg.send 'agrarian enemy `id` : 敵情報'
    msg.send 'agrarian player `id` : プレイヤー情報'
    msg.send 'agrarian ranking rails : rails ランキング'

  robot.respond /agrarian enemy (.*)/i, (msg) ->
    id = msg.match[1]
    request = msg.http("http://agrarian.jp/api/v1/enemies/#{id}")
                 .get()
    request (err, res, body) ->
      json = JSON.parse(body)
      msg.send 'id : ' + json['id']
      msg.send '名前 : ' + json['name']
      msg.send 'rails : ' + json['rails']
      msg.send 'すけさんレポート : ' + json['description']

  robot.respond /agrarian player (.*)/i, (msg) ->
    id = msg.match[1]
    request = msg.http("http://agrarian.jp/api/v1/players/#{id}")
                 .get()
    request (err, res, body) ->
      json = JSON.parse(body)
      msg.send 'id : ' + json['id']
      msg.send '名前 : ' + json['name']
      msg.send 'rails : ' + json['rails']

  robot.respond /agrarian ranking rails/i, (msg) ->
    request = msg.http("http://agrarian.jp/api/v1/players/ranking/rails")
                 .get()
    request (err, res, body) ->
      json = JSON.parse(body)
      for player,i in json
        break if i >= 10
        msg.send '*' + player['rank'] + '位 : ' +  player['name'] + '*'
        msg.send player['rails'] + 'ポイント'

