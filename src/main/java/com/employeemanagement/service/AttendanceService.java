package com.employeemanagement.service;

import java.time.LocalDate;
import java.util.List;

import com.employeemanagement.model.Attendance;

public interface AttendanceService {
    List<Attendance> findAll();
    Attendance saveAttendance(Attendance attendance);
    Attendance getAttendanceById(Long id);
    List<Attendance> getAttendanceByEmployeeId(Long employeeId);
    List<Attendance> getAttendanceByDateRange(Long employeeId, LocalDate startDate, LocalDate endDate);
    Attendance updateAttendance(Long id, Attendance attendance);
    void deleteAttendance(Long id);

}
