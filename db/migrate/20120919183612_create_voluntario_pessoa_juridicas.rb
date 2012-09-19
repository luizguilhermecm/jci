class CreateVoluntarioPessoaJuridicas < ActiveRecord::Migration
  def change
    create_table :voluntario_pessoa_juridicas do |t|
      t.string :cnpj_pj
      t.string :razao_social_pj
      t.string :inscricao_estadual_pj
      t.string :email_pj
      t.string :telefone_pj
      t.string :endereco_pj
      t.string :area_atuacao_pj
      t.string :contato_pj
      t.string :outras_infos_pj
      t.boolean :visualizado_pj

      t.timestamps
    end
  end
end
