require 'rack'
require_relative 'Classic.rb'
require_relative 'Hipster.rb'
require_relative 'Samuel.rb'
require 'date'

  app = Proc.new do |env|
    # Finds the num of paragraphs requested, or sets it to 1
    @num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "").to_i
    @num = 1 if @num.zero?
    @path = env["PATH_INFO"]
    @headers = {'Content-Type' => 'text/html'}



    def response
      if @path.start_with?('/classic')
        show_classic
      elsif @path.start_with?('/samuel')
        show_samuel
      elsif @path.start_with?('/hipster')
        show_hipster
      elsif @path == '/current_time'
        show_time
      else
        four_oh_four
      end
    end

    def find_time
      time = Time.now.to_s
      time = DateTime.parse(time).strftime("%m/%d/%Y %H:%M")
    end


    def show_time

      ['200', @headers, [find_time]]
    end

    def show_hipster
      ['200', @headers, Hipster.call(@num)]
    end

    def show_classic
      ['200', @headers, Classic.call(@num)]
    end

    def show_samuel
      ['200', @headers, Samuel.call(@num)]
    end

    def four_oh_four
      ['404', @headers, ["We're sorry. We couldn't find that"]]
    end

    response
  end

Rack::Handler::WEBrick.run app
