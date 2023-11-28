class GroupsController < ApplicationController


    def index
        if user_signed_in?
            @groups = current_user.groups
        else
            @groups = []
            redirect_to new_user_session_path
        end
    end


end
