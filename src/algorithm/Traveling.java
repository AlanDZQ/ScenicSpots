package algorithm;

import util.Constants;
import java.util.ArrayList;
import java.util.List;
import datastructure.ALGraph;

public class Traveling {
    private int n; //the number of nodes
    private int a[][]; //the matrix of spots
    private int[] x; //current x
    private int[] bestx; //current best answer x
    private int bestc; //current best cost
    private int c; //current cost
    private int v[] = new int[20];
    private int time;
    private ALGraph graph;
    private List<Integer> indexList;

    public Traveling(ALGraph graph, int n) {
        this.graph = graph;
        indexList = new ArrayList<>();
        for (int i = 0; i <= n; i++)
            v[i] = i;
    }

    public List<Integer> getIndexList() {
        return indexList;
    }

    public int getN() {
        return n;
    }

    public int[] getX() {
        return x;
    }

    public int[] getBestx() {
        return bestx;
    }

    public int getBestc() {
        return bestc;
    }

    public int getC() {
        return c;
    }

    public int[][] getA() {
        return a;
    }

    public void setN(int n) {
        this.n = n;
    }

    public void setX(int[] x) {
        this.x = x;
    }

    public void setBestx(int[] bestx) {
        this.bestx = bestx;
    }

    public void setBestc(int bestc) {
        this.bestc = bestc;
    }

    public void setC(int c) {
        this.c = c;
    }

    public void setA(int[][] a) {
        this.a = a;
    }

    public void setV(int[] v) {
        this.v = v;
    }

    public int getTime() {
        return time;
    }

    public List<String> tsp() {
        List<String> cycleNodeList = new ArrayList<>();
        //x 的单位排列
        x = new int[n + 1];
        for (int i = 1; i <= n; i++)
            x[i] = i;
        bestc = Constants.INF;//initialize the param bestc
        bestx = v;
        c = 0;
        //search for all the x[2:n] arranged
        backtrack(2);
        time = 0;
        for (int element : bestx)
            if (element != 0) {
                System.out.println(element + "->");
                indexList.add(element - 1);
                cycleNodeList.add(graph.getNodes().get(element - 1).getName());
                time += graph.getNodes().get(element - 1).getFirst().getTime();
            }
        return cycleNodeList;
    }


    private void backtrack(int i) {

        if (i == n) {
            if (a[x[n - 1]][x[n]] < Constants.INF && a[x[n]][1] < Constants.INF && (bestc == Constants.INF || c + a[x[n - 1]][x[n]] + a[x[n]][1] < bestc)) {
                for (int j = 1; j <= n; j++)
                    bestx[j] = x[j];
                bestc = c + a[x[n - 1]][x[n]] + a[x[n]][1];
            }
        } else {
            for (int j = i; j <= n; j++)
                //是否可以进入x[j]子树？
                if (a[x[i - 1]][x[j]] < Constants.INF && (bestc == Constants.INF || c + a[x[i - 1]][x[j]] < bestc)) {
                    //搜索子树
                    swap(x, i, j);
                    c += a[x[i - 1]][x[i]];
                    backtrack(i + 1);
                    c -= a[x[i - 1]][x[i]];
                    swap(x, i, j);
                }
        }
    }

    public void swap(int[] x, int i, int j) {
        int temp;
        temp = x[i];
        x[i] = x[j];
        x[j] = temp;
    }

}