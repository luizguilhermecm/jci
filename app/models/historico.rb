class Historico < ActiveRecord::Base
  belongs_to :voluntario_pessoa_fisica
  belongs_to :voluntario_pessoa_juridica
  belongs_to :entidade
  attr_accessible :data_hist, :descricao_hist

  validates :descricao_hist, :presence => true
  #validates :data_hist, :presence => true
end
