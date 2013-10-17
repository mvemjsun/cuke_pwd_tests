require 'active_record'
require 'rspec-expectations'
require 'page-object'
require 'page-object/page_factory'
require 'watir-webdriver'
require 'debugger'
require 'mysql2'
require 'factory_girl'
require_relative 'transformation'
require_relative '../../config/data/users'
require_relative '../../config/data/passworddata'
require_relative '../../config/data/page'

World(PageObject::PageFactory)