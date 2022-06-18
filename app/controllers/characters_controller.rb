class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @character = Character.new
  end
end
