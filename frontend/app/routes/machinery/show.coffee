`import Ember from 'ember'`

MachineryShowRoute = Ember.Route.extend

  model: (params)->
    @store.find 'machinery', params.id

  setupController: (controller, model) ->
    controller.set('model', model)

`export default MachineryShowRoute`