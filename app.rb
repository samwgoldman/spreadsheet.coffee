require "rack"
require "coffee-script"

# Rack application that serves up compiled CoffeeScript
class AppJS
  def call(env)
    length = 0
    javascript = Dir[File.expand_path("../public/javascripts/*.coffee", __FILE__)].map do |filename|
      compiled = CoffeeScript.compile File.read(filename)
      length += compiled.length
      compiled
    end
    headers = {
      "Content-Type" => "application/javascript",
      "Content-Length" => length.to_s
    }
    [200, headers, javascript]
  end
end

# Rack application that serves up the public directory
App = Rack::Builder.new do
  use Rack::Lint

  map "/" do
    use Rack::Static, :urls => [""], :root => File.expand_path("../public/", __FILE__), :index => "index.html"
    run lambda { |env| [404, {}, ''] }
  end

  map "/spreadsheet.js" do
    run AppJS.new
  end
end.to_app
