# GitHub-Pong-Helper
Script to accelerate the setup of GitHub Pong sessions

## User Guide

github pong is a small tool to speed up the setting up of pairing sessions using GitHub Pong

refer to [here](https://github.com/makersacademy/pre_course/blob/master/pills/github_pong.md) for 
more details about GitHub Pong.

### Usage
```
./gitpong.rb partner_ID Github_repo_name mode**
```
### Description of arguments

+*partner_ID*: is the Github user name of your partner
+*repo*: Common Github repository name that both partners will have in their GitHub accounts
+*mode*: protocol to be used: https (default) or ssh.  This is an optional parameter, if not used
https mode is used by default

###Examples
```
./gitpong.rb tigretoncio test** *# => gitpongs with user 'tigretoncio' on repo 'test' in https*
./gitpong.rb tigretoncio test https  #=> same as above
./gitpong.rb BillGates goWindows ssh  # => gitpongs with user 'BillGates' on repo 'goWindows' using ssh
./gitpong.rb  #=> prints this help message"
```
