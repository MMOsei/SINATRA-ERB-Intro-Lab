class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # set the root to the parent directory of the current File
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new {File.join(root, "views") }

  $articles =[
    {
      :id => 0,
      :title => "IKEA",
      :body => "IKEA is the best stop ever! you can go there and dream up ideas for your house and then make them happer witht their super customisable furniture."
    },
    {
      :id => 1,
      :title => "Supermalt",
      :body => "Supermalt is an amazing drink. Some people have to builds a taste for it, and for others, like myself, our testebuds were just born in correct alignment to love this drink."
    },
    {
      :id => 2,
      :title => "Hawes & Curtis",
      :body => "This is a brand that will never disapoint on the quality front. They have a amazing collection of shirts, for both men and women, as well as a beautifull collection of accessories to make your outfit stand out. This is the only place I like to buy my shirts."
    }
  ]


  #INDEX
  get "/facts" do
    @title ="Facts Index"
    @facts = $facts

    erb :'facts/index'
  end

  #NEW
  get "/facts/new" do
    @fact = {
      :id => "",
      :title => "",
      :body => ""
    }
    erb :'facts/new'
  end

  #CREATE
  post "/facts" do
    id = $facts.last[:id] +1

    new_post ={
      :id => id,
      :title => params[:title],
      :body => params[:body]

    }
    $facts.push new_post

    redirect '/facts'
  end

  #SHOW
  get "/facts/:id" do
    id = params[:id].to_i
    puts id.class

    @title = 'Show Facts'
    @post = $facts[id]

    erb :'facts/show'
  end

  #EDIT
  get "/facts:id/edit" do
    id = params[:id].to_i

    @fact = $facts[id]

    erb :'facts/edit'
  end

  #UPDATE
  put "/facts/:id" do
    # get id from params
    id = params[:id].to_i

    #get hash from array
    fact = $facts[id]

    # Update the necesary hash with the values form the params
    fact[:title] = params[:title]
    fact[:body] = params[:body]

    #save new dat back in the array
    $facts[id] = fact

    redirect '/facts'
  end

  #DESTROY
  delete "/facts/:id" do
    id = params{:id}

    $facts.delete_at id

    redirect '/facts'
  end

end
