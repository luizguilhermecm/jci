class VoluntarioPessoaFisica < ActiveRecord::Base
  attr_accessible :atuacao_administrativa_pf, :atuacao_doacao_pf, :atuacao_educacao_pf, :atuacao_juridica_pf, :atuacao_manutencao_pf, :atuacao_outro_pf, :atuacao_recreacao_pf, :atuacao_saude_pf, :como_ficou_sabendo_pf, :cpf_pf, :disp_domManha_pf, :disp_domNoite_pf, :disp_domTarde_pf, :disp_quaManha_pf, :disp_quaNoite_pf, :disp_quaTarde_pf, :disp_quiManha_pf, :disp_quiNoite_pf, :disp_quiTarde_pf, :disp_sabManha_pf, :disp_sabNoite_pf, :disp_sabTarde_pf, :disp_segManha_pf, :disp_segNoite_pf, :disp_segTarde_pf, :disp_sexManha_pf, :disp_sexNoite_pf, :disp_sexTarde_pf, :disp_terManha_pf, :disp_terNoite_pf, :disp_terTarde_pf, :email_pf, :experiencia_pf, :nome_pf, :outras_infos_pf, :publico_adolescentes_pf, :publico_adultos_pf, :publico_criancas_pf, :publico_especiais_pf, :publico_melhor_idade_pf, :publico_outros_pf, :telefone_pf, :visuzalizado_pf

  usar_como_cpf :cpf_pf
validates  :cpf_pf, :uniqueness => true, :presence => true
validates  :nome_pf, :presence => true
validates  :email_pf, :uniqueness => true, :presence => true

  has_many :historicos
/#
validates  :telefone_pf
validates  :como_ficou_sabendo_pf
validates  :experiencia_pf
validates  :publico_criancas_pf
validates  :publico_adultos_pf
validates  :publico_melhor_idade_pf
validates  :publico_adolescentes_pf
validates  :publico_especiais_pf
validates  :publico_outros_pf
validates  :atuacao_juridica_pf
validates  :atuacao_administrativa_pf
validates  :atuacao_recreacao_pf
validates  :atuacao_saude_pf
validates  :atuacao_educacao_pf
validates  :atuacao_manutencao_pf
validates  :atuacao_doacao_pf
validates  :atuacao_outro_pf
validates  :disp_domManha_pf
validates  :disp_domTarde_pf
validates  :disp_domNoite_pf
validates  :disp_sabManha_pf
validates  :disp_sabTarde_pf
validates  :disp_sabNoite_pf
validates  :disp_sexManha_pf
validates  :disp_sexTarde_pf
validates  :disp_sexNoite_pf
validates  :disp_quiManha_pf
validates  :disp_quiTarde_pf
validates  :disp_quiNoite_pf
validates  :disp_quaManha_pf
validates  :disp_quaTarde_pf
validates  :disp_quaNoite_pf
validates  :disp_terManha_pf
validates  :disp_terTarde_pf
validates  :disp_terNoite_pf
validates  :disp_segManha_pf
validates  :disp_segTarde_pf
validates  :disp_segNoite_pf
validates  :outras_infos_pf
validates  :visuzalizado_pf
#/

end
