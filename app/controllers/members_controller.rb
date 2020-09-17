class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: [:show]

  private

  def set_member
    @member = Member.find(params[:id])
  end
end
