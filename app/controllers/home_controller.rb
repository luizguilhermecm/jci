class HomeController < ApplicationController

  def index
  end

  def show
    render 'admin'
  end

  def teste
    render :text => "huashu"
  end

  def inbox
#    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.all #where("visualizado_ent = ?", false);
    @entidades = Entidade.where("visualizado_ent = ?", false)
 end
end
