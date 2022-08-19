/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Dat Lai
 */
public class Employee {

    private int eid;
    private String ename;
    private int pid;
    private Position pos;
    private List<TimeSheet> timesheets;
    private List<Request> requests;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Position getPos() {
        return pos;
    }

    public void setPos(Position pos) {
        this.pos = pos;
    }

    public List<TimeSheet> getTimesheets() {
        return timesheets;
    }

    public void setTimesheets(List<TimeSheet> timesheets) {
        this.timesheets = timesheets;
    }

    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }

    public TimeSheet getTimeSheet(Date d) {
        for (TimeSheet t : this.timesheets) {
            if(t.getCidate().equals(d)) {
                return t;
            }
        }
        return null;
    }
}
