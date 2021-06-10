pkg load io
fileName = "RawData.dat";
T = csv2cell(fileName);
X=cell2mat(T(:,2:3));
C1=[];
C2=[];
L=T(:,8);
m=size(X,1);
for i = 1:m 	
	if ismember({'AAA'},L(i))==1
		C1=[C1;X(i,:)];
	else
		C2=[C2;X(i,:)];
	end
end

plot(C1(:,1),C1(:,2),'*')
hold on
plot(C2(:,1),C2(:,2),'+')
