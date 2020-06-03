%checks the circumference of the ellipse
function y = check_cell1(a,b,x, y,center_x,center_y)
if sqrt(a^2-b^2)==0
    y= check_cell(a,x,y);
elseif floor(x^2/a^2+y^2/b^2)==1
    y=1;
else
    y=0;
end
% checks the circumference of the ellipse
% function y = check_cell1(a,b,x,y,center_x,center_y)
% a
% b
% c = sqrt(a^2-b^2);
% c
% c1 = c;
% c2 = -c;
% l1 = sqrt((x-c2)^2 + y^2);
% l2 = sqrt((x-c1)^2 + y^2);
% l1
% if c==0
%     y = check_cell(b,x,y);
% elseif floor(l1+l2)==floor(2*a)
%     y=1;
% else
%     y=0;
% end
