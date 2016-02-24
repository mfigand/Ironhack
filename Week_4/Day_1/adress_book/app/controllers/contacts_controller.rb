class ContactsController < ApplicationController

  def index
<<<<<<< HEAD
    @contacts = Contact.all.order("name ASC")
=======
    @contacts = Contact.all
>>>>>>> b791b06f89bddbf71edd02ad19ba4a4d07bcdb15
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

<<<<<<< HEAD
    redirect_to("/contacts/#{contact.id}")
  end

  def show
    @contact = Contact.find params[:id]
=======
    redirect_to("/contacts")
>>>>>>> b791b06f89bddbf71edd02ad19ba4a4d07bcdb15
  end


end
