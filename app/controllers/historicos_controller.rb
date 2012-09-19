class HistoricosController < ApplicationController
  def create
    if (params[:commit]) == 'vpf'
      @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:voluntario_pessoa_fisica_id])
      @historico = @voluntario_pessoa_fisica.historicos.create(params[:historico])
      redirect_to voluntario_pessoa_fisica_path(@voluntario_pessoa_fisica)
    elsif (params[:commit]) == 'vpj'
      @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:voluntario_pessoa_juridica_id])
      @historico = @voluntario_pessoa_juridica.historicos.create(params[:historico])
      redirect_to voluntario_pessoa_juridica_path(@voluntario_pessoa_juridica)
     elsif (params[:commit]) == 'ent'
      @entidade = Entidade.find(params[:entidade_id])
      @historico = @entidade.historicos.create(params[:historico])
      redirect_to entidade_path(@entidade)
    end
  end
end
