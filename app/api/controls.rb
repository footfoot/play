module Play
  class Api < Sinatra::Base

    get "/now_playing" do
      song = Play::Song.now_playing
      JSON::dump song.to_hash
    end

    put "/play" do
      Play.client.play
    end

    put "/pause" do
      Play.client.pause
    end

    put "/next" do
      Play.client.next
    end

    put "/previous" do
    end
  end
end
