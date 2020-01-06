class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_info = req.path.split("/items/").last
            if item =@@items.find{|it| it.name == item_info}
              resp.write item.price
            else 
              resp.status = 400
              resp.write "Item not found"
            end
        else
            resp.status=404
            resp.write "Route not found"
        end
        resp.finish
    end
end


# if req.path.match(/songs/)
#  
#     song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
#     song = @@songs.find{|s| s.title == song_title}
#  
