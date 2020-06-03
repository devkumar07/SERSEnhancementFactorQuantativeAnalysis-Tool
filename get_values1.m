%checking first quadrant
function final_data = get_values1(temp_x,temp_y,center_x,center_y,cell_radius,max_cell_radius,data,i)
%checking first quadrant
while cell_radius <= max_cell_radius
    while temp_x>=0 
        check = check_cell(cell_radius,temp_x,temp_y);
        if(check==1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell(cell_radius,temp_x-1,temp_y);
            if(check_next==1)
                temp_x = temp_x - 1;
            else
                if(temp_y~=-cell_radius)
                    temp_y = temp_y - 1;
                end
            end
        else
            temp_x = temp_x-1;
        end
    end
    %checking 2nd quadrant
    while temp_y<=0 
        check = check_cell(cell_radius,temp_x,temp_y);
        if(check==1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell(cell_radius,temp_x,temp_y+1);
            if(check_next==1)
                temp_y = temp_y + 1;
            else
                if(temp_x~=-cell_radius)
                    temp_x = temp_x - 1;
                end
            end
        else
            temp_y = temp_y+1;
        end
    end
    %checking 3rd quadrant
    while temp_x<=0 
        check = check_cell(cell_radius,temp_x,temp_y);
        if(check==1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell(cell_radius,temp_x+1,temp_y);
            if(check_next==1)
                temp_x = temp_x + 1;
            else
                if(temp_y~=cell_radius)
                    temp_y = temp_y + 1;
                end
            end
        else
            temp_x = temp_x + 1;
        end
    end
    %checking 4th quadrant
    while temp_y>=0 
        check = check_cell(cell_radius,temp_x,temp_y);
        if(check==1)
            final_data(i)=table2array(data(center_y+temp_y,center_x+temp_x));
            i=i+1;
            check_next = check_cell(cell_radius,temp_x,temp_y-1);
            if(check_next==1)
                temp_y = temp_y - 1;
            else
                if(temp_x~=cell_radius)
                    temp_x = temp_x + 1;
                end
            end
        else
            temp_y = temp_y - 1;
        end
    end
    cell_radius = cell_radius + 1;
    temp_x = cell_radius;
    temp_y = 0;
end