class MachineryType
  include Mongoid::Document
  field :type, type: String
  default_scope -> { asc(:type) }
end
