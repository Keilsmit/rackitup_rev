require 'rack'
require 'sinatra'
require_relative 'Classic.rb'
require_relative 'Hipster.rb'
require_relative 'Samuel.rb'

  app = Proc.new do |env|
      # Finds the num of paragraphs requested, or sets it to 1
      num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
      num = 1 if num.to_i.zero?

    get '/lipsums' do
      "Possible options: Samuel, Hipsum or Classic"
    end

    get '/:lipsum' do
      lipsum = params[:lipsum]
    end

    get '/:lipsum/:num' do
      lipsum * num
    end


    #
    # if lipsum_wanted == "samuel"
    #   output = samuel_Ipsum * num
    # elsif lipsum_wanted == "hipsum"
    #   output = hipster_Ipsum * num
    # elsif lipsum_wanted == "classic"
    #   output = classic_Ipsum * num
    # else
    #   "I don't know what you want. Please choose: samuel, hipsum, classic"
    # end



  end

Rack::Handler::WEBrick.run app
