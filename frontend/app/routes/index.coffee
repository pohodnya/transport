`import Ember from 'ember'`

IndexRoute = Ember.Route.extend

  model: () ->
    @store.findAll('machinery_type')

  setupController: (controller, model) ->
    controller.set('model', model)

`export default IndexRoute`