class VoluntarioPessoaJuridica < ActiveRecord::Base
  attr_accessible :area_atuacao_pj, :cnpj_pj, :contato_pj, :email_pj, :endereco_pj, :inscricao_estadual_pj, :outras_infos_pj, :razao_social_pj, :telefone_pj, :visualizado_pj

  usar_como_cnpj :cnpj_pj

validates  :cnpj_pj, :uniqueness => true
validates  :razao_social_pj, :presence => true
validates  :inscricao_estadual_pj, :uniqueness => true
validates  :email_pj, :uniqueness => true
validates  :telefone_pj, :presence => true
validates  :endereco_pj, :presence => true
validates  :area_atuacao_pj, :presence => true
validates  :contato_pj, :presence => true
#validates  :outras_infos_pj
#validates  :visualizado_pj

  has_many :historicos

end
