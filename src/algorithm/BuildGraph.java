package algorithm;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import util.Constants;
import util.Integrated;
import datastructure.ALGraph;
import datastructure.ArcNode;
import datastructure.VNode;


public class BuildGraph {
    public void setGraph(ALGraph graph) {
        this.graph = graph;
    }

    private ALGraph graph;
    private String driver = "org.apache.derby.jdbc.EmbeddedDriver";//在derby.jar里面
    private String dbName = "/Users/apple/Documents/IdeaProjects/ScenicSpots/SpotsInfo";
    private String dbURL = "jdbc:derby:" + dbName + ";user=root;password=root;create=true";//create=true表示当数据库不存在时就创建它
    private int arcNum;
    private int vetNum;

    public BuildGraph() {

        try {

            Class.forName(driver);

            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库

            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            ResultSet rsn = st.executeQuery("select * from NodeInfo");//读取刚插入的数据
            rsn.last(); //移到最后一行
            arcNum = rsn.getRow(); //得到当前行号，也就是记录数
            rsn.beforeFirst(); //如果还要用结果集，就把指针再移到初始化的位置

            ResultSet rse = st.executeQuery("select * from EdgeInfo");//读取刚插入的数据
            rse.last(); //移到最后一行
            vetNum = rse.getRow(); //得到当前行号，也就是记录数
            rse.beforeFirst(); //如果还要用结果集，就把指针再移到初始化的位置

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        Integrated.setGraph(arcNum, vetNum);
        graph = Integrated.getGraph();

    }

    /**
     * This function is used to read the information of the attractions
     * and edges in the file and store the graph with an adjacent list
     */
    public void createGraph() {
        String tmp, infos[];
        String name, des;
        int pop;
        boolean hasRest, hasToilet;
        String from, to;
        int dis, time;
        int cou;
        int x, y;

        try {

            Class.forName(driver);
            Connection conn = DriverManager.getConnection(dbURL);//启动嵌入式数据库
            Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            ResultSet rsn = st.executeQuery("select * from NodeInfo");//读取刚插入的数据
            while (rsn.next()) {

                name = rsn.getString(1);
                des = rsn.getString(2);
                pop = rsn.getInt(3);
                hasRest = rsn.getInt(4) == 1;
                hasToilet = rsn.getInt(5) == 1;
                x = rsn.getInt(6);
                y = rsn.getInt(7);
                graph.getNodes().add(new ArcNode(name, des, pop, hasRest, hasToilet, x, y));
            }

            ResultSet rse = st.executeQuery("select * from EdgeInfo");//读取刚插入的数据
            while (rse.next()) {

                from = rse.getString(1);
                to = rse.getString(2);
                dis = rse.getInt(3);
                time = rse.getInt(4);

                int fromIndex = -1, toIndex = -1;
                cou = 0;
                for (ArcNode node : graph.getNodes()) {
                    if (to.equals(node.getName())) {
                        toIndex = cou;
                        break;
                    }
                    cou++;
                }
                cou = 0;
                for (ArcNode node : graph.getNodes()) {
                    if (from.equals(node.getName())) {
                        fromIndex = cou;
                        break;
                    }
                    cou++;
                }

                VNode node1 = new VNode(toIndex, dis, time, graph.getNodes().get(fromIndex).getFirst());
                graph.getNodes().get(fromIndex).setFirst(node1);
                VNode node2 = new VNode(fromIndex, dis, time, graph.getNodes().get(toIndex).getFirst());
                graph.getNodes().get(toIndex).setFirst(node2);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    /**
     * This function is used to output the information of
     * the graph and output it in the form of adjacency matrix
     */
    public void outputGraph() {
        System.out.print("        ");
        for (ArcNode node : graph.getNodes()) {
            System.out.print(node.getName() + "  ");
        }
        System.out.println();

        for (int i = 0; i < graph.getArcNum(); i++) {
            System.out.print(graph.getNodes().get(i).getName() + "  ");
            for (int j = 0; j < graph.getArcNum(); j++) {
                if (i == j) {
                    System.out.print("0  ");
                    continue;
                }
                int dis = isContact(i, j);
                System.out.print(dis + "  ");
            }
            System.out.println();
        }
    }

    /**
     * get graph object
     *
     * @return a graph from the info file
     */
    public ALGraph getGraph() {
        return graph;
    }

    /**
     * get the distance between two points,
     * if not connected, the distance is infinite
     *
     * @return the distance
     */
    public int isContact(int fromIndex, int toIndex) {
        int dis = Constants.INF;
        VNode t = graph.getNodes().get(fromIndex).getFirst();
        while (t != null) {
            if (t.getIndex() == toIndex) {
                return t.getDist();
            }
            t = t.getNext();
        }

        return dis;
    }
}
