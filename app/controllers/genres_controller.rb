class GeneresController < ApplicationController

    #Present the user with list of all genres in the libary
    get '/genres' do
        erb :'genres/index'
    end

    get '/genres/new' do
    end

    #Any given genre's show page should have links to each of its artists and songs
    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :'genres/show'
    end

end
