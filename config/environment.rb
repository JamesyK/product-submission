# Load the Rails application.
require File.expand_path('../application', __FILE__)
Paperclip.options[:command_path] = "/usr/bin"
# Initialize the Rails application.
Rails.application.initialize!
