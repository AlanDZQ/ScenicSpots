package algorithm;

public class HamiltonianCycle {
    int g[][],x[],n;
    public HamiltonianCycle() {
        g=new int[][]{
                {0,1,1,0,0,0,1,0},
                {1,0,1,0,0,0,0,1},
                {1,1,0,1,0,1,0,0},
                {0,0,1,0,1,0,0,0},
                {0,0,0,1,0,1,0,0},
                {0,0,1,0,1,0,1,0},
                {0,0,0,0,0,1,0,1},
                {0,1,0,0,0,0,1,0}
        };
        n=g.length;
        x=new int[n];
        x[0]=0;
//        for(int i=1;i<n;i++)
//            x[i]=-1;
        hamiltonian(1);
//        for(int i=1;i<n;i++)
//            hamiltonian(i);
    }
    public void nextValue(int k){
        while(true){
            x[k]=(x[k]+1)%n;
            if(x[k]==0) return;
            if(g[x[k-1]][x[k]]!=0){
                int j;
                for(j=0;j<k;j++){
                    if(x[k]==x[j]){
                        break;
                    }
                }
                if(j==k){
                    if(k<n-1){
                        return;
                    }
                    if((k==n-1)&&(g[x[k]][x[0]]!=0)){
                        return;
                    }
                }

            }
        }
    }
    public void hamiltonian(int k){
        while(true){
            //System.out.println(k);
            nextValue(k);
            if(x[k]==0) return;
            if(k==n-1){
                System.out.print("Hamiltonian Cycle: ");
                for(int i=0;i<n;i++)
                    System.out.print(x[i]+" ");
                System.out.println();
                //System.exit(0);
            }else{
                hamiltonian(k+1);
            }
        }
    }
    public static void main(String[] args) {
        new HamiltonianCycle();
    }
}