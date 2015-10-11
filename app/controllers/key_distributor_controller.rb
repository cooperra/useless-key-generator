class KeyDistributorController < ApplicationController
  # GET /
  def new
    @public_key = PublicKey.new
  end

  # POST /gen
  # POST /gen.json
  def create
    @public_key = PublicKey.new

    new_key_pair = KeyDistributorHelper::generate_key_pair
    @public_key.key = new_key_pair.public_key

    # Get a non-matching public_key for the lulz!
    rand_public_key = begin PublicKey.offset(rand(PublicKey.count)).first.key rescue nil end

    # Put em together
    new_private_key = new_key_pair.private_key
    @key_pair = KeyDistributorHelper::KeyPair.new new_private_key, rand_public_key
    
    respond_to do |format|
      if @public_key.save
        format.html { render }
        format.json { render json: key_pair, status: :created }
      else
        format.html { render :new }
        format.json { render json: @public_key.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_key
      @public_key = PublicKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_key_params
      params[:public_key]
    end
end
