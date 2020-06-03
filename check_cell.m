%checks the circumference of the circle
function y = check_cell(cell_radius, x, y)
if floor(sqrt(x^2+y^2))==cell_radius
    y=1;
else
    y=0;
end