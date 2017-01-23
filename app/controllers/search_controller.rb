class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @wikis = []
    else
      @wikis = Wiki.search params[:q]
    end
  end
end
