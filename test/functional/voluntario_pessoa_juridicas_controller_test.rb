require 'test_helper'

class VoluntarioPessoaJuridicasControllerTest < ActionController::TestCase
  setup do
    @voluntario_pessoa_juridica = voluntario_pessoa_juridicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voluntario_pessoa_juridicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voluntario_pessoa_juridica" do
    assert_difference('VoluntarioPessoaJuridica.count') do
      post :create, voluntario_pessoa_juridica: { area_atuacao_pj: @voluntario_pessoa_juridica.area_atuacao_pj, cnpj_pj: @voluntario_pessoa_juridica.cnpj_pj, contato_pj: @voluntario_pessoa_juridica.contato_pj, email_pj: @voluntario_pessoa_juridica.email_pj, endereco_pj: @voluntario_pessoa_juridica.endereco_pj, inscricao_estadual_pj: @voluntario_pessoa_juridica.inscricao_estadual_pj, outras_infos_pj: @voluntario_pessoa_juridica.outras_infos_pj, razao_social_pj: @voluntario_pessoa_juridica.razao_social_pj, telefone_pj: @voluntario_pessoa_juridica.telefone_pj, visualizado_pj: @voluntario_pessoa_juridica.visualizado_pj }
    end

    assert_redirected_to voluntario_pessoa_juridica_path(assigns(:voluntario_pessoa_juridica))
  end

  test "should show voluntario_pessoa_juridica" do
    get :show, id: @voluntario_pessoa_juridica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voluntario_pessoa_juridica
    assert_response :success
  end

  test "should update voluntario_pessoa_juridica" do
    put :update, id: @voluntario_pessoa_juridica, voluntario_pessoa_juridica: { area_atuacao_pj: @voluntario_pessoa_juridica.area_atuacao_pj, cnpj_pj: @voluntario_pessoa_juridica.cnpj_pj, contato_pj: @voluntario_pessoa_juridica.contato_pj, email_pj: @voluntario_pessoa_juridica.email_pj, endereco_pj: @voluntario_pessoa_juridica.endereco_pj, inscricao_estadual_pj: @voluntario_pessoa_juridica.inscricao_estadual_pj, outras_infos_pj: @voluntario_pessoa_juridica.outras_infos_pj, razao_social_pj: @voluntario_pessoa_juridica.razao_social_pj, telefone_pj: @voluntario_pessoa_juridica.telefone_pj, visualizado_pj: @voluntario_pessoa_juridica.visualizado_pj }
    assert_redirected_to voluntario_pessoa_juridica_path(assigns(:voluntario_pessoa_juridica))
  end

  test "should destroy voluntario_pessoa_juridica" do
    assert_difference('VoluntarioPessoaJuridica.count', -1) do
      delete :destroy, id: @voluntario_pessoa_juridica
    end

    assert_redirected_to voluntario_pessoa_juridicas_path
  end
end
