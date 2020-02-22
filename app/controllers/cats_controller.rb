class CatsController < ApplicationController
  MAX_RECORDS_PER_PAGE = 10
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  # GET /cats
  # GET /cats.json
  def index
    @page = (params[:page] || 1).to_i
    @cats = Cat.get_offset_selection(MAX_RECORDS_PER_PAGE, @page - 1)
    @last_page = @cats.include?(Cat.last)
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1
  # PATCH/PUT /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to @cat, notice: 'Cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1
  # DELETE /cats/1.json
  def destroy
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: 'Cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:name, :breed, :registry)
    end
end
