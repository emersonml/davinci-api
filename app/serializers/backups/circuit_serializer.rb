class CircuitSerializer < ActiveModel::Serializer
  attributes :id, :sttus, :name, :btn_id


  
  # ASSOCIASSOES
  belongs_to :btn do
    link(:related) { btn_url(object.btn.id)}
  end
  
    link(:self)     { circuit_url(object.id)}
    # link(:btn)      { btn_url(object.btn.id)}
    link(:kindbtn)  { kindbtn_url(object.btn.kindbtn.id)}

    def attributes(*args)
      super(*args)
    end
    
end  ##last

