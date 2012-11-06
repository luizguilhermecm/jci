class HomeController < ApplicationController
  def index
    @posts = Post.paginate(:order => 'created_at DESC', :page => params[:page], :per_page => 1)
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

  def contato
    render 'contato'
  end

  def sobre
    render 'sobre'
  end
end

#FIX: excluir metodos nao usados em todos os controllers
