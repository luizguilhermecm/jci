class Post < ActiveRecord::Base
  attr_accessible :data_not, :data_update_not, :descricao_not, :titulo_not, :photo
  has_attached_file :photo
#validates  :data_not
#validates  :data_update_not
validates  :titulo_not, :presence => true
validates  :descricao_not,  :presence => true

end
