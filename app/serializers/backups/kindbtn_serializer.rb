class KindbtnSerializer < ActiveModel::Serializer
  attributes :id, :name


  has_one :btn

  def attributes(*args)
    super(*args)
  end

  
end
