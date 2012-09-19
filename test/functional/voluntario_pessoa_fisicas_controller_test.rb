require 'test_helper'

class VoluntarioPessoaFisicasControllerTest < ActionController::TestCase
  setup do
    @voluntario_pessoa_fisica = voluntario_pessoa_fisicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voluntario_pessoa_fisicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voluntario_pessoa_fisica" do
    assert_difference('VoluntarioPessoaFisica.count') do
      post :create, voluntario_pessoa_fisica: { atuacao_administrativa_pf: @voluntario_pessoa_fisica.atuacao_administrativa_pf, atuacao_doacao_pf: @voluntario_pessoa_fisica.atuacao_doacao_pf, atuacao_educacao_pf: @voluntario_pessoa_fisica.atuacao_educacao_pf, atuacao_juridica_pf: @voluntario_pessoa_fisica.atuacao_juridica_pf, atuacao_manutencao_pf: @voluntario_pessoa_fisica.atuacao_manutencao_pf, atuacao_outro_pf: @voluntario_pessoa_fisica.atuacao_outro_pf, atuacao_recreacao_pf: @voluntario_pessoa_fisica.atuacao_recreacao_pf, atuacao_saude_pf: @voluntario_pessoa_fisica.atuacao_saude_pf, como_ficou_sabendo_pf: @voluntario_pessoa_fisica.como_ficou_sabendo_pf, cpf_pf: @voluntario_pessoa_fisica.cpf_pf, disp_domManha_pf: @voluntario_pessoa_fisica.disp_domManha_pf, disp_domNoite_pf: @voluntario_pessoa_fisica.disp_domNoite_pf, disp_domTarde_pf: @voluntario_pessoa_fisica.disp_domTarde_pf, disp_quaManha_pf: @voluntario_pessoa_fisica.disp_quaManha_pf, disp_quaNoite_pf: @voluntario_pessoa_fisica.disp_quaNoite_pf, disp_quaTarde_pf: @voluntario_pessoa_fisica.disp_quaTarde_pf, disp_quiManha_pf: @voluntario_pessoa_fisica.disp_quiManha_pf, disp_quiNoite_pf: @voluntario_pessoa_fisica.disp_quiNoite_pf, disp_quiTarde_pf: @voluntario_pessoa_fisica.disp_quiTarde_pf, disp_sabManha_pf: @voluntario_pessoa_fisica.disp_sabManha_pf, disp_sabNoite_pf: @voluntario_pessoa_fisica.disp_sabNoite_pf, disp_sabTarde_pf: @voluntario_pessoa_fisica.disp_sabTarde_pf, disp_segManha_pf: @voluntario_pessoa_fisica.disp_segManha_pf, disp_segNoite_pf: @voluntario_pessoa_fisica.disp_segNoite_pf, disp_segTarde_pf: @voluntario_pessoa_fisica.disp_segTarde_pf, disp_sexManha_pf: @voluntario_pessoa_fisica.disp_sexManha_pf, disp_sexNoite_pf: @voluntario_pessoa_fisica.disp_sexNoite_pf, disp_sexTarde_pf: @voluntario_pessoa_fisica.disp_sexTarde_pf, disp_terManha_pf: @voluntario_pessoa_fisica.disp_terManha_pf, disp_terNoite_pf: @voluntario_pessoa_fisica.disp_terNoite_pf, disp_terTarde_pf: @voluntario_pessoa_fisica.disp_terTarde_pf, email_pf: @voluntario_pessoa_fisica.email_pf, experiencia_pf: @voluntario_pessoa_fisica.experiencia_pf, nome_pf: @voluntario_pessoa_fisica.nome_pf, outras_infos_pf: @voluntario_pessoa_fisica.outras_infos_pf, publico_adolescentes_pf: @voluntario_pessoa_fisica.publico_adolescentes_pf, publico_adultos_pf: @voluntario_pessoa_fisica.publico_adultos_pf, publico_criancas_pf: @voluntario_pessoa_fisica.publico_criancas_pf, publico_especiais_pf: @voluntario_pessoa_fisica.publico_especiais_pf, publico_melhor_idade_pf: @voluntario_pessoa_fisica.publico_melhor_idade_pf, publico_outros_pf: @voluntario_pessoa_fisica.publico_outros_pf, telefone_pf: @voluntario_pessoa_fisica.telefone_pf, visuzalizado_pf: @voluntario_pessoa_fisica.visuzalizado_pf }
    end

    assert_redirected_to voluntario_pessoa_fisica_path(assigns(:voluntario_pessoa_fisica))
  end

  test "should show voluntario_pessoa_fisica" do
    get :show, id: @voluntario_pessoa_fisica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voluntario_pessoa_fisica
    assert_response :success
  end

  test "should update voluntario_pessoa_fisica" do
    put :update, id: @voluntario_pessoa_fisica, voluntario_pessoa_fisica: { atuacao_administrativa_pf: @voluntario_pessoa_fisica.atuacao_administrativa_pf, atuacao_doacao_pf: @voluntario_pessoa_fisica.atuacao_doacao_pf, atuacao_educacao_pf: @voluntario_pessoa_fisica.atuacao_educacao_pf, atuacao_juridica_pf: @voluntario_pessoa_fisica.atuacao_juridica_pf, atuacao_manutencao_pf: @voluntario_pessoa_fisica.atuacao_manutencao_pf, atuacao_outro_pf: @voluntario_pessoa_fisica.atuacao_outro_pf, atuacao_recreacao_pf: @voluntario_pessoa_fisica.atuacao_recreacao_pf, atuacao_saude_pf: @voluntario_pessoa_fisica.atuacao_saude_pf, como_ficou_sabendo_pf: @voluntario_pessoa_fisica.como_ficou_sabendo_pf, cpf_pf: @voluntario_pessoa_fisica.cpf_pf, disp_domManha_pf: @voluntario_pessoa_fisica.disp_domManha_pf, disp_domNoite_pf: @voluntario_pessoa_fisica.disp_domNoite_pf, disp_domTarde_pf: @voluntario_pessoa_fisica.disp_domTarde_pf, disp_quaManha_pf: @voluntario_pessoa_fisica.disp_quaManha_pf, disp_quaNoite_pf: @voluntario_pessoa_fisica.disp_quaNoite_pf, disp_quaTarde_pf: @voluntario_pessoa_fisica.disp_quaTarde_pf, disp_quiManha_pf: @voluntario_pessoa_fisica.disp_quiManha_pf, disp_quiNoite_pf: @voluntario_pessoa_fisica.disp_quiNoite_pf, disp_quiTarde_pf: @voluntario_pessoa_fisica.disp_quiTarde_pf, disp_sabManha_pf: @voluntario_pessoa_fisica.disp_sabManha_pf, disp_sabNoite_pf: @voluntario_pessoa_fisica.disp_sabNoite_pf, disp_sabTarde_pf: @voluntario_pessoa_fisica.disp_sabTarde_pf, disp_segManha_pf: @voluntario_pessoa_fisica.disp_segManha_pf, disp_segNoite_pf: @voluntario_pessoa_fisica.disp_segNoite_pf, disp_segTarde_pf: @voluntario_pessoa_fisica.disp_segTarde_pf, disp_sexManha_pf: @voluntario_pessoa_fisica.disp_sexManha_pf, disp_sexNoite_pf: @voluntario_pessoa_fisica.disp_sexNoite_pf, disp_sexTarde_pf: @voluntario_pessoa_fisica.disp_sexTarde_pf, disp_terManha_pf: @voluntario_pessoa_fisica.disp_terManha_pf, disp_terNoite_pf: @voluntario_pessoa_fisica.disp_terNoite_pf, disp_terTarde_pf: @voluntario_pessoa_fisica.disp_terTarde_pf, email_pf: @voluntario_pessoa_fisica.email_pf, experiencia_pf: @voluntario_pessoa_fisica.experiencia_pf, nome_pf: @voluntario_pessoa_fisica.nome_pf, outras_infos_pf: @voluntario_pessoa_fisica.outras_infos_pf, publico_adolescentes_pf: @voluntario_pessoa_fisica.publico_adolescentes_pf, publico_adultos_pf: @voluntario_pessoa_fisica.publico_adultos_pf, publico_criancas_pf: @voluntario_pessoa_fisica.publico_criancas_pf, publico_especiais_pf: @voluntario_pessoa_fisica.publico_especiais_pf, publico_melhor_idade_pf: @voluntario_pessoa_fisica.publico_melhor_idade_pf, publico_outros_pf: @voluntario_pessoa_fisica.publico_outros_pf, telefone_pf: @voluntario_pessoa_fisica.telefone_pf, visuzalizado_pf: @voluntario_pessoa_fisica.visuzalizado_pf }
    assert_redirected_to voluntario_pessoa_fisica_path(assigns(:voluntario_pessoa_fisica))
  end

  test "should destroy voluntario_pessoa_fisica" do
    assert_difference('VoluntarioPessoaFisica.count', -1) do
      delete :destroy, id: @voluntario_pessoa_fisica
    end

    assert_redirected_to voluntario_pessoa_fisicas_path
  end
end
