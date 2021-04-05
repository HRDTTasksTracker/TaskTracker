# frozen_string_literal: true

class ValidEmailsController < ApplicationController
  # will show all whitelisted emails
  def index
    @valid_emails = ValidEmail.all.order(id: :asc)
  end

  def new
    @valid_email = ValidEmail.new
  end

  # creates a new whitelisted email with a default in_use to false
  def create
    @valid_email = ValidEmail.new(valid_email_params)
    @valid_email.in_use = false
    if @valid_email.save
      redirect_to '/tasks'
    else
      render :new
    end
  end

  private

  def valid_email_params
    params.require(:valid_email).permit(:email)
  end
end
