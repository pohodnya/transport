`import DS from "ember-data";`

Machinery = DS.Model.extend
  type: DS.attr 'string'
  name: DS.attr 'string'
  phone: DS.attr 'string'
  price: DS.attr 'string'
  min_order: DS.attr 'string'
  description: DS.attr 'string'

  user: DS.belongsTo 'user'


`export default Machinery;`