s=serial('COM3');
s.BaudRate = 115200;
fopen(s)
%fwrite(s,'uint8');
%data=str2num(char(fread(s,8,'uint8'))');
data=[];
time=[];
fwrite(s,'command1');
for i=1:1:400
    n=1;
    temp=[];
   while 1
    temp(n) = fread(s,1,'uint8');
    if temp(n) ~= 10
       
        n=n+1;
     
    else
         break;
    end
   end
    %c = clock;
    %c(7) = fix(1000*(c(6)-fix(c(6)))/256);
    %c(8) = mod(1000*(c(6)-fix(c(6))),256);
    %c(6) = fix(c(6));
    %time(i,:)=c;
%     fwrite(s,c,'uint8');
    data(i)  = str2num(char(temp));
    
end

%plot(time(:,8)+time(:,7)+1000*time(:,8),data)
i=1:1:400;
plot(i,data)

fclose(s);
