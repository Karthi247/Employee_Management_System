package com.employeemanagement.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employeemanagement.model.Attendance;
import com.employeemanagement.model.AttendanceStatus;
import com.employeemanagement.model.Employee;
import com.employeemanagement.service.AttendanceService;
import com.employeemanagement.service.EmployeeService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private EmployeeService employeeService;

    // ✅ LIST PAGE
    @GetMapping
    public String listAttendance(Model model) {
        List<Attendance> attendanceList = attendanceService.findAll();
        model.addAttribute("attendanceList", attendanceList);
        return "attendance/list";
    }

    // ✅ ADD FORM
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("statuses", AttendanceStatus.values());
        model.addAttribute("attendance", new Attendance());
        model.addAttribute("employees", employeeService.getAllEmployees());
        return "attendance/form";
    }

    // ✅ SAVE NEW ATTENDANCE
    @PostMapping("/save")
    public String addAttendance(
            @RequestParam Long employeeId,
            @ModelAttribute Attendance attendance) {

        attendance.setEmployee(employeeService.getEmployeeById(employeeId));

        attendanceService.saveAttendance(attendance);
        return "redirect:/attendance";
    }

    // ✅ EDIT FORM (loads edit-attendance.jsp)
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Attendance attendance = attendanceService.getAttendanceById(id);

        model.addAttribute("attendance", attendance);
        model.addAttribute("statuses", AttendanceStatus.values());
        model.addAttribute("employees", employeeService.getAllEmployees());

        return "attendance/edit";  // ✅ This is your new edit page
    }

    // ✅ UPDATE ATTENDANCE (POST submission)
    @PostMapping("/update")
    public String updateAttendance(
            @RequestParam Long employeeId,
            @ModelAttribute Attendance attendance) {

        attendance.setEmployee(employeeService.getEmployeeById(employeeId));

        attendanceService.updateAttendance(attendance.getId(), attendance);
        return "redirect:/attendance";
    }

    // ✅ DELETE ATTENDANCE
    @GetMapping("/delete/{id}")
    public String deleteAttendance(@PathVariable Long id) {
        attendanceService.deleteAttendance(id);
        return "redirect:/attendance";
    }

    // ✅ EMPLOYEE-WISE ATTENDANCE LIST
    @GetMapping("/employee/{employeeId}")
    public String getEmployeeAttendance(@PathVariable Long employeeId, Model model) {
        Employee employee = employeeService.getEmployeeById(employeeId);
        List<Attendance> attendanceList = attendanceService.getAttendanceByEmployeeId(employeeId);

        model.addAttribute("employee", employee);
        model.addAttribute("attendanceList", attendanceList);

        return "attendance/employee";
    }

    // ✅ DATE RANGE REPORT
    @GetMapping("/report")
    public String getAttendanceReport(
            @RequestParam Long employeeId,
            @RequestParam LocalDate startDate,
            @RequestParam LocalDate endDate,
            Model model) {

        Employee employee = employeeService.getEmployeeById(employeeId);
        List<Attendance> attendanceList =
                attendanceService.getAttendanceByDateRange(employeeId, startDate, endDate);

        model.addAttribute("employee", employee);
        model.addAttribute("attendanceList", attendanceList);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return "attendance/report";
    }
}
