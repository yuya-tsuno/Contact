class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      @contacts = Contact.all
      redirect_to new_contact_path
    else
      @contacts = Contact.all
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
