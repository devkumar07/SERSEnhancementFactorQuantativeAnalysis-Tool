data = readtable('data.csv');
prompt = 'Enter the radius of the NP: ';
radius = input(prompt);
prompt = 'Enter the mesh size: ';
mesh = input(prompt);
prompt = 'Enter the max radius: ';
max_radius = input(prompt);
prompt = 'Enter the simulation size: ';
simulation = input(prompt);
prompt = 'Enter the sample size: ';
sample_size = input(prompt);
cell_radius = radius/mesh;
max_cell_radius = max_radius/mesh;
center_x = ceil(width(data)/2);%corresponds to columns
center_y = ceil(height(data)/2);%corresponds to rows
temp_x = cell_radius;
temp_y = 0;
i=1;
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
%perfoming calculations mean
%perfoming calculations mean
for i=1:simulation
    for j=1:1:sample_size
    sample = final_data(ceil(rand*length(final_data)))^4;
    samp_matrix(j) = sample;
    end
    sample_avg(i) = sum(samp_matrix)/sample_size; %stores the average of each sample
    for k=1:1:sample_size
        std(k) = (samp_matrix(k)-sample_avg(i))^2; %stores the differences
    end
    sample_std(i) = sqrt(sum(std)/(sample_size-1));%calculate and stores the standard deviation 
    samp_sum(i) = sum(samp_matrix); %stores the sum of each sample iteration
    samp_matrix=[];
    std=[];
end
samp_sum_avg = sum(samp_sum)/simulation; %sample sum average 
for j=1:1:length(samp_sum)
    std_samp(j) = (samp_sum(j)-samp_sum_avg)^2;
end
samp_sum_std = sqrt(sum(std_samp)/(simulation));% standard deviation of the sums
sample_avg_final = sum(sample_avg)/simulation;
%performing calculations for std
sample_st = sum(sample_std)/simulation;
X = ['The mean is = ',num2str(sample_avg_final)];
Y = ['The standard deviation is = ',num2str(median(sample_std))];
z = ['The overall mean is =', num2str(mean(final_data))];
disp(X);
disp(Y);
disp(z);