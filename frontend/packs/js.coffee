# The Basics
import Vue from 'vue/dist/vue.esm'
import semantic_js from '../semantic_ui/dist/semantic.min'
import Turbolinks from 'turbolinks'

# MacronJS
import App from '../common/js/app'
import Settings from '../common/js/core/settings'
import Utils from '../common/js/core/utils'

# Vue Widgets
import Calculator from '../js/vue/calculator'

calculator = new Calculator

Turbolinks.start()

app = new App
settings = new Settings
utils = new Utils

settings.set version: 'Version 0.1 ' # set the application version
settings.set debug: true # show the debug messages
settings.set design: false # design mode disables the uploadcare widget

utils.draw 'blank_header'
utils.log 'header', '****'
utils.log 'header', 'Initializing Macron.JS'
utils.log 'header', "#{settings.get('version')}"
utils.log 'header', "********"
utils.draw 'blank_header'
utils.log 'setting', "Debug: #{settings.get('debug')}"
utils.log 'setting', "Design: #{settings.get('design')}"

$ ->
  app.setup()

document.addEventListener 'turbolinks:load', ->
  unless typeof(window.segment_js_write_key) == 'undefined'
    analytics.page()
