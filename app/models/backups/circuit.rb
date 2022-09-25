class Circuit < ApplicationRecord


  belongs_to :btn, optional: true
  belongs_to :dev, optional: true

  # def btn()
  #   self.btn
  # end
  # # def kindbtn_name()
  # #   self.btn.kindbtn.name
  # # end
  
  # def as_json(options={})
  #   super(
  #     # root: true,
  #     # only: :sttus,
  #     include: [:btn, :dev]
  #     # include: {
  #     #   btn: {only: :sttus},  
  #     #   dev: {only: :sttus}
  #     # }

  #     # methods: [:btn ]
  #     # include: {kindbtn: { only: :name}}
  #     # only: [:name, :email],
  #   )
  # end

end
