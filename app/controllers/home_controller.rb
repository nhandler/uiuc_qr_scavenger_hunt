class HomeController < ApplicationController
  def home
    if current_user
      @available_codes = current_user.available_codes
      @found_codes = current_user.found_codes
    else
      @available_codes = User.none
      @found_codes = User.none
    end
  end
end
