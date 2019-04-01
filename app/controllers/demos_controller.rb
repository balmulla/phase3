class DemosController < ApplicationController
    def new
    end
    
    def create
       employee = Employee.find_by(ssn: params[:demo][:ssn])
       if employee && employee.authenticate(params[:demo][:password])
           login(employee)
           redirect_to employee
       else
           flash.now[:danger] = "Invalid Social Security Number or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to root_url
    end
end
