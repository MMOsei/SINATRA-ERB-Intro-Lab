require "sinatra"
require "sinatra/contrib" if development?
require_relative './controllers/posts_controller.rb'

use Rack::Reloader
use Rack::MethodOverride


run PostsController
