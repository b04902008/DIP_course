function h_circle = circle(r)
    len = 2 * r + 1;
    h_circle = zeros(len, len);
    d = r + 1;
    r_pow = r * r;
    for i=1:len
        for j=1:len
            if (i-d)*(i-d)+(j-d)*(j-d) <= r_pow
                h_circle(i, j) = 1;
            end
        end
    end
end