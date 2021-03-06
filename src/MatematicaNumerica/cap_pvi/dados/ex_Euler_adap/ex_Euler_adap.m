f = @(t,y) y+sin(t);

TOL=1e-4;
h=1e-1;
tf=1;

t0=0;
y0=0.5;

t=[]'
y=[]'

c=1;
do

  h = min(h,tf-t0);
 
  do
    #passo h
    y1=y0+h*f(t0,y0);
    #passo h/2
    y2=y0+h/2*f(t0,y0);
    y2=y2+h/2*f(t0+h/2,y2);
    #verifica TOL
    est = 2*abs(y1-y2);
    if (est > TOL)
      h/=2;
    else
      t0+=h;
      y0=y2;
      
      t(c)=t0;
      y(c)=y0;
      c+=1;
    endif
    if (h<1e-8)
      error("h muito pequeno")
    endif
  until ((est <= TOL))
  
until (abs(t0-tf)<1e-14)

ya = @(t) exp(t)-sin(t)/2-cos(t)/2;
printf("%1.1E %1.5E %1.1E\n",t0,y0,abs(y0-ya(1)))

plot(t,ya(t),'b-',t,y,'r-');grid
