require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'selenium'

PAGE_URL = "http://www.bu.edu/eng/current-students/ingalls/status/output.html"

page = Nokogiri::HTML(open(PAGE_URL))
#data = page.search('div#results')
data = page.css("strong")

# Only using people in room to determine busyness for now
people = data[0].text.to_i

# init mechanize agent
=begin
agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'
VOTEPAGE_URL = "https://buzy.herokuapp.com/places/3"
votepage = agent.get(VOTEPAGE_URL)
voteform = votepage.form_with(:id => 'new_vote')
votebutton = voteform.button_with(:id => 'busy')
puts votebutton
agent.submit(voteform,votebutton)
=end
selenium = Selenium.new
selenium.open("https://buzy.herokuapp.com/places/3")
selenium.click("id=busy")


def isBusy(people)
	if people > 80
		return "busy"
	else
		return "not busy"
	end
end