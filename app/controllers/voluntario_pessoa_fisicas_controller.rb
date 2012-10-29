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

def buscarHistorico
    flag = 1 # Only to verify the first time to add the string OR
    @voluntario_pessoa_fisicas = Entidade.find_by_sql(["SELECT nome_pf, email_pf, telefone_pf FROM voluntario_pessoa_fisicas WHERE id IN (SELECT DISTINCT(voluntario_pessoa_fisica_id) FROM historicos WHERE descricao_hist @@ to_tsquery(:id))", {:id => params[:queryHistorico]}]);
    render 'voluntario_pessoa_fisicas/mostrar' 
end 

def buscarGeral
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.find(:all, :conditions => ['atuacao_outro_pf LIKE ? OR como_ficou_sabendo_pf LIKE ? OR cpf_pf LIKE ? OR publico_outros_pf LIKE ? OR telefone_pf LIKE ? OR outras_infos_pf LIKE ?', "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%", "%#{params[:queryGeral]}%"])
  render 'voluntario_pessoa_fisicas/mostrar'
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

  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.find_by_sql(parana)
  render 'voluntario_pessoa_fisicas/mostrar'

end

def busca_experiencia
  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.where("experiencia_pf = ?", true)
  render 'voluntario_pessoa_fisicas/mostrar'
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

    if (params[:atuacao_outro_pf])
      if (flag == 0)
        parana = parana + ' OR ';
        parana = parana + ' atuacao_outro_pf = ' + params[:atuacao_outro_pf];
        flag = 0;
      else
        parana = parana + ' atuacao_outro_pf = ' + params[:atuacao_outro_pf];
        flag = 0
      end
    end
    
    if (flag == 1)
      parana = parana + '1 = 1'
    end

  @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.find_by_sql(parana)
  
  render 'voluntario_pessoa_fisicas/mostrar'
  
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
