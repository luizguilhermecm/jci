class SenhorjcisController < ApplicationController
  before_filter :authorize

  def admin
    render 'inbox'
  end

  def pendencias
    @entidades = Entidade.where("aprovado_ent = ?", false)
  end

  #TODO: querys retornando em ordem alfabetica
  def inbox
    @entidades = Entidade.where("visualizado_ent = ?", false )
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.where("visuzalizado_pf = ?", false)
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.where("visualizado_pj = ?", false)
 end
end
# canaldevoluntariosjci@gmail.com
# senhorjci2012
