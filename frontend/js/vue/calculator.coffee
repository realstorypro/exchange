import Utils from '../../common/js/core/utils'
import Vent from '../../common/js/core/vent'
import Vue from 'vue/dist/vue.esm'
import turbolinks_adapter from './mixins/turbolinks'

utils = new Utils
vent = new Vent

class Embed
  instance = null
  app = null


  constructor: ->
    if !instance
      instance = this

    else
      instance

    vent.channel().on "vue:calculator", (widget, action) =>

      switch action
        when 'setup' then @setup(widget)

  setup: (widget) ->
    utils.log 'setup', 'setup()', 'calculator'

    @app = new Vue
      el: "##{widget.id}"
      mixins: [turbolinks_adapter]
      props:
        url: ''
      mounted: ->
        console.log 'mounted calculator'

export { Embed as default }
