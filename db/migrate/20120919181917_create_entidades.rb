class CreateEntidades < ActiveRecord::Migration
  def change
    create_table :entidades do |t|
      t.string :cnpj_ent
      t.string :nome_ent
      t.string :endereco_ent
      t.string :nome_responsavel_ent
      t.string :email_ent
      t.string :telefone_ent
      t.string :site_ent
      t.date :data_fundacao_ent
      t.boolean :publico_criancas_ent
      t.boolean :publico_adultos_ent
      t.boolean :publico_melhor_idade_ent
      t.boolean :publico_adolescentes_ent
      t.boolean :publico_especiais_ent
      t.string :publico_outros_ent
      t.integer :numero_beneficiados_ent
      t.boolean :atuacao_juridica_ent
      t.boolean :atuacao_administrativa_ent
      t.boolean :atuacao_recreacao_ent
      t.boolean :atuacao_saude_ent
      t.boolean :atuacao_educacao_ent
      t.boolean :atuacao_manutencao_ent
      t.boolean :atuacao_doacao_ent
      t.string :atuacao_outro_ent
      t.boolean :apoio_municipal_ent
      t.boolean :apoio_estadual_ent
      t.boolean :apoio_federal_ent
      t.boolean :apoio_particular_ent
      t.string :horarios_atendimento_ent
      t.boolean :visualizado_ent
      t.boolean :aprovado_ent

      t.timestamps
    end
  end
end
