#VOTER SIM
public 
def capitalize_each_word
	split.map(&:capitalize).join(' ')
end
def put_a_line_of_character_size(character, number)
  puts character * number
end

class World
	attr_accessor :voters, :politicians #Don't think I need this...?

	def initialize
		@@voters = []
		@@politicians = []

	end

	def main_menu
		put_a_line_of_character_size("*", 50)
		menu_options = ["1","2","3","4","5","6","7","8"]
		begin
		puts "What would you like to do?" 
		puts "(1) Create a person"
		puts "(2) Update a person"
		puts "(3) List voters"
		puts "(4) List politicians"
		puts "(5) List all people"
		puts "(6) Add default voters/politicians"
		puts "(7) Run campaign"
		puts "Select a number:"
		to_do = gets.chomp.downcase
		end until menu_options.include? to_do
		case to_do
		when "1"
			create
			main_menu
		when "2"
			update_person
		when "3"
			list_voters
			main_menu
		when "4"
			list_politicians
			main_menu
		when "5"
			list_people
			main_menu
		when "6"
			add_default_people #how do I make it so that this only works once (it only adds the default people once and can't again)
			main_menu
		when "7"
			#RUN CAMPAIGN
			main_menu
		end
	end

	def add_default_people #WHY ARE THESE PEOPLE NOT ACCESSIBLE THROUGH MY UPDATE METHOD?
		@@politicians << [Politician.new("Hillary Clinton", "Democrat"), Politician.new("Jeb Bush", "Republican")]
		@@voters << [Voter.new("John Jacob", "Liberal"), Voter.new("Matthew Wenger", "Tea Party"), Voter.new("Daniel Martin", "Conservative"), Voter.new("Alberto Alvarez", "Neutral"), Voter.new("Henry Sims", "Socialist"), Voter.new("Sarah Henriquez", "Liberal"), Voter.new("Claudia Ackerman", "Tea Party"), Voter.new("Isabel Elson", "Conservative"), Voter.new("Gonzalo Mendez", "Neutral"), Voter.new("Sofia Galatas", "Socialist"), Voter.new("Andres Jacobs", "Conservative")]
	end


	def add_politician
    	puts "What is this politican's name?"
    	politician_name_response = gets.chomp.capitalize_each_word
    	party_options = ["Democrat", "Republican"]
    	begin
    	puts "What party does this politician belong to?" 
    	puts "Democrat or Republican?"
    	party_response = gets.chomp.capitalize
    	end until party_options.include? party_response

    	@@politicians << Politician.new(politician_name_response, party_response)
  	end
  	
  	def add_voter
  		puts "What is this voter's name?"
    	voter_name_response = gets.chomp.capitalize_each_word
    	politics_options = ["1", "2", "3", "4", "5"]
    	begin
    	puts "What view does this person have?"
    	puts "(1) Liberal"
    	puts "(2) Conservative"
    	puts "(3) Tea Party"
    	puts "(4) Socialist"
    	puts "(5) Neutral"
    	puts "Select a number:"
    	politics_response = gets.chomp.capitalize_each_word
    	end until politics_options.include? politics_response
	    	case politics_response
	    	when "1"
	    	politics_response = "Liberal"
	    	when "2"
	    	politics_response = "Conservative"
	    	when "3"
	    	politics_response = "Tea Party"
	    	when "4"
	    	politics_response = "Socialist"
	    	when "5"
	    	politics_response = "Neutral"
	    	end
    	@@voters << Voter.new(voter_name_response, politics_response)
  	end

  	def create
  		create_options = ["voter", "politician"]
  		begin
  		puts "What would you like to create?"
  		puts "Voter or Politician?"
  		
  		response = gets.chomp.downcase
  		end until create_options.include? response

  		if response == "voter"
    		add_voter
		elsif response == "politician"
			add_politician
		else
		puts "Please return a valid person!"  	
		end	
  	end

  	def update_person #WOULD LIKE TO BYPASS THIS STEP TO JUST EDIT ANY PERSON BASED ON NAME, ALSO UPDATE DOES NOT WORK FOR DEFAULT PEOPLE
	  	options = ["voter", "politician"]
	  	begin
	  	puts "Is this person a voter or a politician?"
	  	person = gets.chomp.downcase
	  	end until options.include? person
	  	case person
	  	when "voter"
	  		begin
	  		update_voter
	  		rescue
	  			puts "I could not find that voter! Search again!"
	  			main_menu
	  		end
	  	
	  	when "politician"
	  		begin
	  		update_politician
	  		rescue
	  			puts "I could not find that politician! Search again!"
	  			main_menu
	  		end
	  	end
	  end


  	def get_voter(name)
	    @@voters.select do |voter|
      	voter.name == name
    	end.first
  	end

  	def get_politician(name)
	    @@politicians.select do |politician|
      	politician.name == name
    	end.first
  	end
 
  	def update_politician
  	puts "Here is a list of the politicians:"
  	pure_list_politicians #would like to sort them for this listing
  	puts "What is the full name of the politician you would like to update?"
  	name = gets.chomp.capitalize_each_word	
    politician = get_politician(name)
  	#WANT TO MAKE THIS BELOW INTO A METHOD AS WELL IN ORDER TO SEND THE USER BACK TO THIS POINT IF HE WANTS TO CONTINUE EDITING...
	    loop do
		    options = ["1", "2"]
		    begin
		    puts "What would you like to update for #{name}?" #issue here when you already altered his name, because it still uses old name in #{name}...
		    puts "(1) Name"
		    puts "(2) Party"
		    puts "Select a number:"	
			choice = gets.chomp.downcase
			end until options.include? choice

			case choice
			when "1"
				puts "What would you like to change #{name}'s name to?"
				new_name = gets.chomp.capitalize_each_word
				politician.name = new_name
				edit_choice_options = ["yes", "no"]
				begin
				puts "Do you want to continue to edit this politician? Yes or no?"
				edit_choice = gets.chomp.downcase
				end until edit_choice_options.include? edit_choice

					case edit_choice
					when "yes"
						
					when "no"
						main_menu
					end

			when "2"
				party_options = ["Democrat", "Republican"]
				begin
				puts "What would you like to change #{name}'s party to? Democrat or Republican?"
				new_party = gets.chomp.capitalize_each_word
				end until party_options.include? new_party
				
				politician.party = new_party
	  			edit_choice_options = ["yes", "no"]
				begin
				puts "Do you want to continue to edit this politician? Yes or no?"
				edit_choice = gets.chomp.downcase
				end until edit_choice_options.include? edit_choice

					case edit_choice
					when "yes"
					when "no"
						main_menu
					end
	  		end
		end  	
  	end

  	def update_voter #does not work once you add the defaults? Also does not work on the default people..
  		puts "Here is a list of the voters:"
  		pure_list_voters #would like to sort them for this listing
	  	puts "What is the full name of the voter you would like to update?"
	  	name = gets.chomp.capitalize_each_word	
	    voter = get_voter(name)
	  	#WANT TO MAKE THIS BELOW INTO A METHOD AS WELL IN ORDER TO SEND THE USER BACK TO THIS POINT IF HE WANTS TO CONTINUE EDITING...
			loop do 
			    options = ["1", "2"]
			    begin
			    puts "What would you like to update for #{name}?"
			    puts "(1) Name"
			    puts "(2) View"
			    puts "Select a number:"	
				choice = gets.chomp.downcase
				end until options.include? choice

				case choice
				when "1"
					puts "What would you like to change #{name}'s name to?"
					new_name = gets.chomp.capitalize_each_word
					voter.name = new_name

					edit_choice_options = ["yes", "no"]
					begin
					puts "Do you want to continue to edit this politician? Yes or no?"
					edit_choice = gets.chomp.downcase
					end until edit_choice_options.include? edit_choice

						case edit_choice
						when "yes"
						when "no"
							main_menu
						end

				when "2"
					politics_options = ["Liberal", "Conservative", "Tea Party", "Socialist", "Neutral"]
					begin
					puts "What would you like to change #{name}'s party to? Liberal, Conservative, Tea Party, Socialist, or Neutral?"
					new_politics = gets.chomp.capitalize_each_word
					end until politics_options.include? new_politics
					
					voter.politics = new_politics
		  			edit_choice_options = ["yes", "no"]
					begin
					puts "Do you want to continue to edit this politician? Yes or no?"
					edit_choice = gets.chomp.downcase
					end until edit_choice_options.include? edit_choice

						case edit_choice
						when "yes"
						when "no"
							main_menu
						end
		  		end
		  	end	
  	end
 
 	def pure_list_voters
  		puts @@voters
  	end

  	def list_voters
  		puts "Voters:"
  		puts @@voters
  	end

  	def pure_list_politicians
    	puts @@politicians
	end

  	def list_politicians
	    # This works because Politician overrides
	    # to_s.
    	puts "Politicians:"
    	puts @@politicians
	end

  	def list_people
		list_voters
		puts " "
		list_politicians
	end
