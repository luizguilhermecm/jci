class VoluntarioPessoaFisicasController < ApplicationController
  # GET /voluntario_pessoa_fisicas
  # GET /voluntario_pessoa_fisicas.json

  def buscar
    @voluntario_pessoa_fisica = VoluntarioPessoaFisica.find_by_cpf_pf(params[:cpf])
    #@entidades = Entidade.find(:all, :conditions => ['cnpj_ent LIKE ?', "%#{params[:cnpj]}%"])
    render 'voluntario_pessoa_fisicas/vermeucadastro'
  end

  def index
    @voluntario_pessoa_fisicas = VoluntarioPessoaFisica.all

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
