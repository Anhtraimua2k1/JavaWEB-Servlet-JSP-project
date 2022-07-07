/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Teacher;

/**
 *
 * @author Admin
 */
public class TeacherDB extends DBContext{
    
    public static void main(String[] args) {
        TeacherDB teacherDB = new TeacherDB();
        System.out.println(""+ teacherDB.getTeachers().get(0).getAchievement());
    }
    
    public ArrayList<Teacher> getTeachers() {
        ArrayList<Teacher> teachers = new ArrayList<>();
        try {

            String sql = "select * from Teacher t";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setPosition(rs.getString("position"));
                t.setGender(rs.getBoolean("gender"));
                t.setImg(rs.getString("img"));
                t.setInstruction(rs.getString("instruction"));
                t.setAchievement(rs.getString("achievement"));
                teachers.add(t);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return teachers;
    }
    
}
