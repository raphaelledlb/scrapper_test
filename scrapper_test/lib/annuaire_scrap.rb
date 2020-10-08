require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)

	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map{|x| x.text}
	puts email
end


def get_townhall_urls
	page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
	url = page.xpath('//a[contains(@href, "95")]').map { |element| element["href"][1..-1] }.compact

	link = []
	for i in url
		i = "https://www.annuaire-des-mairies.com"+ i
		link.push(i)
	end
	return link
end


list = []
url_list = get_townhall_urls
    for n in url_list
        get_townhall_email(n)
        list.push(n)        
    end

page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
names = page.xpath('//a[@class ="lientxt"]').map{|n| n.text}

 


mairie = Hash[names.zip(list)].to_h


arr = []
mairie.each do |i,b|
arr.push(i => b)
end 



