class DemosController < ApplicationController
    def new
    end
    
    def create
       employee = Employee.find_by(phone: params[:demo][:phone]) 
       if employee && employee.authenticate(params[:demo][:password])
           login(employee)
           redirect_to employee
       else
           flash.now[:danger] = "Invalid phone or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to root_url
    end
end
