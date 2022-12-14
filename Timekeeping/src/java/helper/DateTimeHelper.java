/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.DayType;
import model.Holiday;
import model.Request;
import model.TimeSheet;

/**
 *
 * @author Ngo Tung Son
 */
public class DateTimeHelper {

    //Lay ve date sau n days
    public static Date addDays(Date date, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, days);
        Date d = c.getTime();
        return d;
    }

    // lay ve month sau n months
    public static Date addMonths(Date date, int months) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.MONTH, months);
        Date d = c.getTime();
        return d;
    }

    //Xoa time cua datetime
    public static Date removeTime(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
        c.set(Calendar.MILLISECOND, 0);
        return c.getTime();
    }

    // Tinh so gio lam viec
    public static float diffHours(Date end, Date start) {
        long diff = end.getTime() - start.getTime();
        float hours = ((diff / 1000) * (1.0f)) / 3600;
        return hours;
    }

    //Lay thang trong ngay
    public static int getDayOfMonth(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        return c.get(Calendar.DAY_OF_MONTH);
    }

    //lay ngay trong tuan => Thu
    public static int getDayOfWeek(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        return c.get(Calendar.DAY_OF_WEEK);
    }

    //Lay kieu timeStamp
    public static Timestamp getTimeStamp(Date data) {
        return new Timestamp(data.getTime());
    }

    //Lay ve tat ca ngay trong khong from to
    public static ArrayList<Date> getDates(Date from, Date to) {
        ArrayList<Date> dates = new ArrayList<>();
        int day = 0;
        while (true) {
            Date d = addDays(from, day);
            day++;
            dates.add(d);
            if (d.getTime() - to.getTime() == 0) {
                break;
            }
        }
        return dates;
    }

    public static boolean isLate(TimeSheet t) {
        Date inOnTime = new Date(t.getCheckin().getTime());
        inOnTime.setHours(8);
        inOnTime.setMinutes(0);
        Date OutOnTime = new Date(t.getCheckout().getTime());
        OutOnTime.setHours(17);
        OutOnTime.setMinutes(00);
        if (t.getCheckin().getTime() - inOnTime.getTime() > 600000
                || (t.getCheckout().getTime() - OutOnTime.getTime() < -600000)) {
            return true;
        }
        return false;
    }

    public static TimeSheet isInTimeSheet(List<TimeSheet> t, Date d) {
        for (TimeSheet ts : t) {
            if (ts.getCidate().equals(d)) {
                return ts;
            }
        }
        return null;
    }

    public static boolean isInRequest(List<Request> r, Date d) {
        for (Request ts : r) {
            if (ts.getFrom().compareTo(d) <= 0 && ts.getTo().compareTo(d) >= 0) {
                return true;
            }
        }
        return false;
    }

    public static boolean isHoliday(List<Holiday> t, Date d) {
        for (Holiday h : t) {
            if (h.getFrom().compareTo(d) <= 0 && h.getTo().compareTo(d) >= 0) {
                return true;
            }
        }
        return false;
    }

    public static boolean isWeekend(Date d) {
        int day = getDayOfWeek(d);
        return (day == 1 || day == 7) ? true : false;
    }

    public static DayType getDayType(TimeSheet t, Date d, List<Holiday> hl, List<Request> r) {
        DayType dt = new DayType();
        if (t != null) {
            if (isWeekend(d)) {
                dt.setTypeClass("weekend");
                dt.setEffort(1.5f);
            } else if (isHoliday(hl, d)) {
                dt.setTypeClass("holiday");
                dt.setEffort(3);
            } else {
                dt.setTypeClass("normal");
                dt.setEffort(1);
            }
            if (isLate(t)) {
                dt.setEffort(0);
                dt.setLate(true);
            }
        } else {
            if (isWeekend(d)) {
                dt.setTypeClass("weekend");
                dt.setEffort(0);
            } else if (isInRequest(r, d)) {
                dt.setTypeClass("request");
                dt.setEffort(1);
            } else if (isHoliday(hl, d)) {
                dt.setTypeClass("holiday");
                dt.setEffort(1);
            } else {
                dt.setTypeClass("absent");
                dt.setEffort(0);
            }
        }

        return dt;
    }

    public static List<DayType> getAllDayType(List<Date> date, List<TimeSheet> time, List<Holiday> hl, List<Request> r) {
        List<DayType> l = new ArrayList<>();
        for (Date d : date) {
            TimeSheet t = isInTimeSheet(time, d);
            l.add(getDayType(t, d, hl, r));
        }
        return l;
    }
    
    
}
