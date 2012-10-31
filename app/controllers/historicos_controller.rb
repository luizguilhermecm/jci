class HistoricosController < ApplicationController
  def create
    if (params[:commit]) == "Historico PF"
      @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:voluntario_pessoa_fisica_id])
      @historico = @voluntario_pessoa_fisica.historicos.create(params[:historico])
      redirect_to voluntario_pessoa_fisica_path(@voluntario_pessoa_fisica)
    elsif (params[:commit]) == 'Historico PJ'
      @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:voluntario_pessoa_juridica_id])
      @historico = @voluntario_pessoa_juridica.historicos.create(params[:historico])
      redirect_to voluntario_pessoa_juridica_path(@voluntario_pessoa_juridica)
     elsif (params[:commit]) == 'Historico Entidade'
      @entidade = Entidade.find(params[:entidade_id])
      @historico = @entidade.historicos.create(params[:historico])
      redirect_to entidade_path(@entidade)
    end
  end

  def destroy_ent
    @entidade = Entidade.find(params[:entidade_id])
    @historico = @entidade.historicos.find(params[:id])
    @historico.destroy
    redirect_to entidade_path(@entidade)
  end

  def destroy_pf
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:voluntario_pessoa_fisica_id])
    @historico = @voluntario_pessoa_fisica.historicos.find(params[:id])
    @historico.destroy
    redirect_to voluntario_pessoa_fisica_path(@voluntario_pessoa_fisica)
  end

  def destroy_pj
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:voluntario_pessoa_juridica_id])
    @historico = @voluntario_pessoa_juridica.historicos.find(params[:id])
    @historico.destroy
    redirect_to voluntario_pessoa_fisica_path(@voluntario_pessoa_juridica)
  end
end