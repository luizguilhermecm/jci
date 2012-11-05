class VoluntarioPessoaFisicasController < ApplicationController

  before_filter :authorize, :except => [:create, :new, :destroy, :vermeucadastro, :editarmeucadastro, :update, :buscar]

  
  # GET /voluntario_pessoa_fisicas
  # GET /voluntario_pessoa_fisicas.json


  #def buscarArray
    #exact
    #@entidades = Entidade.find_all_by_cnpj_ent(params[:cnpj])
    #query with like
    #@entidades = Entidade.find(:all, :conditions => ['nome_ent LIKE ? or endereco_ent LIKE ? or site_ent LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"])
    #render 'entidades/index'
  #end
def cruzar_pf_ent
  sql = "
                SELECT DISTINCT voluntario_pessoa_fisicas.id, cpf_pf, nome_pf, email_pf, telefone_pf, como_ficou_sabendo_pf, 
                       experiencia_pf, publico_criancas_pf, publico_adultos_pf, publico_melhor_idade_pf, 
                       publico_adolescentes_pf, publico_especiais_pf, publico_outros_pf, 
                       atuacao_juridica_pf, atuacao_administrativa_pf, atuacao_recreacao_pf, 
                       atuacao_saude_pf, atuacao_educacao_pf, atuacao_manutencao_pf, 
                       atuacao_doacao_pf, atuacao_outro_pf, \"disp_domManha_pf\", \"disp_domTarde_pf\", 
                       \"disp_domNoite_pf\", \"disp_sabManha_pf\", \"disp_sabTarde_pf\", \"disp_sabNoite_pf\", 
                       \"disp_sexManha_pf\", \"disp_sexTarde_pf\", \"disp_sexNoite_pf\", \"disp_quiManha_pf\", 
                       \"disp_quiTarde_pf\", \"disp_quiNoite_pf\", \"disp_quaManha_pf\", \"disp_quaTarde_pf\", 
                       \"disp_quaNoite_pf\", \"disp_terManha_pf\", \"disp_terTarde_pf\", \"disp_terNoite_pf\", 
                       \"disp_segManha_pf\", \"disp_segTarde_pf\", \"disp_segNoite_pf\", outras_infos_pf, 
                       visuzalizado_pf, voluntario_pessoa_fisicas.created_at, voluntario_pessoa_fisicas.updated_at
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
                
  @entidades = Entidade.paginate_by_sql(sql, :page => @page, :per_page => 8)

  render 'entidades/index'
end

def busca_disponibilidade_horario
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate(:page => params[:page], :per_page => 8).where("disp_domManha_pf = ?", params[:disp_dom])

  render 'voluntario_pessoa_fisicas/index'
end

def buscarHistorico
    flag = 1 # Only to verify the first time to add the string OR
    sql = "SELECT * FROM voluntario_pessoa_fisicas WHERE id IN (SELECT DISTINCT(voluntario_pessoa_fisica_id) FROM historicos WHERE lower(descricao_hist) LIKE lower('%"+params[:queryHistorico]+"%')) ORDER BY nome_pf "
    
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate_by_sql(sql, :page => @page, :per_page => 8)

    render 'voluntario_pessoa_fisicas/index'
end 

def buscarGeral
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate(:page => params[:page], :per_page => 8).find(:all, :conditions => ['nome_pf LIKE ? or email_pf LIKE ? or atuacao_outro_pf LIKE ? OR como_ficou_sabendo_pf LIKE ? OR cpf_pf LIKE ? OR publico_outros_pf LIKE ? OR telefone_pf LIKE ? OR outras_infos_pf LIKE ?', "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%"], :order => "nome_pf")

  render 'voluntario_pessoa_fisicas/index'
end

