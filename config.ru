require "sinatra"
require "sinatra/contrib" if development?
require_relative './controllers/facts_controller.rb'

use Rack::Reloader
use Rack::MethodOverride


run FactsController
