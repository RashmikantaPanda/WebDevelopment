package org.oupp.hospital.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Appointment {
    int id;
    int patientId;
    String patientName;
    String patientEmail;
    String doctorName;
    String disease;
    Date date;
    Time time;
    String address;
    String status;
    String remark;
}
