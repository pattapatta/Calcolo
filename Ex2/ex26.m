x = [1:12];
A = [x([1:4]);x([5:8]);x([9:12])];
size(A)
B = A.*A
B = A*A
B = A'*A
A(1:2,4)
A(:,3)
A(1:2,:)
A(:,[2 4])
A([2 3 3])
A(3,2)=A(1,1)
A(1:2,4) = zeros(2,1);
A(2,:) = A(2,:)-A(2,1)/A(1,1)*A(1,:);
