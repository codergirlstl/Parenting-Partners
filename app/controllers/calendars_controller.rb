class CalendarsController < ApplicationController
    before_action :require_user

# GET /meetings
# GET /meetings.json
def index
    @calendars = Calendar.all
end

# GET /meetings/1
# GET /meetings/1.json
def show
end

# GET /meetings/new
def new
    @calendar = Calendar.new
end

# GET /meetings/1/edit
def edit
end

# POST /meetings
# POST /meetings.json
def create
    @calendar = Calendar.new(meeting_params)
    
    respond_to do |format|
        if @calendar.save
            format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
            format.json { render :show, status: :created, location: @calendar}
            else
            format.html { render :new }
            format.json { render json: @calendar.errors, status: :unprocessable_entity }
        end
    end
end

# PATCH/PUT /meetings/1
# PATCH/PUT /meetings/1.json
def update
    respond_to do |format|
        if @calendar.update(meeting_params)
            format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
            format.json { render :show, status: :ok, location: @calendar }
            else
            format.html { render :edit }
            format.json { render json: @calendar.errors, status: :unprocessable_entity }
        end
    end
end

# DELETE /meetings/1
# DELETE /meetings/1.json
def destroy
    @calendar.destroy
    respond_to do |format|
        format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
        format.json { head :no_content }
    end
end


private
# Use callbacks to share common setup or constraints between actions.
def set_meeting
    @meeting = Meeting.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def meeting_params
    params.require(:meeting).permit(:name, :start_time)
end

end






