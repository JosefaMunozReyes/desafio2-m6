class NoticiasController < ApplicationController
  before_action :set_noticia, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /noticias or /noticias.json
  def index
    @noticias = Noticia.all
  end

  # GET /noticias/1 or /noticias/1.json
  def show
  end

  # GET /noticias/new
  def new
    @noticia = Noticia.new
  end

  # GET /noticias/1/edit
  def edit
  end

  # POST /noticias or /noticias.json
  def create
    @noticia = Noticia.new(noticia_params)
    @noticia.user_id = current_user.id

    respond_to do |format|
      if @noticia.save
        format.html { redirect_to noticia_url(@noticia), notice: "Haz creado una nueva Noti-Fake." }
        format.json { render :show, status: :created, location: @noticia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticias/1 or /noticias/1.json
  def update
    respond_to do |format|
      if @noticia.update(noticia_params)
        format.html { redirect_to noticia_url(@noticia), notice: "Noticia was successfully updated." }
        format.json { render :show, status: :ok, location: @noticia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticias/1 or /noticias/1.json
  def destroy
    @noticia.destroy

    respond_to do |format|
      format.html { redirect_to noticias_url, notice: "Haz eliminado tu Noti-Fake" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticia
      @noticia = Noticia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def noticia_params
      params.require(:noticia).permit(:titulo, :descripcion)
    end
end
