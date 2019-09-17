import Utils from '../../common/js/core/utils'
import Vent from '../../common/js/core/vent'
import Vue from 'vue/dist/vue.esm'
import turbolinks_adapter from './mixins/turbolinks'
import VueSlider from 'vue-slider-component'

utils = new Utils
vent = new Vent

class Calculator
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
      components: { VueSlider }
      mixins: [turbolinks_adapter]
      data: ->
        total_sqft: Number($("##{widget.id}").data('total-sqft'))
        available_sqft: $("##{widget.id}").data('available-sqft')
        price: $("##{widget.id}").data('price')
        vote_ratio: 5000
        sqft: 0
      mounted: ->
        console.log 'mounted calculator'


export { Calculator as default }
