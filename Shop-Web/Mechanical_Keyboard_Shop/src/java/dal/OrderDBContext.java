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
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDBContext extends DBContext {

    private Order_ItemBDContext orderItemDB = new Order_ItemBDContext();
    private AccountDBContext accDB = new AccountDBContext();

    public static void main(String[] args) {
        OrderDBContext orderDB = new OrderDBContext();

        System.out.println("" + orderDB.getAccountOrders("2").get(0).getOrderItems().get(0).getProduct().getName());
orderDB.createOrder("3");
    }

    public ArrayList<Order> getAccountOrders(String accId) {
        ArrayList<Order> orders = new ArrayList<>();

        try {
            int accountId = Integer.parseInt(accId);
            String sql = "select * from Orders_HE151102 o where o.acc_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setAcc(accDB.getAccount(rs.getString("acc_id")));
                o.setOrderItems(orderItemDB.getOrderItems(rs.getString("id")));
                o.setOrderDate(rs.getTimestamp("OrderDate"));
                o.setTotal(rs.getDouble("total"));
                orders.add(o);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return orders;

    }

    public Order getNewAccountOrder(String accId) {
        

        try {
            int accountId = Integer.parseInt(accId);
            String sql = "select top 1 * from Orders_HE151102 o where o.acc_id = ? order by o.id desc";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setAcc(accDB.getAccount(rs.getString("acc_id")));
                o.setOrderItems(orderItemDB.getOrderItems(rs.getString("id")));
                o.setOrderDate(rs.getTimestamp("OrderDate"));
                o.setTotal(rs.getDouble("total"));
               
                return o;
                
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;

    }
    
    public void updateTotalOrders() {

        try {
            String sql = "Update Orders_HE151102\n"
                    + "set total = (\n"
                    + "	select sum(p.price*oi.quantity)\n"
                    + "	from Order_Items_HE151102 oi left join Products_HE151102 p on oi.prod_id = p.id\n"
                    + "	where oi.order_id = Orders_HE151102.id\n"
                    + ")";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void createOrder(String acc_Id) {

        try {
            String sql = "insert into Orders_HE151102\n"
                    + "([acc_id])\n"
                    + "values(?);";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(acc_Id));
            stm.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
