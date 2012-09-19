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

ActiveRecord::Schema.define(:version => 20120919173455) do

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

end
