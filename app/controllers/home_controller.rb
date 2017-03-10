# frozen_string_literal: true
class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :load_beers, only: :index

  private

  def load_beers
    @beers = ::Beers::ListService.list_most_important
  end
end
