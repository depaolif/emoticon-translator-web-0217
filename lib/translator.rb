# require modules here

require "pry"
require "yaml"

def load_library(filepath)
  # code goes here
  emos = YAML.load_file(filepath)
  lib = {
  	"get_meaning" => {},
  	"get_emoticon" => {}
  }
  emos.each do |v1, v2|
  	lib["get_meaning"][v2[1]] = v1
  	lib["get_emoticon"][v2[0]] = v2[1]
  end
  lib
end

def get_japanese_emoticon(yaml, emoticon)
  # code goes here
  lib = load_library(yaml)
  lib["get_emoticon"].each do |eng,jap|
  	if eng == emoticon
  		return jap
  	end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml,emoticon)
  # code goes here
  lib = load_library(yaml)
  lib["get_meaning"] .each do |jap,meaning|
  	if jap == emoticon
  		return meaning
  	end
  end
  return "Sorry, that emoticon was not found"
end