class BtnSerializer < ActiveModel::Serializer
  attributes :id, :sttus
  # attributes :id, :sttus,  :attextra
  

  # ASSOCIASSOES
  belongs_to :kindbtn do
    link(:related) { kindbtn_url(object.kindbtn.id)}
  end
  has_one :circuit
  
  
  link(:self)    { btn_url(object.id)}
  link(:kindbtn) { kindbtn_url(object.kindbtn.id)}

  meta do
    { author: "Emerson Marques"}
  end
  
  def attributes(*args)
    super(*args)
  end
  
  
  # ATRIBUTOS EXTRAS
  # def attextra()
  #   "att_extra_btn..."
  # end
  
  
  ### EXEMPLO DO NOTEBOOK UDEMY
# def attributes(*args)
#   h = super(*)
#   h[:birthdate] = (I18.l(self.birthdate) unless self.birthdate.blank?)
# end


















end