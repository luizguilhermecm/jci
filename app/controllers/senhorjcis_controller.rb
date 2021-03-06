class SenhorjcisController < ApplicationController
#  before_filter :authorize
before_filter :authenticate_admin!

  def admin
    render 'inbox'
  end

  def novoAdministrador
    render 'novoAdministrador'
  end

  def adicionarAdministrador
    login = params[:login]
    sql = "insert into admins (email, created_at, updated_at) VALUES ('"+login+"', now(), now())"
    ActiveRecord::Base.connection.execute(sql)
    redirect_to inbox_senhorjcis_path
  end

  def pendencias
    @entidades = Entidade.where("aprovado_ent = ?", false).paginate(:page => params[:page], :per_page => 10)
  end

  #TODO: querys retornando em ordem alfabetica
  def inbox
    @entidades = Entidade.where("visualizado_ent = ?", false ).order("nome_ent")
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.where("visuzalizado_pf = ?", false).order("nome_pf")
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.where("visualizado_pj = ?", false).order("razao_social_pj")
 end
end
# canaldevoluntariosjci@gmail.com
# senhorjci2012
