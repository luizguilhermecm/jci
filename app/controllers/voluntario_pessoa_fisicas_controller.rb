class VoluntarioPessoaFisicasController < ApplicationController
  # GET /voluntario_pessoa_fisicas
  # GET /voluntario_pessoa_fisicas.json


  #def buscarArray
    #exact
    #@entidades = Entidade.find_all_by_cnpj_ent(params[:cnpj])
    #query with like
    #@entidades = Entidade.find(:all, :conditions => ['nome_ent LIKE ? or endereco_ent LIKE ? or site_ent LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
    #render 'entidades/index'
  #end

def busca_disponibilidade_horario
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.where("disp_domManha_pf = ?", params[:disp_dom])
  render 'voluntario_pessoa_fisicas/index'
end

def busca_por_afinidade
    flag = 1 # Only to verify the first time to add the string OR
    parana = 'SELECT * FROM voluntario_pessoa_fisicas WHERE ';

    if (params[:publico_adolescentes_pf])
        parana = parana + ' publico_adolescentes_pf = ' + params[:publico_adolescentes_pf] + ' '
        flag = 0
    end

    if (params[:publico_criancas_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_criancas_pf = ' + params[:publico_criancas_pf];
        flag = 0;
      else
        parana = parana + ' publico_criancas_pf = ' + params[:publico_criancas_pf];
        flag = 0        
      end
    end

    if (params[:publico_adultos_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_adultos_pf = ' + params[:publico_adultos_pf];
        flag = 0;
      else
        parana = parana + ' publico_adultos_pf = ' + params[:publico_adultos_pf];
        flag = 0
      end
    end

    if (params[:publico_melhor_idade_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_melhor_idade_pf = ' + params[:publico_melhor_idade_pf];
        flag = 0;
      else
        parana = parana + ' publico_melhor_idade_pf = ' + params[:publico_melhor_idade_pf];
        flag = 0
      end
    end

    if (params[:publico_especiais_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_especiais_pf = ' + params[:publico_especiais_pf];
        flag = 0;
      else
        parana = parana + ' publico_especiais_pf = ' + params[:publico_especiais_pf];
        flag = 0
      end
    end

    /#
    if (params[:publico_outros_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_outros_pf = ' + params[:publico_outros_pf];
        flag = 0;
      else
        parana = parana + ' publico_outros_pf = ' + params[:publico_outros_pf];
        flag = 0
      end
    end
    #/
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end

  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.find_by_sql(parana)
  
  render 'voluntario_pessoa_fisicas/mostrar'
end

def buscar
  @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find_by_cpf_pf(params[:cpf])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'voluntario_pessoa_fisicas/vermeucadastro'
  end

  def index
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.all.group_by{|vpf| vpf.nome_pf[0]}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voluntario_pessoa_fisicas }
    end
  end

  def visualizado_pf
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])
    @voluntario_pessoa_fisica.visuzalizado_pf = true
    @voluntario_pessoa_fisica.save
    redirect_to @voluntario_pessoa_fisica
  end

  # GET /voluntario_pessoa_fisicas/1
  # GET /voluntario_pessoa_fisicas/1.json
  def show
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voluntario_pessoa_fisica }
    end
  end

  def vermeucadastro
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voluntario_pessoa_fisica }
    end
  end


  # GET /voluntario_pessoa_fisicas/new
  # GET /voluntario_pessoa_fisicas/new.json
  def new
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voluntario_pessoa_fisica }
    end
  end

  # GET /voluntario_pessoa_fisicas/1/edit
  def edit
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])
  end

  def editarmeucadastro
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])
  end


  # POST /voluntario_pessoa_fisicas
  # POST /voluntario_pessoa_fisicas.json
  def create
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.new(params[:voluntario_pessoa_fisica])
    @voluntario_pessoa_fisica.visuzalizado_pf = false
    respond_to do |format|
      if @voluntario_pessoa_fisica.save
        format.html { redirect_to @voluntario_pessoa_fisica, notice: 'Voluntario pessoa fisica was successfully created.' }
        format.json { render json: @voluntario_pessoa_fisica, status: :created, location: @voluntario_pessoa_fisica }
      else
        format.html { render action: "new" }
        format.json { render json: @voluntario_pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voluntario_pessoa_fisicas/1
  # PUT /voluntario_pessoa_fisicas/1.json
  def update
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])

    respond_to do |format|
      if @voluntario_pessoa_fisica.update_attributes(params[:voluntario_pessoa_fisica])
        format.html { redirect_to @voluntario_pessoa_fisica, notice: 'Voluntario pessoa fisica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voluntario_pessoa_fisica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voluntario_pessoa_fisicas/1
  # DELETE /voluntario_pessoa_fisicas/1.json
  def destroy
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find(params[:id])
    @voluntario_pessoa_fisica.destroy

    respond_to do |format|
      format.html { redirect_to voluntario_pessoa_fisicas_url }
      format.json { head :no_content }
    end
  end
end