def busca_por_disponibilidade
  flag = 1 # Only to verify the first time to add the string OR
  parana = 'SELECT * FROM voluntario_pessoa_fisicas WHERE ';

    if (params[:disp_domManha_pf])
      parana = parana + ' "disp_domManha_pf" = ' + params[:disp_domManha_pf] + ' '
      flag = 0
    end
    
    if (params[:disp_domTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_domTarde_pf" = ' + params[:disp_domTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_domTarde_pf" = ' + params[:disp_domTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_domNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_domNoite_pf" = ' + params[:disp_domNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_domNoite_pf" = ' + params[:disp_domNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sabManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_sabManha_pf" = ' + params[:disp_sabManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sabManha_pf" = ' + params[:disp_sabManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sabTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_sabTarde_pf" = ' + params[:disp_sabTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sabTarde_pf" = ' + params[:disp_sabTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sabNoite_pf])
      if (flag == 0)    
        parana = parana + ' OR ';
        parana = parana + ' "disp_sabNoite_pf" = ' + params[:disp_sabNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sabNoite_pf" = ' + params[:disp_sabNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sexManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_sexManha_pf" = ' + params[:disp_sexManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sexManha_pf" = ' + params[:disp_sexManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sexTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_sexTarde_pf" = ' + params[:disp_sexTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sexTarde_pf" = ' + params[:disp_sexTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_sexNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_sexNoite_pf" = ' + params[:disp_sexNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_sexNoite_pf" = ' + params[:disp_sexNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quiManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quiManha_pf" = ' + params[:disp_quiManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quiManha_pf" = ' + params[:disp_quiManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quiTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quiTarde_pf" = ' + params[:disp_quiTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quiTarde_pf" = ' + params[:disp_quiTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quiNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quiNoite_pf" = ' + params[:disp_quiNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quiNoite_pf" = ' + params[:disp_quiNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quaManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quaManha_pf" = ' + params[:disp_quaManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quaManha_pf" = ' + params[:disp_quaManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quaTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quaTarde_pf" = ' + params[:disp_quaTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quaTarde_pf" = ' + params[:disp_quaTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_quaNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_quaNoite_pf" = ' + params[:disp_quaNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_quaNoite_pf" = ' + params[:disp_quaNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_terManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_terManha_pf" = ' + params[:disp_terManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_terManha_pf" = ' + params[:disp_terManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_terTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_terTarde_pf" = ' + params[:disp_terTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_terTarde_pf" = ' + params[:disp_terTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_terNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_terNoite_pf" = ' + params[:disp_terNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_terNoite_pf" = ' + params[:disp_terNoite_pf];
        flag = 0        
      end  
    end

    if (params[:disp_segManha_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_segManha_pf" = ' + params[:disp_segManha_pf];
        flag = 0        
      else
        parana = parana + ' "disp_segManha_pf" = ' + params[:disp_segManha_pf];
        flag = 0        
      end  
    end

    if (params[:disp_segTarde_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_segTarde_pf" = ' + params[:disp_segTarde_pf];
        flag = 0        
      else
        parana = parana + ' "disp_segTarde_pf" = ' + params[:disp_segTarde_pf];
        flag = 0        
      end  
    end

    if (params[:disp_segNoite_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' "disp_segNoite_pf" = ' + params[:disp_segNoite_pf];
        flag = 0        
      else
        parana = parana + ' "disp_segNoite_pf" = ' + params[:disp_segNoite_pf];
        flag = 0        
      end  
    end

    if (flag == 1)
      parana = parana + '1 = 1'
    end

  parana = parana + " ORDER BY nome_pf "

  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate_by_sql(parana, :page => @page, :per_page => 8)

  render 'voluntario_pessoa_fisicas/index'

end

def busca_experiencia
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate(:page => params[:page], :per_page => 6).where("experiencia_pf = ?", true).order("nome_pf")
  
  render 'voluntario_pessoa_fisicas/index'
end

def busca_atuacao
    flag = 1 # Only to verify the first time to add the string OR
    parana = 'SELECT * FROM voluntario_pessoa_fisicas WHERE ';

    if (params[:atuacao_juridica_pf])
        parana = parana + ' atuacao_juridica_pf = ' + params[:atuacao_juridica_pf] + ' '
        flag = 0
    end

    if (params[:atuacao_administrativa_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_administrativa_pf = ' + params[:atuacao_administrativa_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_administrativa_pf = ' + params[:atuacao_administrativa_pf];
        flag = 0        
      end
    end

    if (params[:atuacao_recreacao_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_recreacao_pf = ' + params[:atuacao_recreacao_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_recreacao_pf = ' + params[:atuacao_recreacao_pf];
        flag = 0
      end
    end

    if (params[:atuacao_saude_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_saude_pf = ' + params[:atuacao_saude_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_saude_pf = ' + params[:atuacao_saude_pf];
        flag = 0
      end
    end

    if (params[:atuacao_educacao_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_educacao_pf = ' + params[:atuacao_educacao_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_educacao_pf = ' + params[:atuacao_educacao_pf];
        flag = 0
      end
    end

    if (params[:atuacao_manutencao_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_manutencao_pf = ' + params[:atuacao_manutencao_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_manutencao_pf = ' + params[:atuacao_manutencao_pf];
        flag = 0
      end
    end

    if (params[:atuacao_doacao_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_doacao_pf = ' + params[:atuacao_doacao_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_doacao_pf = ' + params[:atuacao_doacao_pf];
        flag = 0
      end
    end
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end
    parana = parana + " ORDER BY nome_pf"

    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate_by_sql(parana, :page => @page, :per_page => 8)

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
    parana = parana + " ORDER BY nome_pf "
  
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate_by_sql(parana, :page => @page, :per_page => 8)

  render 'voluntario_pessoa_fisicas/index'
end

def buscar
  @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find_by_cpf_pf(params[:cpf])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'voluntario_pessoa_fisicas/vermeucadastro'
  end

  def index
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.paginate(:page => params[:page], :per_page => 8).find(:all, :order => "nome_pf")

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
        format.html { redirect_to :action => "vermeucadastro", :id => @voluntario_pessoa_fisica, notice: 'Voluntario pessoa fisica was successfully created.' }
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
        format.html { redirect_to :action => "vermeucadastro", :id => @voluntario_pessoa_fisica, notice: 'Voluntario pessoa fisica was successfully updated.' }
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
