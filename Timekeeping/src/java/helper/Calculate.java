/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import static helper.DateTimeHelper.getDayType;
import static helper.DateTimeHelper.isInTimeSheet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.DayType;
import model.Employee;
import model.Holiday;
import model.Request;
import model.SumMonth;
import model.TimeSheet;

/**
 *
 * @author Dat Lai
 */
public class Calculate {

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

    public float CalSalary(float effort, float salary, int dayWorking) {
        float sal = (salary * effort) / dayWorking;
        return (float) Math.round(sal * 100) / 100;
    }

    public SumMonth calAll(List<Date> date, List<TimeSheet> time, List<Holiday> hl, List<Request> r) {
        List<DayType> dt = new ArrayList<>();
        for (Date d : date) {
            TimeSheet t = isInTimeSheet(time, d);
            dt.add(getDayType(t, d, hl, r));
        }
        int late = 0, normal = 0, weekend = 0, workHoliday = 0, holiday = 0, request = 0, absent = 0;
        float effort = 0;
        for (DayType d : dt) {
            switch (d.getTypeClass()) {
                case "normal":
                    normal++;
                    if (!d.isLate()) {
                        effort += d.getEffort();
                    } else {
                        late++;
                    }
                    break;
                case "weekend":
                    if (d.getEffort() != 0) {
                        weekend++;
                        if (!d.isLate()) {
                            effort += d.getEffort();
                        } else {
                            late++;
                        }
                    }
                    break;
                case "holiday":
                    if (d.getEffort() == 1) {
                        holiday++;
                        effort += d.getEffort();
                    } else {
                        workHoliday++;
                        if (!d.isLate()) {
                            effort += d.getEffort();
                        } else {
                            late++;
                        }
                    }
                    break;
                case "request":
                    request++;
                    effort += d.getEffort();
                    break;
                case "absent":
                    absent++;
                    break;
                default:
                    throw new AssertionError();
            }
        }

        SumMonth s = new SumMonth(late, normal, weekend, workHoliday, holiday, request, absent, effort);
        return s;
    }
}
