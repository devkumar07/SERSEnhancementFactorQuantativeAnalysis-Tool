%checks the circumference of the ellipse
function y = check_duplicate(a,b,x, y,center_x,center_y)
if sqrt(a^2-b^2)==0
    y= check_cell(a,x,y);
elseif floor(x^2/a^2+y^2/b^2)==1 && floor(x^2/(a-1)^2+y^2/b^2)~=1
    y=1;
else
    y=0;
end