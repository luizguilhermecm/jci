class EntidadesController < ApplicationController
    before_filter :authorize, :except => [:create, :new, :destroy, :vermeucadastro, :editarmeucadastro, :update, :buscar]

  # GET /entidades
  # GET /entidades.json

  def buscar
    @entidade = Entidade.find_by_cnpj_ent(params[:cnpj_ent])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'entidades/vermeucadastro'
  end

  def cruzar_pf_ent
    @entidades = Entidade.find_by_sql("SELECT  DISTINCT  entidades.id, cnpj_ent, nome_ent, endereco_ent, nome_responsavel_ent, email_ent, 
                                                         telefone_ent, site_ent, data_fundacao_ent, publico_criancas_ent, 
                                                         publico_adultos_ent, publico_melhor_idade_ent, publico_adolescentes_ent, 
                                                         publico_especiais_ent, publico_outros_ent, numero_beneficiados_ent, 
                                                         atuacao_juridica_ent, atuacao_administrativa_ent, atuacao_recreacao_ent, 
                                                         atuacao_saude_ent, atuacao_educacao_ent, atuacao_manutencao_ent, 
                                                         atuacao_doacao_ent, atuacao_outro_ent, apoio_municipal_ent, apoio_estadual_ent, 
                                                         apoio_federal_ent, apoio_particular_ent, horarios_atendimento_ent, 
                                                         visualizado_ent, aprovado_ent, entidades.created_at, entidades.updated_at
                                                  FROM voluntario_pessoa_fisicas
                                                  INNER JOIN entidades ON ((publico_criancas_pf = publico_criancas_ent) AND publico_criancas_pf = 'true')
                                                  OR ((publico_adultos_pf = publico_adultos_ent) AND publico_adultos_pf = 'true')
                                                  OR ((publico_melhor_idade_pf = publico_melhor_idade_ent) AND publico_melhor_idade_pf = 'true')
                                                  OR ((publico_adolescentes_pf = publico_adolescentes_ent) AND publico_adolescentes_pf = 'true') 
                                                  OR ((publico_especiais_pf = publico_especiais_ent) AND publico_especiais_pf = 'true')
                                                  OR ((atuacao_juridica_pf = atuacao_juridica_ent) AND atuacao_juridica_pf = 'true')
                                                  OR ((atuacao_administrativa_pf = atuacao_administrativa_ent) AND atuacao_administrativa_pf = 'true')
                                                  OR ((atuacao_recreacao_pf = atuacao_recreacao_ent) AND atuacao_recreacao_pf = 'true')
                                                  OR ((atuacao_saude_pf = atuacao_saude_ent) AND atuacao_saude_pf = 'true')
                                                  OR ((atuacao_educacao_pf = atuacao_educacao_ent) AND atuacao_educacao_pf = 'true')
                                                  OR ((atuacao_manutencao_pf = atuacao_manutencao_ent) AND atuacao_manutencao_pf = 'true')
                                                  OR ((atuacao_doacao_pf = atuacao_doacao_ent) AND atuacao_doacao_pf = 'true')"
    )
    render 'entidades/index'
  end

  def buscarHistorico
    flag = 1 # Only to verify the first time to add the string OR
    @entidades = Entidade.find_by_sql("SELECT * FROM entidades WHERE id IN (SELECT DISTINCT(entidade_id) FROM historicos WHERE lower(descricao_hist) LIKE lower('%"+params[:queryHistorico]+"%'))");
    render 'entidades/index'
  end

  def busca_por_apoio
    flag = 1 # Only to verify the first time to add the string OR
    parana = 'SELECT * FROM entidades WHERE ';

    if (params[:apoio_estadual_ent])
        parana = parana + ' apoio_estadual_ent = ' + params[:apoio_estadual_ent] + ' '
        flag = 0
    end

    if (params[:apoio_federal_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' apoio_federal_ent = ' + params[:apoio_federal_ent];
        flag = 0;
      else
        parana = parana + ' apoio_federal_ent = ' + params[:apoio_federal_ent];
        flag = 0        
      end
    end

    if (params[:apoio_particular_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' apoio_particular_ent = ' + params[:apoio_particular_ent];
        flag = 0;
      else
        parana = parana + ' apoio_particular_ent = ' + params[:apoio_particular_ent];
        flag = 0
      end
    end

    if (params[:apoio_municipal_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' apoio_municipal_ent = ' + params[:apoio_municipal_ent];
        flag = 0;
      else
        parana = parana + ' apoio_municipal_ent = ' + params[:apoio_municipal_ent];
        flag = 0
      end
    end
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end

    @entidades = Entidade.find_by_sql(parana)
    render 'entidades/index'

  end

  def busca_por_atuacao
    flag = 1 # Only to verify the first time to add the string OR
    parana = 'SELECT * FROM entidades WHERE ';

    if (params[:atuacao_juridica_ent])
        parana = parana + ' atuacao_juridica_ent = ' + params[:atuacao_juridica_ent] + ' '
        flag = 0
    end

    if (params[:atuacao_administrativa_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_administrativa_ent = ' + params[:atuacao_administrativa_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_administrativa_ent = ' + params[:atuacao_administrativa_ent];
        flag = 0        
      end
    end

    if (params[:atuacao_recreacao_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_recreacao_ent = ' + params[:atuacao_recreacao_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_recreacao_ent = ' + params[:atuacao_recreacao_ent];
        flag = 0
      end
    end

    if (params[:atuacao_saude_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_saude_ent = ' + params[:atuacao_saude_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_saude_ent = ' + params[:atuacao_saude_ent];
        flag = 0
      end
    end

    if (params[:atuacao_educacao_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_educacao_ent = ' + params[:atuacao_educacao_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_educacao_ent = ' + params[:atuacao_educacao_ent];
        flag = 0
      end
    end

    if (params[:atuacao_manutencao_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_manutencao_ent = ' + params[:atuacao_manutencao_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_manutencao_ent = ' + params[:atuacao_manutencao_ent];
        flag = 0
      end
    end

    if (params[:atuacao_doacao_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_doacao_ent = ' + params[:atuacao_doacao_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_doacao_ent = ' + params[:atuacao_doacao_ent];
        flag = 0
      end
    end

    if (params[:atuacao_outro_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_outro_ent = ' + params[:atuacao_outro_ent];
        flag = 0;
      else
        parana = parana + ' atuacao_outro_ent = ' + params[:atuacao_outro_ent];
        flag = 0
      end
    end
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end

    @entidades = Entidade.find_by_sql(parana)
    render 'entidades/index'
  end

  def busca_publico_ent
    flag = 1 # Only to verify the first time to add the string OR
     parana = 'SELECT * FROM entidades WHERE ';

    if (params[:publico_adolescentes_ent])
        parana = parana + ' publico_adolescentes_ent = ' + params[:publico_adolescentes_ent] + ' '
        flag = 0
    end

    if (params[:publico_criancas_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_criancas_ent = ' + params[:publico_criancas_ent];
        flag = 0;
      else
        parana = parana + ' publico_criancas_ent = ' + params[:publico_criancas_ent];
        flag = 0        
      end
    end

    if (params[:publico_adultos_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_adultos_ent = ' + params[:publico_adultos_ent];
        flag = 0;
      else
        parana = parana + ' publico_adultos_ent = ' + params[:publico_adultos_ent];
        flag = 0
      end
    end

    if (params[:publico_melhor_idade_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_melhor_idade_ent = ' + params[:publico_melhor_idade_ent];
        flag = 0;
      else
        parana = parana + ' publico_melhor_idade_ent = ' + params[:publico_melhor_idade_ent];
        flag = 0
      end
    end

    if (params[:publico_especiais_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_especiais_ent = ' + params[:publico_especiais_ent];
        flag = 0;
      else
        parana = parana + ' publico_especiais_ent = ' + params[:publico_especiais_ent];
        flag = 0
      end
    end

    if (params[:publico_outros_ent])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' publico_outros_ent = ' + params[:publico_outros_ent];
        flag = 0;
      else
        parana = parana + ' publico_outros_ent = ' + params[:publico_outros_ent];
        flag = 0
      end
    end
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end

    @entidades = Entidade.find_by_sql(parana)
    render 'entidades/index'

  end

  def buscarArray
    #exact
    #@entidades = Entidade.find_all_by_cnpj_ent(params[:cnpj])
    #query with like
    @entidades = Entidade.find(:all, :conditions => ['nome_ent LIKE ? or endereco_ent LIKE ? or site_ent LIKE ? or cnpj_ent LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
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
    @entidades = Entidade.find(:all, :order =>"nome_ent")
    #@entidades = Entidade.all.group_by{|ent| ent.nome_ent[0]}

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
    @entidade.aprovado_ent = false
    respond_to do |format|
      if @entidade.save
        format.html { redirect_to :action => "vermeucadastro", :id => @entidade, notice: 'Entidade was successfully created.' }
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
        format.html { redirect_to :action => "vermeucadastro", :id => @entidade, notice: 'Entidade was successfully updated.' }
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