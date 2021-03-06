class VoluntarioPessoaJuridicasController < ApplicationController

#  before_filter :authorize, :except => [:create, :new, :destroy, :vermeucadastro, :editarmeucadastro, :update, :buscar]
  before_filter :authenticate_admin!, :except => [:create, :new, :destroy, :vermeucadastro, :editarmeucadastro, :update, :buscar]



  # GET /voluntario_pessoa_juridicas
  # GET /voluntario_pessoa_juridicas.json
  def buscar
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find_by_cnpj_pj(params[:cnpj_pj])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'voluntario_pessoa_juridicas/vermeucadastro'
  end

  def buscarHistorico
    flag = 1 # Only to verify the first time to add the string OR
    sql = "SELECT * FROM voluntario_pessoa_juridicas WHERE id IN (SELECT DISTINCT(voluntario_pessoa_juridica_id) FROM historicos WHERE lower(descricao_hist) LIKE lower('%"+params[:queryHistorico]+"%')) ORDER BY razao_social_pj"
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.paginate_by_sql(sql, :page => @page, :per_page => 8)

    render 'voluntario_pessoa_juridicas/index'
  end

  def buscarGeral
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.paginate(:page => params[:page], :per_page => 8).find(:all, :conditions => ['cnpj_pj LIKE ? OR lower(contato_pj) LIKE lower(?) OR lower(email_pj) LIKE lower(?) OR lower(endereco_pj) LIKE lower(?) OR inscricao_estadual_pj LIKE ? OR lower(outras_infos_pj) LIKE lower(?) OR lower(razao_social_pj) LIKE lower(?) OR telefone_pj LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"], :order => "razao_social_pj")
    render 'voluntario_pessoa_juridicas/index'
  end

   def index
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.paginate(:page => params[:page], :per_page => 8).find(:all, :order => "razao_social_pj")
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voluntario_pessoa_juridicas }
  end
end

  def visualizado_pj
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])
    @voluntario_pessoa_juridica.visualizado_pj = true
    @voluntario_pessoa_juridica.save
    redirect_to @voluntario_pessoa_juridica
  end

  # GET /voluntario_pessoa_juridicas/1
  # GET /voluntario_pessoa_juridicas/1.json
  def show
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voluntario_pessoa_juridica }
    end
  end

  def vermeucadastro
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voluntario_pessoa_juridica }
    end
  end

  # GET /voluntario_pessoa_juridicas/new
  # GET /voluntario_pessoa_juridicas/new.json
  def new
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voluntario_pessoa_juridica }
    end
  end

  # GET /voluntario_pessoa_juridicas/1/edit
  def edit
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])
  end

  def editarmeucadastro
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])
  end


  # POST /voluntario_pessoa_juridicas
  # POST /voluntario_pessoa_juridicas.json
  def create
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.new(params[:voluntario_pessoa_juridica])
    @voluntario_pessoa_juridica.visualizado_pj = false
    respond_to do |format|
      if @voluntario_pessoa_juridica.save
        format.html { redirect_to :action => "vermeucadastro", :id => @voluntario_pessoa_juridica, notice: 'Voluntario pessoa juridica was successfully created.' }
        format.json { render json: @voluntario_pessoa_juridica, status: :created, location: @voluntario_pessoa_juridica }
      else
        format.html { render action: "new" }
        format.json { render json: @voluntario_pessoa_juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voluntario_pessoa_juridicas/1
  # PUT /voluntario_pessoa_juridicas/1.json
  def update
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])

    respond_to do |format|
      if @voluntario_pessoa_juridica.update_attributes(params[:voluntario_pessoa_juridica])
        format.html { redirect_to :action => "vermeucadastro", :id => @voluntario_pessoa_juridica, notice: 'Voluntario pessoa juridica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voluntario_pessoa_juridica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntario_pessoa_juridicas/1
  # DELETE /voluntario_pessoa_juridicas/1.json
  def destroy
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.find(params[:id])
    @voluntario_pessoa_juridica.destroy

    respond_to do |format|
      format.html { redirect_to voluntario_pessoa_juridicas_url }
      format.json { head :no_content }
    end
  end
end
