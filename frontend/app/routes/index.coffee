`import Ember from 'ember'`

IndexRoute = Ember.Route.extend

  model: () ->
    @store.findAll('machinery_type')

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('new_machinery', @store.createRecord 'machinery')

`export default IndexRoute`