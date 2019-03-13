function mu= mu_model(lambda)
D = 1;
C = 3;
B = 5;
E = 0.97;

mu= D*sin(C*atan(B*lambda-E*(B*lambda-atan(B*lambda))));


end