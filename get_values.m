%checking first quadrant
function final_data = get_values(a,b,temp_x,temp_y,center_x,center_y,cell_radius,max_cell_radius,data,i)
while a <= max_cell_radius
    while temp_x>=0 
        check1 = 0;
        if a~=cell_radius
            check1 = check_duplicate(a,b,temp_x,temp_y,center_x,center_y);
        end
        check = check_cell1(a, b,temp_x,temp_y,center_x,center_y);
        if(check==1 && check1~=1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell1(a,b,temp_x-1,temp_y,center_x,center_y);
            if(check_next==1)
                temp_x = temp_x - 1;
            else
                if(temp_y~=-b)
                    temp_y = temp_y - 1;
                end
            end
        else
            temp_x = temp_x-1;
        end
    end
    %checking 2nd quadrant
    while temp_y<=0 
        check1 = 0;
        if a~=cell_radius
            check1 = check_duplicate(a,b,temp_x,temp_y,center_x,center_y);
        end
        check = check_cell1(a,b,temp_x,temp_y,center_x,center_y);
        if(check==1 && check1~=1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell1(a,b,temp_x,temp_y+1,center_x,center_y);
            if(check_next==1)
                temp_y = temp_y + 1;
            else
                if(temp_x~=-a)
                    temp_x = temp_x - 1;
                end
            end
        else
            temp_y = temp_y+1;
        end
    end
    %checking 3rd quadrant
    while temp_x<=0 
        check1 = 0;
        if a~=cell_radius
            check1 = check_duplicate(a,b,temp_x,temp_y,center_x,center_y);
        end
        check = check_cell1(a, b,temp_x,temp_y,center_x,center_y);
        if(check==1 && check1~=1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell1(a,b,temp_x+1,temp_y,center_x,center_y);
            if(check_next==1)
                temp_x = temp_x + 1;
            else
                if(temp_y~=b)
                    temp_y = temp_y + 1;
                end
            end
        else
            temp_x = temp_x + 1;
        end
    end
    %checking 4th quadrant
    while temp_y>0 
        check1 = 0;
        if a~=cell_radius
            check1 = check_duplicate(a,b,temp_x,temp_y,center_x,center_y);
        end
        check = check_cell1(a, b,temp_x,temp_y,center_x,center_y);
        if(check==1 && check1~=1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell1(a,b,temp_x,temp_y-1,center_x,center_y);
            if(check_next==1)
                temp_y = temp_y - 1;
            else
                if(temp_x~=a)
                    temp_x = temp_x + 1;
                end
            end
        else
            temp_y = temp_y - 1;
        end
    end
    a = a + 1;
    temp_x = a;
    temp_y = 0;
end
