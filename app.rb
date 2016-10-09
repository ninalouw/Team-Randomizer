
require 'sinatra'
require 'sinatra/reloader'

enable :sessions

get '/' do
  @title= "Team Randomizer"
   erb :index, layout: :template
end

post "/" do
  @names = params[:names]
  session[:array] = @names.split(",")
  @num = params[:num].to_i
  @sort_choice = params[:sort_choice]

  #Error-checking
  #If user input is not a string
  unless params[:names].is_a?(String)&& params[:names].include?(",")
      @error_message = "Error! Your names input is invalid!"
  end
  unless @num.is_a?(String)|| @num.is_a?(Integer)
    @error_message = "Error! Your number input is invalid!"
  end

# Error-checking
# if the number of teams is bigger than the number of members
  if @num > session[:array].length
    if @sort_choice == "num_of_teams"
      @error_message = "Error! The number of teams is bigger than the number of persons!"
    else
      @error_message = "Error! The number of people per team is bigger than number of names given!"
    end
    return erb :error, layout: :template
  end

  #method for num_of_teams
  if @sort_choice == "num_of_teams"
    ## then use this method
    @num_people_per_team = (session[:array].length/@num).floor.to_i
  else
    @num_people_per_team = @num
  end

  @twoArray = create_teams(session[:array], @num_people_per_team)

  erb(:index,{layout: :template})
end

# This is our team generating function
# given an array of names and the number of people per team,
# it returns a two dimensional array of teams
def create_teams(names_array, num_people_per_team)
  @newArray = []
  while names_array.length > 0
    @newArray << random(names_array)
  end
  @twoArray =[]

  (0...@newArray.length).step(num_people_per_team).each do |index|
    arr=[]
    for i in 0...num_people_per_team
      arr << @newArray[index + i]
    end
    @twoArray << arr
  end
  return @twoArray
end

##Randomizer Method
def random(array)
winner1 = array.sample
array.delete(winner1)
return winner1
end
