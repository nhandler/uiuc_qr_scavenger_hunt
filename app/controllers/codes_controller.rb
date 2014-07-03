class CodesController < ApplicationController
  before_action :set_code, only: [:show, :edit, :update, :destroy]

  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => @code.url, :level => :l, :unit => 10 }
      format.png  { render :qrcode => @code.url }
      format.gif  { render :qrcode => @code.url }
      format.jpeg { render :qrcode => @code.url }
    end
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
    puts "Code: #{@code.inspect}"
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    code_parameters = code_params
    if code_parameters["new_secret"] == "1"
      puts "New Secret Param Set"
      @code.secret = @code.new_secret
      @code.save
      code_parameters = code_parameters.except("secret")
    end
    code_parameters = code_parameters.except("new_secret")
    respond_to do |format|
      if @code.update(code_parameters)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /register_code
  def register_code
    respond_to do |format|
      format.html
    end
  end

  # GET /register_code/11432423
  def proccess_code
    respond_to do |format|
      if current_user && @code = Code.find_by(secret: params[:secret])
        current_user.found_codes << @code
        current_user.save
        format.html { redirect_to @code, notice: 'Code was successfully registered.' }
      else
        format.html { redirect_to register_code_path, notice: "Invalid Code" }
      end
    end
  end

  # GET /leaders
  def leaders
    @leaders = User.leaders
    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params.require(:code).permit(:name, :clue, :location, :specific_location, :alum, :secret, :new_secret)
    end
end
