function dxydt = ODE45Func(t,xy)
    m = 0.625;
    c = 0.54;
    dxydt = [(-c*xy(1)*sqrt(xy(1)^2 + xy(2)^2))/m
    (-m*9.81-c*xy(2)*sqrt(xy(1)^2 + xy(2)^2))/m];
    %d_val = [(-c*xz(1)*sqrt(xz(1)^2 + xz(2)^2))/(-m*9.81-c*xz(2)*sqrt(xz(1)^2 + xz(2)^2))/m];
end
