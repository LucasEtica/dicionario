class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]

  # GET /usuarios or /usuarios.json
  def index
    redirect_to termos_path
  end

  # GET /usuarios/1 or /usuarios/1.json
  def show
    redirect_to termos_path
  end

  # GET /usuarios/new
  def new
    return if @usuario_logado
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
    if @usuario.id != @usuario_logado.id
      redirect_to termos_path
    end
  end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to logout_path, notice: "Usuario was successfully created." }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    redirect_to termos_path unless @usuario.id == @usuario_logado.id
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to termos_path, notice: "Alterado com sucesso!" }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    if @usuario.id == @usuario_logado.id
      @usuario.destroy
    end
    @usuario.termos.each do |termo|
      termo.destroy
    end

    respond_to do |format|
      format.html { redirect_to termos_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:nome, :login, :senha, :profile_picture)
    end
end
