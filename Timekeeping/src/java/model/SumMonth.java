/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Dat Lai
 */
public class SumMonth {

    private int late, normal, weekend, workHoliday, holiday, request, absent;
    private float effort;

    public SumMonth(int late, int normal, int weekend, int workHoliday, int holiday, int request, int absent, float efort) {
        this.late = late;
        this.normal = normal;
        this.weekend = weekend;
        this.workHoliday = workHoliday;
        this.holiday = holiday;
        this.request = request;
        this.absent = absent;
        this.effort = efort;
    }

    public int calWorkDay() {
        return this.normal + this.weekend + this.workHoliday;
    }

    public int getLate() {
        return late;
    }

    public void setLate(int late) {
        this.late = late;
    }

    public int getNormal() {
        return normal;
    }

    public void setNormal(int normal) {
        this.normal = normal;
    }

    public int getWeekend() {
        return weekend;
    }

    public void setWeekend(int weekend) {
        this.weekend = weekend;
    }

    public int getWorkHoliday() {
        return workHoliday;
    }

    public void setWorkHoliday(int workHoliday) {
        this.workHoliday = workHoliday;
    }

    public int getHoliday() {
        return holiday;
    }

    public void setHoliday(int holiday) {
        this.holiday = holiday;
    }

    public int getRequest() {
        return request;
    }

    public void setRequest(int request) {
        this.request = request;
    }

    public int getAbsent() {
        return absent;
    }

    public void setAbsent(int absent) {
        this.absent = absent;
    }

    public float getEffort() {
        return effort;
    }

    public void setEffort(float effort) {
        this.effort = effort;
    }

}
