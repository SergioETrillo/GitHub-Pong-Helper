#!/usr/bin/env ruby

require 'open3'

HELP = "\nusage:\n ./gitpong.rb <partner_ID> <Github_repo_name> <mode>
Description of arguments:
partner_ID: Github user name
repo: Github repo name common to the session
mode:(optional) protocol to be used: https (default) or ssh
------------------------------------------------------------------
Examples:
./gitpong.rb tigretoncio test # => gitpongs with user 'tigretoncio' on repo 'test' in https
./gitpong.rb tigretoncio test https  #=> same as above
./gitpong.rb BillGates goWindows ssh  # => gitpongs with user 'BillGates' on repo 'goWindows' using ssh
./gitpong.rb  #=> prints this help message"

def create_url(id,repo,mode)
  url = ""
  if mode == 'https' or mode.nil?
    url = "https://github.com/#{id}/#{repo}"
  elsif mode == 'ssh'
    url = "git@github.com:#{id}/#{repo}.git"
  else
    puts "error: mode is not correct: use https or ssh"
  end
  url
end

def create_git(id,url)
  "git remote add #{id} #{url}"
end

if ARGV.empty?
  puts HELP
  exit(-1)
end

partner,repo,mode = ARGV[0..2]
git_url = create_url(partner,repo,mode)
command = "git remote add #{partner} #{git_url}"
stdout,stderr,status = Open3.capture3(command)
STDERR.puts stderr
error_code= status.to_s.split().last.to_i

if error_code == 0
  puts "Success! Well done Github-ponger, check your route with git remote -v"
else
  puts "OH NO! something is wrong,\n /
  read message above ^^^ for more details\n /
  usage:\n Type gitpong without arguments for help"
end




