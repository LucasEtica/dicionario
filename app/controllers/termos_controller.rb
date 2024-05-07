class TermosController < ApplicationController
  before_action :set_termo, only: %i[ show edit update destroy ]

  # GET /termos or /termos.json
  def index
    if params[:busca].present?
      @termos = Termo.where(usuario_id: @usuario_logado.id).where("LOWER(titulo) LIKE ?", "%#{params[:busca].downcase}%")
    elsif params[:letra].present?
      @termos = Termo.where(usuario_id: @usuario_logado.id).where("titulo LIKE ? or titulo LIKE ?", "#{params[:letra]}%", "#{params[:letra].downcase}%")
    else
      @termos = Termo.where(usuario_id: @usuario_logado.id).order(:titulo)
    end
  end

  # GET /termos/1 or /termos/1.json
  def show
    if @usuario_logado.id != @termo.usuario_id
      redirect_to termos_path
    end
  end

  # GET /termos/new
  def new
    @termo = Termo.new
  end

  # GET /termos/1/edit
  def edit
    if @usuario_logado.id != @termo.usuario_id
      redirect_to termos_path
    end
  end

  # POST /termos or /termos.json
  def create
    @termo = Termo.new(termo_params)
    @termo.usuario_id = @usuario_logado.id

    respond_to do |format|
      if @termo.save
        format.html { redirect_to termos_url(), notice: "Termo was successfully created." }
        format.json { render :show, status: :created, location: @termo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @termo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /termos/1 or /termos/1.json
  def update
    respond_to do |format|
      if @termo.update(termo_params)
        format.html { redirect_to termo_url(@termo), notice: "Termo was successfully updated." }
        format.json { render :show, status: :ok, location: @termo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @termo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termos/1 or /termos/1.json
  def destroy
    @termo.destroy

    respond_to do |format|
      format.html { redirect_to termos_url, notice: "Termo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_termo
      @termo = Termo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def termo_params
      params.require(:termo).permit(:titulo, :descricao, :usuario_id)
    end
end
