function data=histoacu(u)
num=1:256;
acc=0;
histoAc=zeros(1,256);
for x=1:256;
    histoAc(x)=acc+u(x);
    acc=histoAc(x);
end
val=210-(histoAc*200);
data(:,1)=num;
data(:,2)=val;
end

%A=ones(352,256);