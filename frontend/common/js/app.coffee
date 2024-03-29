import Utils from './core/utils'
import Settings from './core/settings'
import Vent from './core/vent'
import Dispatcher from './core/dispatcher'
import Vue from './core/vue'

class AppLoader
  constructor: ->
    @components = []
    @register_core_components()
    @register_events()

  register_component: (component) ->
    @components.push component

  setup: ->
    for key, component of @components
      component.setup()

  teardown: ->
    for key, component of @components
      component.teardown()

  register_core_components: ->
    dispatcher = new Dispatcher
    vue = new Vue

    @register_component dispatcher
    @register_component vue

  register_events: ->
    document.addEventListener "turbolinks:before-cache", =>
      @teardown()

    document.addEventListener 'turbolinks:load', =>
      @setup()

export { AppLoader as default }
