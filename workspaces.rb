#!/usr/bin/env ruby

require 'yaml'

class Window
  attr_accessor :name, :w, :h, :x, :y

  def initialize(name, attrs={})
    @name = name
    @w = attrs["w"]
    @h = attrs["h"]
    @x = attrs["x"]
    @y = attrs["y"]
  end

  # Invokes the xdotools cmd: 
  #   Searchs for the window with --class name
  #   Changes window size to w, h
  #   Changes window poistion to x, y
  #
  def move
    `xdotool search --onlyvisible --class #{name} windowsize %@ #{w} #{h} windowmove #{x} #{y}`
  end
end

class Workspace
  attr_accessor :name, :windows

  def initialize(name, attrs={})
    @name = name
    @windows = []

    attrs.each do |name, attrs|
      @windows << Window.new(name, attrs)
    end
  end

  def arrange()
    windows.each do |w|
      w.move
    end
  end
end

# name of workspace user wants to open
workspace_name = ARGV[0]

# default workspaces file
user_workspaces_filename = "#{ENV['HOME']}/.workspaces.yml"

# does this user have a personal config?
if File.exists?(user_workspaces_filename)
  config = YAML.load(File.new(user_workspaces_filename, 'r'))
else
  config = YAML.load(File.new("./config.yml", 'r'))
end

found = false

# find the workspace by name and arrange
config.each do |name, attrs|
  if workspace_name == name
    found = true
    puts "Arranging workspace: #{workspace_name}"
    workspace = Workspace.new(name, attrs)
    workspace.arrange()

    break
  end
end

# not found :(
unless found 
  puts "Could not find workspace: #{workspace_name}"
end
