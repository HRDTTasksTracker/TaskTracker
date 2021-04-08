# frozen_string_literal: true

class ValidEmailsController < ApplicationController

  layout "header"  #the header for the pages

  # will show all whitelisted emails
  def index
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    @valid_emails = ValidEmail.all.order(id: :asc)
  end

  def new
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    @valid_email = ValidEmail.new
  end

  # shows a particular vaild email with id: id
  def show
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    @valid_email = ValidEmail.find(params[:id])
  end

  # creates a new whitelisted email with a default in_use to false
  def create
    @valid_email = ValidEmail.new(valid_email_params)
    @valid_email.in_use = false
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    if @valid_email.save
      redirect_to '/valid_emails'
    else
      render :new
    end
  end

  def edit
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end
    @valid_email = ValidEmail.find(params[:id])
  end

  # same protections as edit to have double protection
  def update
    # only allow admins and moderators to whitelist emails
    if current_user.role != 'admin' && current_user.role != 'moderator'
      redirect_to '/tasks'
    end

    @valid_email = ValidEmail.find(params[:id])
    if @valid_email.update(valid_email_params)
      redirect_to '/valid_emails'
    else
      render :new
    end

  end

  def destroy
    @valid_email = ValidEmail.find(params[:id])
    @valid_email.destroy
    redirect_to '/valid_emails'
  end

  private

  def valid_email_params
    params.require(:valid_email).permit(:email)
  end
end
