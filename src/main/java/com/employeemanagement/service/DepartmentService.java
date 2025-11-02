package com.employeemanagement.service;

import java.util.List;

import com.employeemanagement.model.Department;

public interface DepartmentService {
    Department saveDepartment(Department department);
    Department getDepartmentById(Long id);
    List<Department> getAllDepartments();
    Department updateDepartment(Long id, Department department);
    void deleteDepartment(Long id);
}