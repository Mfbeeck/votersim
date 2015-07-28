class Politician
	attr_accessor :name, :party
	def initialize (name, party)
		@name = name #this means you're saving the name
		@party = party
	end
end
class Campaign
	def display_main_menu
		puts "What would you like to do?"
		puts "Create, List, Update, or Vote?"
	end
	def create
		puts "What would you like to create?"
		puts "Politician or Person"
	end

	def create_politician
		puts "Name?"
		name = gets.chomp rescue "Ed"

		puts "Party?"
		puts "Democrat or Republican"
		party = gets.chomp rescue "Democrat"

		# {name: name, party: party} LETS MAKE A POLITICIAN CLASS ANYWAY
		politician = Politician.new(name, party)

		@politicians = [] #putting an @ creates an instance variable which can therefore be accessed across the class
		@politicians << politician 
	end

	def list_of_politicians
		@politicians
	end
end

require 'minitest/autorun'

class TestVoterSim < Minitest::Test
	def test_main_menu
		votersim = Campaign.new
		assert_output("What would you like to do?\nCreate, List, Update, or Vote?\n" ) do #Tests what you expect the output will be, tests the next line of code will yield this stuff?
		votersim.display_main_menu
		end
		
	end

	def test_create
		votersim = Campaign.new

		# action = gets.chomp rescue "Create" #not just gets.chomp because you don't want to keep interacting with this to test it, in the terminal it will ask you, but for here it's just going to say create
		# if action == "create"
		assert_output("What would you like to create?\nPolitician or Person\n") do	
		votersim.create
		end
		# end
	end

	def test_create_politician
		votersim = Campaign.new
		assert_output("Name?\nParty?\nDemocrat or Republican\n") do
		votersim.create_politician
		end
	politicians = votersim.list_of_politicians
	assert_equal 1, politicians.length #asserts that there is a politician in there

	politician = politicians.first
	assert_equal "Ed", politician.name
	assert_equal "Democrat", politician.party
	end
end

# IMPLEMENT LOGIC FOR CREATING A VOTER, CONFIRM THAT YOU ARE CREATING VOTER AND HE HAS NAME AND POLITICS, 
# THEN YOU HAVE ALL OF YOUR PIECES THEN YOU NEED TO WRITE CODE THAT MAKES IT INTERACT