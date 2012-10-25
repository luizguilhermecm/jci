class HomeController < ApplicationController

  def index
    @posts = Post.all
  end

  def admin
    render 'admin'
  end

  def logar
    render 'logar'
  end

  def cadastrar
    render 'cadastrar'
  end

  def pendencias
    @entidades = Entidade.where("aprovado_ent = ?", false)
  end

  def noticias
    @posts = Post.all
  end

  def inbox
    @entidades = Entidade.where("visualizado_ent = ?", false )
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.where("visuzalizado_pf = ?", false)
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.where("visualizado_pj = ?", false)
 end
end
