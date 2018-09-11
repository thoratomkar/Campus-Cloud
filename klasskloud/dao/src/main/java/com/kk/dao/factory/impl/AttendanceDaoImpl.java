package com.kk.dao.factory.impl;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.AttendanceDao;
import com.kk.dao.model.Attendance;

@Repository("attendanceDao")
public class AttendanceDaoImpl  extends GenericDaoImpl<Attendance, Long> implements AttendanceDao{

}
