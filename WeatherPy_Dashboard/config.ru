use Rack::Static,
  :urls => ["/Output","/css"],
  :root => "public"

# @root =  File.expand_path(File.dirname(__FILE__))

# run Proc.new { |env|
#   # Extract the requested path from the request
#   path = Rack::Utils.unescape(env['PATH_INFO'])
#   index_file = "public/#{path}.html"

#   if File.exists?(index_file)
#     # Return the index
#     [200, {'Content-Type' => 'text/html'}, File.read(index_file)]
#     # NOTE: using Ruby >= 1.9, third argument needs to respond to :each
#     # [200, {'Content-Type' => 'text/html'}, [File.read(index_file)]]
#   else
#     # Pass the request to the directory app
#     Rack::Directory.new(@root).call(env)
#   end
# }

# run Proc.new { |env|
#   [
#     200, 
#     {
#       'Content-Type'  => 'text/html', 
#       'Cache-Control' => 'public, max-age=6400' 
#     },
#     File.open( 'public' + env['PATH_INFO'], File::RDONLY)
#   ]
# }

map "/" do
  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/index.html', File::RDONLY)
    ]
  }
end

map '/cloudliness.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/cloudliness.html', File::RDONLY)
    ]
  }
end

map '/comparison.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/comparison.html', File::RDONLY)
    ]
  }
end

map '/data.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/data.html', File::RDONLY)
    ]
  }
end

map '/humidity.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/humidity.html', File::RDONLY)
    ]
  }
end

map '/maxtemp.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/maxtemp.html', File::RDONLY)
    ]
  }
end

map '/windspeed.html' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=6400' 
      },
      File.open('public/windspeed.html', File::RDONLY)
    ]
  }
end
