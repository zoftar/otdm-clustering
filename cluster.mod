param m;
param n := 2;
param A{1..m,1..n};
param k;

param D  {i in 1..m,j in 1..m} = sqrt((A[i,1]-A[j,1])^2 + (A[i,2]-A[j,2])^2);

var x{1..m, 1..m} >=0, <=1;

minimize f:
sum{i in 1..m, j in 1..m} (D[i,j]*x[i,j]);

subject to constraint1{i in 1..m}:
sum{j in 1..m} x[i,j] = 1;

subject to constraint2:
sum{j in 1..m} x[j,j]=k;

subject to constraint3{i in 1..m, j in 1..m}:
x[j,j] >= x[i,j];