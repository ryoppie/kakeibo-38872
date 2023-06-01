const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// カレンダーのエントリーポイントを追加する
environment.entry.set('calendar', './app/javascript/packs/calendar.js')

// 任意の追加の設定を行う場合はここに追加する

module.exports = environment

