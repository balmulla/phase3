module DemosHelper
    def login(employee)
        session[:employee_id] = employee.id
    end
    
    def current_employee
        @current_employee ||= Employee.find_by(id: session[:employee_id])
    end
    
    def logged_in?
       !current_employee.nil?
    end
    
    def logout
        session.delete(:employee_id)
        @current_employee = nil
    end
end
