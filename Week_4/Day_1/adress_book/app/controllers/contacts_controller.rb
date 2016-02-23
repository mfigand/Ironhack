class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order("name ASC")
  end

  def new
    render "new"
  end

  def create

    contact = Contact.new(
    :name => params[:contact][:name],
    :adress => params[:contact][:adress],
    :phone => params[:contact][:phone],
    :email => params[:contact][:email])

    contact.save

    redirect_to("/contacts/#{contact.id}")
  end

  def show
    @contact = Contact.find params[:id]
  end


end
