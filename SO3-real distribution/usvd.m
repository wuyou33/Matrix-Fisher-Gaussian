function [ U, S, V ] = usvd( F, positive )

[U,S,V]=svd(F);

for i = 1:3
    [~,ind] = max(abs(V(:,i)));
    if V(ind,i) < 0
        V(:,i) = -V(:,i);
        U(:,i) = -U(:,i);
    end
end

if positive
    V=V*diag([1 1 det(U)]);
    U=U*diag([1 1 det(U)]);
else
    S=S*diag([1 1 det(U*V)]);
    U=U*diag([1 1 det(U)]);
    V=V*diag([1 1 det(V)]);
end

end

