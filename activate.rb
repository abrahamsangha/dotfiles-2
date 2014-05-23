#!/usr/bin/env ruby

require 'fileutils'

LINKS = ["vim",
         "vimrc",
         "zsh",
         "zshrc",
         "tmux.conf",
         "gitconfig"]

working_dir = File.expand_path(File.dirname(__FILE__))
home_dir = File.expand_path("~")
dot_files = LINKS.map { |link| File.join(working_dir, link) }

dot_files.each do |filename|
  sym_link = File.join(home_dir, ".#{File.basename(filename)}")

  FileUtils.rm sym_link if File.symlink?(sym_link) || File.exist?(sym_link)
  str = "In #{home_dir}, creating symlink .#{File.basename(filename)} to #{filename}"
  puts "\e[#{32}m#{str}\e[0m"
  FileUtils.ln_s filename, sym_link
end
