%%%%Defining the model and coeeficients


%% Defining SCARA 5-DOF manipulator parameters 

l = [ 0.524, 0.2, 0.2, 0.2, 0.14];
lc= [0 , 0.0229, 0.0229, 0.0229, 0];
m = [1.228, 1.023, 1.023, 1.023, 0.5114];
Izz = [0, 0.0058, 0.0058, 0.0058, 0];
Fv = [0.03, 0.025, 0.025, 0.025, 0.02];

link_parameters = [l ; lc; m ; Izz; Fv];


%% Controller Gains

Kp = [128.5204 102.3185 111.2328 109.4094 98.049];
Kd = [3.0237 2.7708 7.5699 12.4043 5.742];
Ki = [1.5240 2.9039 1.9780 1.6885 2.8586];

e_max=10;
Se = 1/e_max;
Sout= zeros(1,5);
Sout = e_max.*Kp;
Sie = zeros(1,5);
Sie = Ki./(Kp*e_max);
Sce = zeros(1,5);
Sce = Kd./(Kp*e_max);

%% Run

sim('model1.slx')
