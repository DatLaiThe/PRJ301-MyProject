/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Employee;
import model.Holiday;
import model.TimeSheet;

/**
 *
 * @author Dat Lai
 */
public class Calculate {

    public List<Integer> getWorkDay(List<TimeSheet> t, List<Holiday> h) {
        int normal = 0;
        int weekend = 0;
        int holi = 0;
        for (TimeSheet time : t) {
            Date d = DateTimeHelper.removeTime(time.getCheckin());
            int day = DateTimeHelper.getDayOfWeek(time.getCheckin());
            if (day == 1 || day == 7) {
                weekend++;
            } else if (DateTimeHelper.isHoliday(h, d)) {
                holi++;
            } else {
                normal++;
            }
        }
        List<Integer> work = new ArrayList<>();
        work.add(normal);
        work.add(weekend);
        work.add(holi);
        return work;
    }

    public List<Integer> getAbsentDay(Employee e, List<Holiday> h, List<Date> d) {
        List<Integer> absentDay = new ArrayList<>();
        int request = 0;
        int absent = 0;
        int holiday = 0;
        for (Date date : d) {
        }
        for (Date date : d) {
            int day = DateTimeHelper.getDayOfWeek(date);
            if (DateTimeHelper.isInTimeSheet(e.getTimesheets(), date)) {
                continue;
            }
            if (DateTimeHelper.isInRequest(e.getRequests(), date)) {
                request++;
            } else if (day != 1 && day != 7) {
                if (DateTimeHelper.isHoliday(h, date)) {
                    holiday++;
                } else {
                    absent++;
                }
            }
        }

        absentDay.add(absent);
        absentDay.add(request);
        absentDay.add(holiday);

        return absentDay;
    }

    public int TotalWorkDay(List<Integer> t) {
        int sum = 0;
        if (t == null) {
            return 0;
        }
        for (Integer i : t) {
            sum += i;
        }
        return sum;
    }

    public float TotalEffort(List<Integer> w, List<Integer> a) {
        if (w == null || a == null) {
            return 0;
        }
        return (float) (w.get(0) + w.get(1) * 1.0f * 1.5 + w.get(2) * 1.0f * 3 + a.get(1) + a.get(2));
    }

    public int dayWorkingInMonth(List<Date> d) {
        int count = 0;
        for (Date date : d) {
            int day = DateTimeHelper.getDayOfWeek(date);
            if (day != 1 && day != 7) {
                count++;
            }
        }
        return count;
    }

    public float CalSalary(List<Integer> w, List<Integer> a, float salary, int dayWorking) {
        float sal = (salary * TotalEffort(w, a)) / dayWorking;
        
        return (float) Math.round(sal *100) /100;
    }
}
