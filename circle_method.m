data = readtable('data.csv');
prompt = 'Enter the radius of the NP: ';
radius = input(prompt);
prompt = 'Enter the mesh size: ';
mesh = input(prompt);
prompt = 'Enter the big radius: ';
big_radius = input(prompt);
prompt = 'Enter the simulation size: ';
simulation = input(prompt);
prompt = 'Enter the sample size: ';
sample_size = input(prompt);
cell_radius = radius/mesh;
big_cell_radius = big_radius/mesh;
center_x = ceil(width(data)/2);%corresponds to columns
center_y = ceil(height(data)/2);%corresponds to rows
temp_x = cell_radius;
temp_y = 0;
i=1;
a = cell_radius;
b = cell_radius;
data1 = get_values1(data,temp_x,temp_y,center_x,center_y,cell_radius,i);
center_x_left = center_x-(cell_radius + 6 + big_cell_radius);
center_x_right = center_x + cell_radius + 6 + big_cell_radius;
temp_x = big_cell_radius;
temp_y = 0;
data2 = get_values1(data,temp_x,temp_y,center_x_left,center_y,big_cell_radius,i);
temp_x = big_cell_radius;
temp_y = 0;
data3 = get_values1(data,temp_x,temp_y,center_x_right,center_y,big_cell_radius,i);
final_data = [data1, data2,data3];
final_data = unique(final_data);
final_data1 = unique(data1);
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
disp(X);
disp(Y);