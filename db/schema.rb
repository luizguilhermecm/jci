# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120919185222) do

  create_table "entidades", :force => true do |t|
    t.string   "cnpj_ent"
    t.string   "nome_ent"
    t.string   "endereco_ent"
    t.string   "nome_responsavel_ent"
    t.string   "email_ent"
    t.string   "telefone_ent"
    t.string   "site_ent"
    t.date     "data_fundacao_ent"
    t.boolean  "publico_criancas_ent"
    t.boolean  "publico_adultos_ent"
    t.boolean  "publico_melhor_idade_ent"
    t.boolean  "publico_adolescentes_ent"
    t.boolean  "publico_especiais_ent"
    t.string   "publico_outros_ent"
    t.integer  "numero_beneficiados_ent"
    t.boolean  "atuacao_juridica_ent"
    t.boolean  "atuacao_administrativa_ent"
    t.boolean  "atuacao_recreacao_ent"
    t.boolean  "atuacao_saude_ent"
    t.boolean  "atuacao_educacao_ent"
    t.boolean  "atuacao_manutencao_ent"
    t.boolean  "atuacao_doacao_ent"
    t.string   "atuacao_outro_ent"
    t.boolean  "apoio_municipal_ent"
    t.boolean  "apoio_estadual_ent"
    t.boolean  "apoio_federal_ent"
    t.boolean  "apoio_particular_ent"
    t.string   "horarios_atendimento_ent"
    t.boolean  "visualizado_ent"
    t.boolean  "aprovado_ent"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "posts", :force => true do |t|
    t.date     "data_not"
    t.date     "data_update_not"
    t.string   "titulo_not"
    t.text     "descricao_not"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "voluntario_pessoa_fisicas", :force => true do |t|
    t.string   "cpf_pf"
    t.string   "nome_pf"
    t.string   "email_pf"
    t.string   "telefone_pf"
    t.text     "como_ficou_sabendo_pf"
    t.boolean  "experiencia_pf"
    t.boolean  "publico_criancas_pf"
    t.boolean  "publico_adultos_pf"
    t.boolean  "publico_melhor_idade_pf"
    t.boolean  "publico_adolescentes_pf"
    t.boolean  "publico_especiais_pf"
    t.string   "publico_outros_pf"
    t.boolean  "atuacao_juridica_pf"
    t.boolean  "atuacao_administrativa_pf"
    t.boolean  "atuacao_recreacao_pf"
    t.boolean  "atuacao_saude_pf"
    t.boolean  "atuacao_educacao_pf"
    t.boolean  "atuacao_manutencao_pf"
    t.boolean  "atuacao_doacao_pf"
    t.string   "atuacao_outro_pf"
    t.boolean  "disp_domManha_pf"
    t.boolean  "disp_domTarde_pf"
    t.boolean  "disp_domNoite_pf"
    t.boolean  "disp_sabManha_pf"
    t.boolean  "disp_sabTarde_pf"
    t.boolean  "disp_sabNoite_pf"
    t.boolean  "disp_sexManha_pf"
    t.boolean  "disp_sexTarde_pf"
    t.boolean  "disp_sexNoite_pf"
    t.boolean  "disp_quiManha_pf"
    t.boolean  "disp_quiTarde_pf"
    t.boolean  "disp_quiNoite_pf"
    t.boolean  "disp_quaManha_pf"
    t.boolean  "disp_quaTarde_pf"
    t.boolean  "disp_quaNoite_pf"
    t.boolean  "disp_terManha_pf"
    t.boolean  "disp_terTarde_pf"
    t.boolean  "disp_terNoite_pf"
    t.boolean  "disp_segManha_pf"
    t.boolean  "disp_segTarde_pf"
    t.boolean  "disp_segNoite_pf"
    t.text     "outras_infos_pf"
    t.boolean  "visuzalizado_pf"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "voluntario_pessoa_juridicas", :force => true do |t|
    t.string   "cnpj_pj"
    t.string   "razao_social_pj"
    t.string   "inscricao_estadual_pj"
    t.string   "email_pj"
    t.string   "telefone_pj"
    t.string   "endereco_pj"
    t.string   "area_atuacao_pj"
    t.string   "contato_pj"
    t.string   "outras_infos_pj"
    t.boolean  "visualizado_pj"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
