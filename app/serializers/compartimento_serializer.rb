class CompartimentoSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :patrimonio
end
