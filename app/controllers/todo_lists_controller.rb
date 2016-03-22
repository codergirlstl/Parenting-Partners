class TodoListsController < ApplicationController
    before_action :require_user
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy, :email]
    before_action :set_back_link, except: [:index]
    
    def index
        @todo_lists = current_user.todo_lists
    end
    
    def new
        @todo_list = current_user.todo_lists.new
    end
    
    def edit
    end
    
    def create
        @todo_list = current_user.todo_lists.new(todo_list_params)
        
        respond_to do |format|
            if @todo_list.save
                format.html { redirect_to todo_list_todo_items_path(@todo_list), notice: 'Request list was successfully created.' }
                format.json { render action: 'show', status: :created, location: @todo_list }
                else
                format.html { render action: 'new', error: "Request list could not be created." }
                format.json { render json: @todo_list.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @todo_list.update(todo_list_params)
                format.html { redirect_to todo_list_todo_items_path(@todo_list), success: 'Request list was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: 'edit', error: "Request list could not be updated." }
                format.json { render json: @todo_list.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @todo_list.destroy
        respond_to do |format|
            format.html { redirect_to todo_lists_url }
            format.json { head :no_content }
        end
    end
    
    def email
        destination = params[:to]
        notifier = Notifier.todo_list(@todo_list, destination)
        if destination =~ /@/ && notifier.deliver
            redirect_to todo_list_todo_items_path(@todo_list), success: "Request list sent."
            else
            redirect_to todo_list_todo_items_path(@todo_list), error: "Request list could not be sent."
        end
    end
    
    private
    def set_back_link
        go_back_link_to todo_lists_path
    end
    
    def set_todo_list
        @todo_list = current_user.todo_lists.find(params[:id])
    end
    

    def todo_list_params
        params.require(:todo_list).permit(:title)
    end
end
