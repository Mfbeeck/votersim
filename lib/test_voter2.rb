class Politician
  attr_accessor :name, :party
 
  def initialize(name, party)
    @name = name
    @party = party
  end
end
 
# This version uses a "Campaign" class to hold the pieces.
class Campaign
  # Instead of having separate runner code, the user prompts
  # are coded into the class.
  def display_main_menu
    puts "What would you like to do?"
    puts "Create, List, Update, or Vote"
  end
 
  def create
    puts "What would you like to create?"
    puts "Politician or Person"
  end
 
  def create_politician
    puts "Name?"
    # This rescue trick allows this code to run in SublimeText.
    name = gets.chomp rescue "Ed"
 
    puts "Party?"
    puts "Democrat or Republican"
    party = gets.chomp rescue "Democrat"
 
    politician = Politician.new(name, party)
    # This line is a bug we never got around to fixing.
    @politicians = []
    @politicians << politician
  end
 
  def list_of_politicians
    @politicians
  end
end
 
# require 'minitest/autorun'
 
# class TestVoterSim < Minitest::Test
#   def test_main_menu
#     votersim = Campaign.new
#     # You can assert that your code outputs the correct prompts.
#     assert_output("What would you like to do?\nCreate, List, Update, or Vote\n") do
#       votersim.display_main_menu
#     end
#   end
 
#   def test_create
#     votersim = Campaign.new
 
#     assert_output("What would you like to create?\nPolitician or Person\n") do
#       votersim.create
#     end
#   end
 
#   def test_create_politician
#     votersim = Campaign.new
 
#     assert_output("Name?\nParty?\nDemocrat or Republican\n") do
#       votersim.create_politician    
#     end
 
#     politicians = votersim.list_of_politicians
#     assert_equal 1, politicians.length
 
#     politician = politicians.first
#     assert_equal "Ed", politician.name
#     assert_equal "Democrat", politician.party
#   end
# end
 
# Because we implement the prompts in the class, the 
# simulation runner code is very simple.
campaign = Campaign.new
campaign.display_main_menu
campaign.create_politician