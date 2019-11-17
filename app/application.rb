class Application
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)
      if @@cart[0] == nil
        resp.write "Your cart is empty"
      else   
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      end
    elsif req.path.match(/add/)
      search_term = req.params["item"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    puts "hello"
    if @@items.include?(search_term)
      puts search_term
      puts "hello"
      @@cart << search_term
      return "added #{search_term}"
    else
      puts search_term
      puts "hello"
      return "We don't have that item"
    end
  end
end
