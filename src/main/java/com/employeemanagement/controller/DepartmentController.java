package com.employeemanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.employeemanagement.model.Department;
import com.employeemanagement.model.Employee;
import com.employeemanagement.service.DepartmentService;
import com.employeemanagement.service.EmployeeService;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String listDepartments(Model model) {
        List<Department> departments = departmentService.getAllDepartments();
        model.addAttribute("departments", departments);
        return "department/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("department", new Department());
        return "department/form";
    }

    @PostMapping("/save")
    public String addDepartment(@ModelAttribute Department department) {
        departmentService.saveDepartment(department);
        return "redirect:/departments";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Department department = departmentService.getDepartmentById(id);
        model.addAttribute("department", department);
        return "department/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateDepartment(@PathVariable Long id, @ModelAttribute Department department) {
        departmentService.updateDepartment(id, department);
        return "redirect:/departments";
    }

    @GetMapping("/delete/{id}")
    public String deleteDepartment(@PathVariable Long id) {
        departmentService.deleteDepartment(id);
        return "redirect:/departments";
    }

    @GetMapping("/departments/{id}/employees")
public String viewEmployeesByDepartment(@PathVariable Long id, Model model) {
    Department dept = departmentService.getDepartmentById(id);

    if (dept == null) {
        return "redirect:/departments"; // if not found
    }
    List<Employee> employees = employeeService.getEmployeesByDepartment(id);

    model.addAttribute("department", dept);
    model.addAttribute("employees", employees);

    return "department/department-employees";   // ✅ JSP page name
}

}