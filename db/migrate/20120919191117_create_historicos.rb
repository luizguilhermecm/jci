class CreateHistoricos < ActiveRecord::Migration
  def change
    create_table :historicos do |t|
      t.date :data_hist
      t.string :descricao_hist
      t.references :voluntario_pessoa_fisica
      t.references :voluntario_pessoa_juridica
      t.references :entidade

      t.timestamps
    end
    add_index :historicos, :voluntario_pessoa_fisica_id
    add_index :historicos, :voluntario_pessoa_juridica_id
    add_index :historicos, :entidade_id
  end
end
