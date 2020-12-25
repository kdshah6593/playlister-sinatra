require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    #Present the user with list of all songs; each song clickable link
    #index
    get '/songs' do
        erb :'songs/index'
    end

    #new song
    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        #REMEBER THE FIND OR CREATE BY METHOD
        if Artist.find_by(name: params[:artist][:name])
            @song.artist = Artist.find_by(name: params[:artist][:name])
        else
            @artist = Artist.create(params[:artist])
        end
        @song.genre_ids = params[:genres]
        @song.save
        
        redirect to "/songs/#{@song.slug}"
    end

    #Any given song's show page should have links to that song's artist and each genre associated with the song | this is instead of ID
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
    end
end
