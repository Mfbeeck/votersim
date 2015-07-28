class World
  attr_accessor :politicians, :voters
 
  def initialize
    @politicians = []
    @voters = []
  end
 
  def add_politician(politician)
    @politicians << politician
  end
 
  def add_voter(voter)
    @voters << voter
  end
 
  def list_politicians
    # This works because Politician overrides
    # to_s.
    puts @politicians
  end
 
  def vote
    # This is an UNTESTED sample implementation
    # of a vote tally.
    # { "politician's name (String)" => "vote count (Fixnum)" }
    tally = {}
    [@politicians + @voters].each do |voter|
      if tally[voter.vote.name].nil?
        tally[voter.vote.name] = 1
      else
        tally[voter.vote.name] += 1
      end
    end
    # We don't pick a winner here.
  end
end
 
# Common features of the Politician and Voter classes
# have been pulled up into a shared Person class
class Person
  attr_accessor :name, :vote
  def initialize(name) 
    @name = name
  end
end
 
class Politician < Person
  attr_accessor :party
 
  def initialize(name, party)
    # Pass the first arg to the superclass initialize
    super(name)
    @party = party
  end
 
  # This allows me to list politicians by simply
  # puts'ing an array of Politician instances
  def to_s
    "#{@name} (#{@party})"
  end
 
  # Politicians always vote for themselves
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
end
 
# require 'minitest/autorun'
 
# class TestVoterSim < Minitest::Test
#   def test_world
#     world = World.new
 
#     # refactored
#     # world.add_politician(pol1)
#     # world.add_politician(pol2)
#     # assert_includes world.politicians, pol1
#     # assert_includes world.politicians, pol2
 
#     # I should be able to create multiple politicians
#     pol1 = Politician.new("Ed", "Democrat")
#     pol2 = Politician.new("Juha", "Republican")
#     [pol1, pol2].each do |politician|
#       world.add_politician(politician)
#       assert_includes world.politicians, politician
#     end
 
#     # I should be able to create multiple voters
#     voter1 = Voter.new("Ed", "Socialist")
#     voter2 = Voter.new("Juha", "Tea Party")
#     [voter1, voter2].each do |voter|
#       world.add_voter(voter)
#       assert_includes world.voters, voter
#     end
#   end
 
#   # I should be able to create a politician
#   def test_create_politician
#     name = "Ed"
#     party = "Democrat"
#     pol = Politician.new(name, party)
 
#     assert_equal name, pol.name
#     assert_equal party, pol.party
#   end
 
#   # I should be able to create a voter
#   def test_create_voter
#     name = "Jo"
#     politics = "Tea Party"
#     voter = Voter.new(name, politics)
 
#     assert_equal name, voter.name
#     assert_equal politics, voter.politics
#   end
# end
 
# Here's some sample simulation runner code
# that uses our classes.
 
world = World.new
 
puts "What would you like to do?"
puts "Create, List, Update, or Vote"
#action = gets.chomp
action = "Create" # hardcoded action for testing
 
puts "What would you like to create?"
puts "Politician or Person"
to_create = gets.chomp
 
case to_create
when "Politician"
  puts "Name?"
  name = gets.chomp
 
  puts "Party? Democrat or Republican"
  party = gets.chomp 
 
  politician = Politician.new(name, party)
  world.add_politician(politician)
when "Voter"
end
 
# This is how listing politicians will work.
world.list_politicians
 
####
 
# Here's an alternative way to get started (without minitest)
# Write all the steps as comments, then implement each comment.
 
# I should be able to create a voter
# This method doesn't work yet, but this is what we wish we had.
# create_voter
 
# I should be able to create a politician
# create_politician
 
# ... to update a voter
# ... to update a politician
# ... to list voters and politicians