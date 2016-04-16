import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

const { service } = Ember.inject;

export default Ember.Route.extend(ApplicationRouteMixin, {
    session: service('session'),

    model: function() {
        this.store.findAll('machinery_type')
    },
    setupController: function(controller, model) {
        controller.set('model', model);
    },
    actions: {
        logout() {
            this.get('session').invalidate();
        },
        test() {
          console.log('qwe');
          console.log('qwe');
          console.log('qwe');
        }
    }
});
