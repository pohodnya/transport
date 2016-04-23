`import DS from "ember-data";`

User = DS.Model.extend
  email:                  DS.attr 'string'
  lastName:               DS.attr 'string'
  firstName:              DS.attr 'string'

  machineries:            DS.hasMany 'machinery'


`export default User;`