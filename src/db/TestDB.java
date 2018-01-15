package db;

import java.sql.*;


public class TestDB {

    public void createDatabase(){
        String driver = "org.apache.derby.jdbc.EmbeddedDriver";//在derby.jar里面

        String dbName = "/Users/apple/Documents/IdeaProjects/ScenicSpots/SpotsInfo";

        String dbURL = "jdbc:derby:" + dbName + ";user=root;password=root;create=true";//create=true表示当数据库不存在时就创建它

        try {

            Class.forName(driver);

            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


            st.execute("create table NodeInfo (name VARCHAR(30) NOT NULL,des VARCHAR(30) NOT NULL,pop INT NOT NULL,hasRest INT NOT NULL,hasToilet INT NOT NULL,x INT NOT NULL,y INT NOT NULL)");//创建foo表
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('北门','景点入口', 84, 1, 1 ,330, 70)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('狮子山', '山', 72, 1, 0, 170, 110)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('仙云石', '石头', 71, 0, 0, 470, 100)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('一线天', '悬崖', 99, 0, 0, 105, 240)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('飞流瀑', '瀑布', 73, 0, 0, 270, 200)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('仙武湖', '湖', 96, 1, 1, 420, 220)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('九曲桥', '桥', 81, 0, 0, 570, 270)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('花卉园', '园' ,66, 1 ,1, 130 ,390)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('观云台', '楼阁', 82, 1 ,1 ,220, 300)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('朝日峰', '峰', 77, 1, 1 ,480, 400)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('碧水潭', '亭', 63 ,1, 1 ,370, 310)");//插入一条数据
            st.executeUpdate("insert into NodeInfo(name,des,pop,hasRest,hasToilet,x,y) values ('红叶亭' ,'亭' ,60, 1, 1, 300, 430)");//插入一条数据
            ResultSet rsn = st.executeQuery("select * from NodeInfo");//读取刚插入的数据

            while (rsn.next()) {

                String name = rsn.getString(1);
                String des = rsn.getString(2);
                int pop = rsn.getInt(3);
                int hasRest = rsn.getInt(4);
                int hasToilet = rsn.getInt(5);
                int x = rsn.getInt(6);
                int y = rsn.getInt(7);

                System.out.println("name:" + name + ";des:" + des + ";pop:" + pop + ";hasRest:" + hasRest + ";hasToilet:" + hasToilet + ";x:" + x + ";y:" + y);

            }


            Connection conn2 = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st2 = conn2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            st2.execute("create table EdgeInfo (start VARCHAR(30) NOT NULL,end1 VARCHAR(30) NOT NULL,weight INT NOT NULL,time INT NOT NULL)");//创建foo表
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('北门', '狮子山', 9, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('北门', '仙云石', 8, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('狮子山', '一线天', 7, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('狮子山', '飞流瀑', 6,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('仙云石', '仙武湖', 4 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('仙云石', '九曲桥',5 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('仙武湖', '九曲桥', 7 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('一线天', '观云台', 11 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('飞流瀑', '观云台', 3 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('一线天', '花卉园', 10, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('观云台', '红叶亭', 15, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('花卉园', '红叶亭' ,9 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('红叶亭', '朝日峰', 10, 10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('九曲桥', '朝日峰', 20 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('观云台', '碧水潭', 16 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('仙武湖', '碧水潭', 20 ,10)");//插入一条数据
            st2.executeUpdate("insert into EdgeInfo(start,end1,weight,time) values ('朝日峰', '碧水潭', 17, 10)");//插入一条数据
            ResultSet rse = st2.executeQuery("select * from EdgeInfo");//读取刚插入的数据

            while (rse.next()) {

                String start = rse.getString(1);

                String end = rse.getString(2);

                int weight = rse.getInt(3);
                int time = rse.getInt(4);

                System.out.println("start:" + start + ";end:" + end + ";weight:" + weight + ";time:" + time);


                conn.close();
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    public static void main(String[] args) {

    }
}
