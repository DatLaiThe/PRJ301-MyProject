/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
        System.out.println("--------------------");
        for (Integer integer : work) {
            System.out.println(integer);
        }
        System.out.println("--------------------");
        return work;
    }
}
