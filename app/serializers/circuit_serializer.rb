class CircuitSerializer < ActiveModel::Serializer
  attributes :id, :sttus, :name, :description
  has_one :compartimento
  has_one :kindbtn
  has_one :kinddev
end