end

class Person
	attr_accessor :name, :vote

	def initialize(name) 
		@name = name
	end
end

class Politician < Person
	attr_accessor :party # Do I not have to include an accessor for name here if name is super?

	def initialize(name, party)
		super(name)
		@party = party
	end

	def to_s
    "Name: #{@name}       Party: #{@party}" #HOW DO I GET THIS TO STAY IN LINE FOR ALL PEOPLE??
  	end
  	
  	def cast_vote
    @vote = self
  	end

end

class Voter < Person
	attr_accessor :politics
	def initialize(name, politics)
		super(name)
		@politics = politics
	end

	def to_s
    "Name: #{@name}       View: #{@politics}"
  	end

  	def cast_vote

  	end

end


require 'minitest/autorun'

def main_menu_test
	world = World.new
 	world.main_menu
end

main_menu_test

# def create_test
#   world = World.new
#   puts "What would you like to create?"
#   puts "Voter or Politician"
#   response = gets.chomp.downcase
 
#   if response == "voter"
#     world.add_voter
#   elsif response == "politician"
#   	world.add_politician
#   else
#   	"Please return a valid person!"  	
#   end
#   puts "Voters:"
#   world.list_voters
#   puts "Politicians:"
#   world.list_politicians
# end 




# # class VoterSimTest < Minitest::Test
#   def test_world
#     world = World.new
 
#     world.add_politician("Ed", "Democrat")
#     assert_equal 1, world.list_politicians.length
 
#     world.add_voter("James", "Democrat")
#     assert_equal 1, world.list_voters.length
#   end

#   test_world

	# def create_voter
	# end 

	# def create_politician

	# end

	# def update_voter
	# end

	# def update_politician
	# end

	# def list_people
	# end




# # I should be able to create a voter
# create_voter
 
# # I should be able to create a politician
# create_politician 


# update_voter
# update_politician
# list_people
# # ... to update a voter
# # ... to update a politician
# # ... to list voters and politicians



