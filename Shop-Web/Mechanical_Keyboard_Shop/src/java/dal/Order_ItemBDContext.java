/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Order;
import model.Order_Item;

/**
 *
 * @author Admin
 */
public class Order_ItemBDContext extends DBContext {

    private ProductDBContext productDB = new ProductDBContext();

    public static void main(String[] args) {
        Order_ItemBDContext orderItemDB = new Order_ItemBDContext();

        System.out.println("" + orderItemDB.getOrderItems("2").get(0).getProduct().getName());
    }

    public ArrayList<Order_Item> getOrderItems(String orderId) {
        ArrayList<Order_Item> orderItems = new ArrayList<>();

        try {
            int order = Integer.parseInt(orderId);
            String sql = "select * from Order_Items_HE151102 oi where oi.order_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, order);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Order_Item oi = new Order_Item();
                oi.setOrder(order);
                oi.setId(rs.getInt("id"));
                oi.setProduct(productDB.getProductsById(rs.getInt("prod_id")));
                oi.setQuantity(rs.getInt("quantity"));

                orderItems.add(oi);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orderItems;

    }

    public void createOrderItem(String orderId, String productId,  String quantity) {
        try {
            int order = Integer.parseInt(orderId);
            String sql = "insert into Order_Items_HE151102\n"
                    + "([order_id],\n"
                    + "[prod_id],\n"
                    + "[quantity]\n"
                    + ")\n"
                    + "values(?,?,?);";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(orderId));
            stm.setInt(2, Integer.parseInt(productId));
            stm.setInt(3, Integer.parseInt(quantity));
            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

}
