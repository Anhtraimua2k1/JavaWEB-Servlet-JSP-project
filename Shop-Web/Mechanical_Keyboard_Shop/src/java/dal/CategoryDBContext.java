/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDBContext extends DBContext {

    public static void main(String[] args) {
        CategoryDBContext dbc = new CategoryDBContext();
        System.out.println("" + dbc.getAllCategories().get(0).getName());
        System.out.println("" + dbc.getCategoryById(5).getName());
    }

    /// funtion
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();

        try {

            String sql = "select * from Categories_HE151102";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setImg(rs.getString("img"));

                categories.add(c);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return categories;

    }

    public Category getCategoryById(int id) {
        Category c = new Category();

        try {
            String sql = "select * from Categories_HE151102 where id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setImg(rs.getString("img"));

                return c;

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return c;

    }

}
