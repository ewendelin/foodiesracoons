class ClaimsController < ApplicationController
  def index
    @claims = Claim.all
  end
end
