function value = ssd( X, Y )
%SSD Returns sum of squared differences on input matrices
    value = sum(sum((X-Y).^2));
end

