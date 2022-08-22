/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dat Lai
 */
public class ListSumMonth {

    private int late = 0, normal = 0, weekend = 0,
            workHoliday = 0, holiday = 0, request = 0,
            absent = 0, workDay = 0;

    private float effort = 0, salary = 0;

    public void addSM(SumMonth s) {
        this.listSM.add(s);
    }

    public void addSalary(float s) {
        this.salary += s;
    }

    public void countTotal() {
        for (SumMonth s : listSM) {
            this.late += s.getLate();
            this.normal += s.getNormal();
            this.weekend += s.getWeekend();
            this.workHoliday += s.getWorkHoliday();
            this.holiday += s.getHoliday();
            this.request += s.getAbsent();
            this.effort += s.getEffort();
            this.workDay += s.calWorkDay();
        }
    }

    public float getSalary() {
        return (float) Math.round(this.salary * 100) / 100;
    }

    public int getWorkDay() {
        return workDay;
    }

    public List<SumMonth> getListSM() {
        return listSM;
    }
    private List<SumMonth> listSM = new ArrayList();

    public int getLate() {
        return late;
    }

    public int getNormal() {
        return normal;
    }

    public int getWeekend() {
        return weekend;
    }

    public int getWorkHoliday() {
        return workHoliday;
    }

    public int getHoliday() {
        return holiday;
    }

    public int getRequest() {
        return request;
    }

    public int getAbsent() {
        return absent;
    }

    public float getEffort() {
        return effort;
    }

}
