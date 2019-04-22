require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
    '<html>
      <head>
        <title>
          The Gossip Project
        </title>
      </head>

      <body>
        <h1>
          Our super GOSSIP SITE!
        </h1>
      </body>
    </html>'
  end

  run! if app_file == $0
end
