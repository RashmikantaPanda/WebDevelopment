package org.oupp.resturant.model;

import java.sql.Time;
import java.util.Date;

public class TableBooking {
    int bookingId;
    int custId;
    Date date;
    Time time;
    int partySize;
    String customerName;
    String phoneno;
    int tableId;
    int status;
    String remark;
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public TableBooking(int custId, Date date, Time time, int partySize, String customerName, String phoneno, int tableId, int status, String remark) {
        this.custId = custId;
        this.date = date;
        this.time = time;
        this.partySize = partySize;
        this.customerName = customerName;
        this.phoneno = phoneno;
        this.tableId = tableId;
        this.status = status;
        this.remark = remark;
    }

    public TableBooking() {
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getPartySize() {
        return partySize;
    }

    public void setPartySize(int partySize) {
        this.partySize = partySize;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    @Override
    public String toString() {
        return "TableBooking{" +
                "bookingId=" + bookingId +
                ", custId=" + custId +
                ", date=" + date +
                ", time=" + time +
                ", partySize=" + partySize +
                ", customerName='" + customerName + '\'' +
                ", phoneno='" + phoneno + '\'' +
                ", tableId=" + tableId +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                '}';
    }
}
