/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import model.Schedule;

/**
 *
 * @author Admin
 */
public class scheduleDB extends DBContext{
    public static void main(String[] args) {
        scheduleDB scheduleDB = new scheduleDB();
        
        
        System.out.println("" + scheduleDB.getSchedules().get(0).getStart());
    }
    
    public ArrayList<Schedule> getSchedules() {
        ArrayList<Schedule> schedules = new ArrayList<>();
        try {

            String sql = "select * from Schedule s";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Schedule s = new Schedule();
                s.setId(rs.getInt("id"));
                s.setStart(Time.valueOf(rs.getString("start")));
                s.setEnd(Time.valueOf(rs.getString("end")));

                schedules.add(s);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return schedules;
    }
}