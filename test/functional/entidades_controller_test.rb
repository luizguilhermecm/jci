require 'test_helper'

class EntidadesControllerTest < ActionController::TestCase
  setup do
    @entidade = entidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entidade" do
    assert_difference('Entidade.count') do
      post :create, entidade: { apoio_estadual_ent: @entidade.apoio_estadual_ent, apoio_federal_ent: @entidade.apoio_federal_ent, apoio_municipal_ent: @entidade.apoio_municipal_ent, apoio_particular_ent: @entidade.apoio_particular_ent, aprovado_ent: @entidade.aprovado_ent, atuacao_administrativa_ent: @entidade.atuacao_administrativa_ent, atuacao_doacao_ent: @entidade.atuacao_doacao_ent, atuacao_educacao_ent: @entidade.atuacao_educacao_ent, atuacao_juridica_ent: @entidade.atuacao_juridica_ent, atuacao_manutencao_ent: @entidade.atuacao_manutencao_ent, atuacao_outro_ent: @entidade.atuacao_outro_ent, atuacao_recreacao_ent: @entidade.atuacao_recreacao_ent, atuacao_saude_ent: @entidade.atuacao_saude_ent, cnpj_ent: @entidade.cnpj_ent, data_fundacao_ent: @entidade.data_fundacao_ent, email_ent: @entidade.email_ent, endereco_ent: @entidade.endereco_ent, horarios_atendimento_ent: @entidade.horarios_atendimento_ent, nome_ent: @entidade.nome_ent, nome_responsavel_ent: @entidade.nome_responsavel_ent, numero_beneficiados_ent: @entidade.numero_beneficiados_ent, publico_adolescentes_ent: @entidade.publico_adolescentes_ent, publico_adultos_ent: @entidade.publico_adultos_ent, publico_criancas_ent: @entidade.publico_criancas_ent, publico_especiais_ent: @entidade.publico_especiais_ent, publico_melhor_idade_ent: @entidade.publico_melhor_idade_ent, publico_outros_ent: @entidade.publico_outros_ent, site_ent: @entidade.site_ent, telefone_ent: @entidade.telefone_ent, visualizado_ent: @entidade.visualizado_ent }
    end

    assert_redirected_to entidade_path(assigns(:entidade))
  end

  test "should show entidade" do
    get :show, id: @entidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entidade
    assert_response :success
  end

  test "should update entidade" do
    put :update, id: @entidade, entidade: { apoio_estadual_ent: @entidade.apoio_estadual_ent, apoio_federal_ent: @entidade.apoio_federal_ent, apoio_municipal_ent: @entidade.apoio_municipal_ent, apoio_particular_ent: @entidade.apoio_particular_ent, aprovado_ent: @entidade.aprovado_ent, atuacao_administrativa_ent: @entidade.atuacao_administrativa_ent, atuacao_doacao_ent: @entidade.atuacao_doacao_ent, atuacao_educacao_ent: @entidade.atuacao_educacao_ent, atuacao_juridica_ent: @entidade.atuacao_juridica_ent, atuacao_manutencao_ent: @entidade.atuacao_manutencao_ent, atuacao_outro_ent: @entidade.atuacao_outro_ent, atuacao_recreacao_ent: @entidade.atuacao_recreacao_ent, atuacao_saude_ent: @entidade.atuacao_saude_ent, cnpj_ent: @entidade.cnpj_ent, data_fundacao_ent: @entidade.data_fundacao_ent, email_ent: @entidade.email_ent, endereco_ent: @entidade.endereco_ent, horarios_atendimento_ent: @entidade.horarios_atendimento_ent, nome_ent: @entidade.nome_ent, nome_responsavel_ent: @entidade.nome_responsavel_ent, numero_beneficiados_ent: @entidade.numero_beneficiados_ent, publico_adolescentes_ent: @entidade.publico_adolescentes_ent, publico_adultos_ent: @entidade.publico_adultos_ent, publico_criancas_ent: @entidade.publico_criancas_ent, publico_especiais_ent: @entidade.publico_especiais_ent, publico_melhor_idade_ent: @entidade.publico_melhor_idade_ent, publico_outros_ent: @entidade.publico_outros_ent, site_ent: @entidade.site_ent, telefone_ent: @entidade.telefone_ent, visualizado_ent: @entidade.visualizado_ent }
    assert_redirected_to entidade_path(assigns(:entidade))
  end

  test "should destroy entidade" do
    assert_difference('Entidade.count', -1) do
      delete :destroy, id: @entidade
    end

    assert_redirected_to entidades_path
  end
end
