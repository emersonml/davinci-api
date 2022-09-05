class Btn < ApplicationRecord
  belongs_to :kindbtn, optional: true
  # belongs_to :kindbtn

  def author()
    "Emerson"
  end
  def kindbtn_name()
    self.kindbtn.name
  end
  
  def as_json(options={})
    super(
      root: true,
      # only: [:name, :email],
      methods: [:author, :kindbtn_name],
      # include: :kindbtn
      include: {kindbtn: { only: :name}}
    )
  end

end