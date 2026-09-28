L = 0.5;
x = linspace(0,L,1000);

beta1 = pi;
beta2 = 3*pi;
beta3 = 5*pi;

w1 = sin(beta1*x);
w2 = sin(beta2*x);
w3 = sin(beta3*x);

w1 = w1./max(abs(w1));
w2 = w2./max(abs(w2));
w3 = w3./max(abs(w3));

subplot(3,1,1)
plot(x,w1)
ylabel('W_1(x)')
title('Mode 1')

subplot(3,1,2)
plot(x,w2)
ylabel('W_2(x)')
title('Mode 2')

subplot(3,1,3)
plot(x,w3)
xlabel('x')
ylabel('W_3(x)')
title('Mode 3')

