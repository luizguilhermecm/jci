class CreateVoluntarioPessoaFisicas < ActiveRecord::Migration
  def change
    create_table :voluntario_pessoa_fisicas do |t|
      t.string :cpf_pf
      t.string :nome_pf
      t.string :email_pf
      t.string :telefone_pf
      t.text :como_ficou_sabendo_pf
      t.boolean :experiencia_pf
      t.boolean :publico_criancas_pf
      t.boolean :publico_adultos_pf
      t.boolean :publico_melhor_idade_pf
      t.boolean :publico_adolescentes_pf
      t.boolean :publico_especiais_pf
      t.string :publico_outros_pf
      t.boolean :atuacao_juridica_pf
      t.boolean :atuacao_administrativa_pf
      t.boolean :atuacao_recreacao_pf
      t.boolean :atuacao_saude_pf
      t.boolean :atuacao_educacao_pf
      t.boolean :atuacao_manutencao_pf
      t.boolean :atuacao_doacao_pf
      t.string :atuacao_outro_pf
      t.boolean :disp_domManha_pf
      t.boolean :disp_domTarde_pf
      t.boolean :disp_domNoite_pf
      t.boolean :disp_sabManha_pf
      t.boolean :disp_sabTarde_pf
      t.boolean :disp_sabNoite_pf
      t.boolean :disp_sexManha_pf
      t.boolean :disp_sexTarde_pf
      t.boolean :disp_sexNoite_pf
      t.boolean :disp_quiManha_pf
      t.boolean :disp_quiTarde_pf
      t.boolean :disp_quiNoite_pf
      t.boolean :disp_quaManha_pf
      t.boolean :disp_quaTarde_pf
      t.boolean :disp_quaNoite_pf
      t.boolean :disp_terManha_pf
      t.boolean :disp_terTarde_pf
      t.boolean :disp_terNoite_pf
      t.boolean :disp_segManha_pf
      t.boolean :disp_segTarde_pf
      t.boolean :disp_segNoite_pf
      t.text :outras_infos_pf
      t.boolean :visuzalizado_pf

      t.timestamps
    end
  end
end
