package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.Employee;

public interface EmpService  {

	public Employee authenticate(String email);
	
	public boolean addEmployeeService(Employee emp);
	public List<Employee> getAllEmployeService();
	public boolean deleteEmployee(String email);
	public boolean updateEmployeeService(Employee emp);
}
