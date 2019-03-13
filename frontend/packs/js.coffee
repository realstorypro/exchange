import Vue from 'vue/dist/vue.esm'
import semantic_js from '../semantic_ui/dist/semantic.min'
import App from '../common/js/app'
import Turbolinks from 'turbolinks'

Turbolinks.start()

$ ->
  app = new App
  app.setup()

document.addEventListener 'turbolinks:load', ->
  unless typeof(window.segment_js_write_key) == 'undefined'
    analytics.page()
