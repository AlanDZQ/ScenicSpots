package algorithm;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Vector;

import com.sun.corba.se.impl.orbutil.graph.Graph;
import datastructure.ALGraph;
import datastructure.ArcNode;
import datastructure.Stack;
import datastructure.VNode;

/**
 * 根据输入的起始点生成旅游路线图，并判断是否有回路
 */
public class TourMap {
	private ALGraph graph;
	private ALGraph directGraph;
	private boolean[] visited;
	private List<Integer> tourIndexList;
	private int startIndex;
	
	public TourMap(ALGraph graph) {
		this.graph = graph;
		directGraph = new ALGraph(graph.getArcNum());
		visited = new boolean[graph.getArcNum()];
		tourIndexList = new ArrayList<Integer>();
	}
	
	/**
	 * 利用深度遍历得到旅游路线图
	 * 
	 * @param start 起始点名称
	 * @return 旅游路线景点的位置列表
	 */
	public List<Integer> DFSTraverse(String start, String endName){

		int last=0;
		Stack<Integer> traverseNodes = new Stack<Integer>(Integer.class, graph.getArcNum());
		String middle ="";
		startIndex = getPos(start);
		traverseNodes.push(startIndex);
		while(!traverseNodes.isEmpty() && !hasAllVisited()){
			int arcNodeIndex = traverseNodes.peek();
			visited[arcNodeIndex] = true;
			VNode vNode = graph.getNodes().get(arcNodeIndex).getFirst();
			while(vNode != null){
				if(!visited[vNode.getIndex()]){
					traverseNodes.push(vNode.getIndex());
					break;
				}
				vNode = vNode.getNext();
			}
			if(vNode == null){
				traverseNodes.pop();
			}
			tourIndexList.add(arcNodeIndex);
			last = arcNodeIndex;
		}

		ALGraph g = graph;

		String a = g.getNodes().get(last).getName();
		ShortestPath sp = new ShortestPath(g);
		sp.dijkstra(a,endName);
		List<Integer> result = sp.outputShortestPath();
		for(int i=result.size()-2; i>0; i--){
			tourIndexList.add(result.get(i));
		}

		return tourIndexList;
	}


	/**
	 * 生成有向图
	 */
	private void initNewGraph(){
		for(int i=0; i<graph.getArcNum(); i++){
			ArcNode arcNode = graph.getNodes().get(i);
			ArcNode newArcNode = new ArcNode(arcNode.getName(), arcNode.getDes(), arcNode.getPop(), 
					arcNode.isHasRest(), arcNode.isHasToilet(),arcNode.getX(),arcNode.getY());
			directGraph.getNodes().add(newArcNode);
		}
		
		for(int i=0; i<tourIndexList.size()-1; i++){
			VNode newVNode = getVNode(tourIndexList.get(i), tourIndexList.get(i+1));
			newVNode.setNext(directGraph.getNodes().get(tourIndexList.get(i)).getFirst());
			directGraph.getNodes().get(tourIndexList.get(i)).setFirst(newVNode);
		}
	}
	
	/**
	 * 获取指点景点名称的位置
	 * 
	 * @param name 景点名称
	 * @return 景点的位置
	 */
	public int getPos(String name){
		int pos = -1;
		for(int i=0; i<graph.getArcNum(); i++){
			if(name.equals(graph.getNodes().get(i).getName())){
				pos = i;
				break;
			}
		}
		
		return pos;
	}
	
	/**
	 * 判断是否所有景点已经被访问
	 * 
	 * @return 是否访问所有景点
	 */
	private boolean hasAllVisited(){
		for(boolean visit : visited){
			if(!visit){
				return false;
			}
		}
		
		return true;
	}
	
	/**
	 * 获取边结点信息
	 * 
	 * @param fromIndex 起始点位置
	 * @param toIndex 终点位置
	 * @return 边结点信息
	 */
	private VNode getVNode(int fromIndex, int toIndex){
		VNode newVNode = null;
		
		VNode node = graph.getNodes().get(fromIndex).getFirst();
		while(node != null){
			if(node.getIndex() == toIndex){
				newVNode = new VNode(node.getIndex(), node.getDist(), node.getTime(), null);
				break;
			}
			node = node.getNext();
		}
		
		return newVNode;
	}

	/**
	 * 利用拓扑排序判断旅游路线图中是否有回路
	 *
	 * @return 回路中的景点名称列表
	 */
	public List<String> TopoSort(){
		initNewGraph();

		List<String> cycleNodeList = new ArrayList<String>();
		int[] indegree = new int[directGraph.getArcNum()];
		Queue<Integer> queue = new LinkedList<Integer>();

		//统计每个结点的入度数
		for(int i=0; i<directGraph.getArcNum(); i++){
			VNode node = directGraph.getNodes().get(i).getFirst();
			while(node != null){
				indegree[node.getIndex()]++;
				node = node.getNext();
			}
		}

		indegree[startIndex] = 0;
		//将所有入度为0的结点入队
		for(int i=0; i<directGraph.getArcNum(); i++){
			if(indegree[i] == 0){
				queue.offer(i);
			}
		}

		while(!queue.isEmpty()){
			int ind = queue.poll();
			VNode node = directGraph.getNodes().get(ind).getFirst();
			while(node != null){
				indegree[node.getIndex()]--;
				if(indegree[node.getIndex()] == 0){
					queue.offer(node.getIndex());
				}
				node = node.getNext();
			}
		}

		for(int i=0; i<directGraph.getArcNum(); i++){
			if(indegree[i] != 0){
				cycleNodeList.add(directGraph.getNodes().get(i).getName());
			}
		}

		return cycleNodeList;
	}
}
