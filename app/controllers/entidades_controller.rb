class EntidadesController < ApplicationController
  # GET /entidades
  # GET /entidades.json

  def buscar
    @entidade = Entidade.find_by_cnpj_ent(params[:cnpj_ent])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'entidades/vermeucadastro'
  end

  def busca_publico_ent
    if (params[:publico_adolescentes_ent]) 
      parana = 'SELECT * FROM entidades WHERE publico_adolescentes_ent = ' + params[:publico_adolescentes_ent]
    else
      parana = 'SELECT * FROM entidades WHERE telefone_ent = \'1\'';
    end

    @entidades = Entidade.find_by_sql(parana)
    render 'entidades/index'

  end

  def buscarArray
    #exact
    #@entidades = Entidade.find_all_by_cnpj_ent(params[:cnpj])
    #query with like
    @entidades = Entidade.find(:all, :conditions => ['nome_ent LIKE ? or endereco_ent LIKE ? or site_ent LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
    render 'entidades/index'
  end

  def aprovado
    @entidade = Entidade.find(params[:id])
    @entidade.aprovado_ent = true
    @entidade.save
    redirect_to @entidade
  end

  def visualizado_ent
    @entidade = Entidade.find(params[:id])
    @entidade.visualizado_ent = true
    @entidade.save
    redirect_to @entidade
    #TODO: fazer a verificacao se foi ou nao salvo
  end

  def index
    @entidades = Entidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entidades }
    end
  end

  # GET /entidades/1
  # GET /entidades/1.json
  def show
    @entidade = Entidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entidade }
    end
  end

  def several
    @entidade = Entidade.find(params[:id])
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.all
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.last
    @posts = Post.all
    @entidades = Entidade.all
  end



  def vermeucadastro
    @entidade = Entidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entidade }
    end
  end


  # GET /entidades/new
  # GET /entidades/new.json
  def new
    @entidade = Entidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entidade }
    end
  end

  # GET /entidades/1/edit
  def edit
    @entidade = Entidade.find(params[:id])
  end

  def editarmeucadastro
    @entidade = Entidade.find(params[:id])
  end


  # POST /entidades
  # POST /entidades.json
  def create
    @entidade = Entidade.new(params[:entidade])
    @entidade.visualizado_ent = false
    @entidade.aprovado = false
    respond_to do |format|
      if @entidade.save
        format.html { redirect_to @entidade, notice: 'Entidade was successfully created.' }
        format.json { render json: @entidade, status: :created, location: @entidade }
      else
        format.html { render action: "new" }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entidades/1
  # PUT /entidades/1.json
  def update
    @entidade = Entidade.find(params[:id])

    respond_to do |format|
      if @entidade.update_attributes(params[:entidade])
        format.html { redirect_to @entidade, notice: 'Entidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.json
  def destroy
    @entidade = Entidade.find(params[:id])
    @entidade.destroy

    respond_to do |format|
      format.html { redirect_to entidades_url }
      format.json { head :no_content }
    end
  end
end
