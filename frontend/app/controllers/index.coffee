`import Ember from 'ember';`

IndexController = Ember.Controller.extend
  actions:
    save: ->
      @new_machinery.save().then =>
        @new_machinery.reload().then =>
          @transitionToRoute 'machinery.show', @new_machinery

`export default IndexController`