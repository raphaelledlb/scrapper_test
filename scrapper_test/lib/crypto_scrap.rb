require 'nokogiri'
require 'open-uri'


PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(PAGE_URL))


crypto_names = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').map{|x| x.text}
crypto_value = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a').map{|i| i.text.delete("$").gsub(',','').to_f}


hash_crypto = crypto_names.zip(crypto_value).to_h

result = []
	hash_crypto.each do |i,b|
	puts i => b
	end


def find_crypto_value(crypto_name, crypto_value)
	if result = [
		{crypto_name => crypto_value}
	]
	puts true

	else

	puts false. 
end
end
