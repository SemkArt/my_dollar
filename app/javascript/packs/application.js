window.$ = window.jQuery = require('jquery')
window.Popper = require('popper.js/dist/umd/popper')
require('bootstrap')

window.ActionCable = require('actioncable')
require('./application/usd')
require('./application/rates_fetcher')
