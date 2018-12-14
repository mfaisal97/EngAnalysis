function [dv_val] = DVX(m , c , vx, vz)
    dv_val = (-(c*vx) / m) * sqrt(vx^2 + vz^2);
end