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


end
