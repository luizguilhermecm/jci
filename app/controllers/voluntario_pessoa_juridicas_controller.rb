class VoluntarioPessoaJuridicasController < ApplicationController
  # GET /voluntario_pessoa_juridicas
  # GET /voluntario_pessoa_juridicas.json
  def index
    @voluntario_pessoa_juridicas = VoluntarioPessoaJuridica.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voluntario_pessoa_juridicas }
    end
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

  # POST /voluntario_pessoa_juridicas
  # POST /voluntario_pessoa_juridicas.json
  def create
    @voluntario_pessoa_juridica = VoluntarioPessoaJuridica.new(params[:voluntario_pessoa_juridica])

    respond_to do |format|
      if @voluntario_pessoa_juridica.save
        format.html { redirect_to @voluntario_pessoa_juridica, notice: 'Voluntario pessoa juridica was successfully created.' }
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
        format.html { redirect_to @voluntario_pessoa_juridica, notice: 'Voluntario pessoa juridica was successfully updated.' }
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
