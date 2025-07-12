function y = poly_limited(x_data, y_data, ypivot, x_pivot, poly_coeffs, x)
% Polynomial region
ypoly = polyval(poly_coeffs, x);
y1 = interp1(x_data, y_data, x_pivot);
y2 = interp1(x_data, y_data, x_pivot-0.01);
dfdx = (y2 -y1) / 0.01;

if x < 0
    y = 0;
elseif x <= x_pivot
    y = ypoly;
else
    y = ypivot + dfdx * (x - x_pivot);  % Linear extrapolation
end
