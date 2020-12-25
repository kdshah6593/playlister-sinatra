class ArtistsController < ApplicationController

    #Present user with list of all artists in library
    get '/artists' do
        erb :'artists/index'
    end
    
    #Any given artist's show page should have links to each of his or her songs and genres
    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'artists/show'
    end

end
