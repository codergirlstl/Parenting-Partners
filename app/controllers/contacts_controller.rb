class ContactsController < ApplicationController
    before_action :require_user
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
    before_action :set_back_link, except: [:index]
    
    def index
        @contacts = current_user.contacts
    end
    
    def new
        @contacts = current_user.contacts.new
    end
    
    def show
    end
    
    def edit
    end
    
    def create
        @contacts = current_user.contacts.new(contacts_params)
        
        respond_to do |format|
            if @contacts.save
                format.html { redirect_to contacts_path(@contact), notice: 'Contact was successfully created.' }
                format.json { render action: 'show', status: :created, location: @contact }
                else
                format.html { render action: 'new', error: "Contact could not be created." }
                format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @contacts.update(contacts_params)
                format.html { redirect_to contacts_path(@contact), success: 'Contact was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: 'edit', error: "Contact could not be updated." }
                format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @contacts.destroy
        respond_to do |format|
            format.html { redirect_to contacts_url }
            format.json { head :no_content }
        end
    end
    
    private
    def set_back_link
        go_back_link_to contacts_path
    end
    
    def set_contact
        @contacts = current_user.contacts.find(params[:id])
    end
    
    
    def contacts_params
        params.require(:contact).permit(:firstname)
    end

    

end
