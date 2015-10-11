module KeyDistributorHelper
  require 'openssl'

  class KeyPair
    attr_accessor :private_key, :public_key
    
    def initialize private_key, public_key
      @private_key = private_key
      @public_key = public_key
    end
  end
  
  def self.generate_key_pair
    rsa_key = OpenSSL::PKey::RSA.new(2048)
    private_key = rsa_key.to_pem
    public_key = rsa_key.public_key.to_pem
    return KeyPair.new private_key, public_key
  end
end
