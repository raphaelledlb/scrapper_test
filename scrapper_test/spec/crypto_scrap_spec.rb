require_relative '../lib/crypto_scrap.rb'

describe 'find_crypto_value(crypto_name, crypto_value)' do

    it "confirms the value of cryptomoney" do
      expect(find_crypto_value("KSM",26.78)).to eq(true)
      expect(find_crypto_value("AR", 3.84)).to eq(true)
    end
end