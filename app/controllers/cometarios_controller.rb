class CometariosController < ApplicationController
  before_action :set_cometario, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /cometarios or /cometarios.json
  def index
    @cometarios = Cometario.all
  end

  # GET /cometarios/1 or /cometarios/1.json
  def show
  end

  # GET /cometarios/new
  def new
    @cometario = Cometario.new
  end

  # GET /cometarios/1/edit
  def edit
  end

  # POST /cometarios or /cometarios.json
  def create
    @cometario = Cometario.new(cometario_params)

    respond_to do |format|
      if @cometario.save
        format.html { redirect_to cometario_url(@cometario), notice: "Cometario was successfully created." }
        format.json { render :show, status: :created, location: @cometario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cometario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cometarios/1 or /cometarios/1.json
  def update
    respond_to do |format|
      if @cometario.update(cometario_params)
        format.html { redirect_to cometario_url(@cometario), notice: "Cometario was successfully updated." }
        format.json { render :show, status: :ok, location: @cometario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cometario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cometarios/1 or /cometarios/1.json
  def destroy
    @cometario.destroy

    respond_to do |format|
      format.html { redirect_to cometarios_url, notice: "Cometario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cometario
      @cometario = Cometario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cometario_params
      params.require(:cometario).permit(:detalle)
    end
end
