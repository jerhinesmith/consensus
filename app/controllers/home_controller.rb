class HomeController < ApplicationController
  def index
    @topics = Topic.by_name
  end
end
