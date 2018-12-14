function dv_val = DVZ(m , c , vx, vz)
    g = 9.8;
    dv_val = (-(c*vx) / m) * sqrt(vx^2 + vz^2) - g;
end
