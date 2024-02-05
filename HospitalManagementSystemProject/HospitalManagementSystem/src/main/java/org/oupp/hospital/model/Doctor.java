package org.oupp.hospital.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctor {
    int id;
    String name;
    String email;
    String phone;
    String specialization;
    String password;
}
