# require modules here
require "yaml"

def load_library(file)
  # code goes here
  test = YAML.load_file(file)
  formatted_file = {}
  
  test.each{|x,y|
    formatted_file[x] = {
      english: test[x][0],
      japanese: test[x][1]
    }
  }
  puts formatted_file
  formatted_file
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  library = load_library(file)
  #puts library
  library.each{|x,y|
    #puts y[:english]
    if y[:english] == emoticon
      #puts "entered conditional loop"
      #puts y[:japanese]
      return y[:japanese]
    end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  load_library(file).each {|x,y|
    if y[:japanese] == emoticon
      puts "loop worked!"
      return x
    end
  }
  return "Sorry, that emoticon was not found"
end