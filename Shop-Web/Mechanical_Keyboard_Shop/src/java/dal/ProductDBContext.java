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
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDBContext extends DBContext {

    public static void main(String[] args) {
        ProductDBContext pdb = new ProductDBContext();

        System.out.println("" + pdb.getAllProducts().get(0).getId());
        System.out.println("" + pdb.getTopSellProducts().get(0).getName());
        System.out.println("" + pdb.getSearchPaggingProducts(9, 1, "%%", "").get(8).getName());
//        System.out.println("" + pdb.getRowCount("%%"));
    }

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "select p.* ,c_name = c.[name], c_description= c.[description] , c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ArrayList<Product> getPageProducts(int Size, int Index) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "declare @PageSize int = ?;\n"
                    + "declare @PageIndex int = ?;\n"
                    + "with t as(\n"
                    + "	select [stt] = ROW_NUMBER() Over (order by p.id), p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	), s as(\n"
                    + "		select  p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "		from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	)\n"
                    + "\n"
                    + "select s.*\n"
                    + "from t join s on t.id =s.id\n"
                    + "where stt >= (@PageIndex-1)*@PageSize + 1 and stt <= @PageIndex * @PageSize";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, Size);
            stm.setInt(2, Index);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public ArrayList<Product> getRandomAllProducts() {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "select p.* ,c_name = c.[name], c_description= c.[description] , c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "order by NEWID()"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public ArrayList<Product> getProductsByCategoryId(int c_id) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "where p.c_id = ?\n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, c_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public ArrayList<Product> getRandomProductsByCategoryId(int c_id) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "where p.c_id = ?\n"
                    + "order by NEWID()"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, c_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public Product getProductsById(int id) {

        try {
            String sql = "select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "where p.id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);
                return p;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;

    }

    public ArrayList<Product> getRelatedProducts(int id) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "------------------	\n"
                    + "with t as(\n"
                    + "	select  p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img, a.[value]\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	CROSS APPLY STRING_SPLIT(p.keyword, ',') as a\n"
                    + "	where a.[value] = any (\n"
                    + "			select distinct  a.[value]\n"
                    + "			from Products_HE151102 p\n"
                    + "			CROSS APPLY STRING_SPLIT(p.keyword, ',') as a\n"
                    + "			where p.id = ?\n"
                    + "		)\n"
                    + "), s as(\n"
                    + "select top 100 p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "where p.id = any (\n"
                    + "	select distinct t.id\n"
                    + "	from t)\n"
                    + "order by newid()\n"
                    + ")\n"
                    + "select * from s\n"
                    + "union\n"
                    + "select  p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public Product getProductsByName(String name) {

        try {
            String sql = "select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "where p.[name] like \n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);
                return p;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;

    }

    public ArrayList<Product> getTop3SellByCategoryId(int c_id) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = " with t as (\n"
                    + "	 select p.id, selled = sum (oi.quantity) \n"
                    + "	from Products_HE151102 p left join Order_Items_HE151102 oi on p.id = oi.prod_id\n"
                    + "	where p.c_id = ?\n"
                    + "	group by p.id \n"
                    + " )\n"
                    + "	select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	where p.id = any (\n"
                    + "		select top 3 t.id\n"
                    + "		from t\n"
                    + "		order by selled desc\n"
                    + "\n"
                    + "	)\n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, c_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public ArrayList<Product> getTopSellProducts() {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "select p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img , selled = sum (isNull(oi.quantity,0))\n"
                    + "from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "left join Order_Items_HE151102 oi on p.id = oi.prod_id\n"
                    + "group by p.id, p.[name], p.[description], p.brand, p.price, p.keyword, p.c_id, p.img_1, p.img_2, p.img_3, p.created_at ,c.[name], c.[description], c.img \n"
                    + "order by selled desc";
            PreparedStatement stm = con.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public ArrayList<Product> getTop3NewByCategoryId(int c_id) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "	select top 3 p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	where p.c_id = ? \n"
                    + "	order by p.created_at desc\n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, c_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public int getRowCount() {
        int count = 0;
        try {

            String sql = "with t as(\n"
                    + "	select [stt] = ROW_NUMBER() Over (order by p.id), p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	)\n"
                    + "select count(*)\n"
                    + "from t;";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return count;
    }

    public int getRowCount(String category, String search) {
        int count = 0;
        try {

            String sql = "with t as(\n"
                    + "	select [stt] = ROW_NUMBER() Over (order by p.id), p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	where p.c_id like ? and (p.[name] like ? or c.[name] like ? or p.[description] like ? )\n"
                    + "	)\n"
                    + "select count(*)\n"
                    + "from t;";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, category.equals("0") ? "%%" : category);
            stm.setString(2, "%" + search + "%");
            stm.setString(3, "%" + search + "%");
            stm.setString(4, "%" + search + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return count;
    }

    public ArrayList<Product> getSearchPaggingProducts(int size, int index, String c_id, String search) {
        ArrayList<Product> products = new ArrayList<>();

        try {

            String sql = "declare @PageSize int = ?;\n"
                    + "declare @PageIndex int = ?;\n"
                    + "with t as(\n"
                    + "	select  p.* ,c_name = c.[name], c_description= c.[description],  c_img = c.img\n"
                    + "	from Products_HE151102 p left join Categories_HE151102 c on p.c_id = c.id\n"
                    + "	where  p.c_id like ? and (p.[name] like ? or c.[name] like ? or p.[description] like ? )\n"
                    + "\n"
                    + "	), s as(\n"
                    + "	select [stt] = ROW_NUMBER() Over (order by t.id), t.*\n"
                    + "	from t\n"
                    + "		\n"
                    + "	)\n"
                    + "\n"
                    + "select s.*\n"
                    + "from s join t on t.id =s.id\n"
                    + "where stt >= (@PageIndex-1)*@PageSize + 1 and stt <= @PageIndex * @PageSize \n"
                    + ";";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, size);
            stm.setInt(2, index);
            stm.setString(3, c_id.equals("0") ? "%%" : c_id);
            stm.setString(4, "%" + search + "%");
            stm.setString(5, "%" + search + "%");
            stm.setString(6, "%" + search + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setBrand(rs.getString("brand"));
                p.setPrice(rs.getDouble("price"));
                p.setImg_1(rs.getString("img_1"));
                p.setImg_2(rs.getString("img_2"));
                p.setImg_3(rs.getString("img_3"));
                p.setCreated_at(rs.getTimestamp("created_at"));
                p.setKeyword(rs.getString("keyword"));

                Category c = new Category();
                c.setId(rs.getInt("c_id"));
                c.setName(rs.getString("c_name"));
                c.setDescription(rs.getString("c_description"));
                c.setImg(rs.getString("c_img"));
                p.setCategory(c);

                products.add(p);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return products;

    }

    public void createProducts(String name, String description, String brand, String price, String c_id, String img_1, String img_2, String img_3) {
        try {

            String sql = "insert into Products_HE151102\n"
                    + "([name],\n"
                    + "[description],\n"
                    + "[brand],\n"
                    + "[price],\n"
                    + "[c_id],\n"
                    + "[img_1],\n"
                    + "[img_2],\n"
                    + "[img_3])\n"
                    + "values(?, ?, ?, ?, ?, ?, ?, ? );";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, brand);
            stm.setDouble(4, Double.parseDouble(price));
            stm.setInt(5, Integer.parseInt(c_id));
            stm.setString(6, img_1);
            stm.setString(7, img_2);
            stm.setString(8, img_3);

            stm.executeQuery();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void updateProducts(String id, String name, String description, String brand, String price, String c_id, String img_1, String img_2, String img_3) {
        try {

            String sql = "UPDATE Products_HE151102\n"
                    + "SET [name] = ?,\n"
                    + "[description] = ?,\n"
                    + "[brand] = ?,\n"
                    + "[price] = ?,\n"
                    + "[c_id] = ?,\n"
                    + "[img_1] = ?,\n"
                    + "[img_2] = ?,\n"
                    + "[img_3] = ?\n"
                    + "WHERE id = ?;";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, brand);
            stm.setDouble(4, Double.parseDouble(price));
            stm.setInt(5, Integer.parseInt(c_id));
            stm.setString(6, img_1);
            stm.setString(7, img_2);
            stm.setString(8, img_3);
            stm.setInt(9, Integer.parseInt(id));

            stm.executeQuery();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void deleteProducts(String id) {
        try {

            String sql = "delete [Products_HE151102] where id like ?;";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, id);

            stm.executeQuery();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
