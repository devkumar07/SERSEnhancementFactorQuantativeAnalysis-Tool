data = readtable('782.csv');
prompt = 'Central radius: ';
radius = input(prompt);
prompt = 'Mesh size: ';
mesh = input(prompt);
prompt = 'Max radius: ';
max_radius = input(prompt);
prompt = 'Surrounding NPs radius: ';
big_radius = input(prompt);
prompt = 'Max radius for big: ';
max_radius_big = input(prompt);
prompt = 'Gap distance:';
gap_size = input(prompt)*2;
prompt = 'Vertical shift for big NP: ';
vertical_shift = input(prompt)*2;
prompt = 'Simulation size: ';
simulation = input(prompt);
prompt = 'Sample size: ';
sample_size = input(prompt);
cell_radius = radius/mesh;
max_cell_radius_big = max_radius_big/mesh;
big_cell_radius = big_radius/mesh;
center_x = ceil(width(data)/2);%corresponds to columns
center_y = ceil(height(data)/2);%corresponds to rows
vertical_shift = vertical_shift * (-1);
while max_radius <= 8
    max_cell_radius = max_radius/mesh;
    t = (center_y + vertical_shift);
    temp_x = cell_radius;
    temp_y = 0;
    i=1;
    data1 = get_values1(temp_x,temp_y,center_x,center_y,cell_radius,max_cell_radius,data,i);
    center_x_left = center_x-(cell_radius + gap_size + big_cell_radius);
    center_x_right = center_x + cell_radius + gap_size + big_cell_radius;
    temp_x = big_cell_radius;
    temp_y = 0;
    data2 = get_values1(temp_x,temp_y,center_x_left,(center_y + vertical_shift),big_cell_radius,max_cell_radius_big,data,1);
    temp_x = big_cell_radius;
    temp_y = 0;
    data3 = get_values1(temp_x,temp_y,center_x_right,(center_y + vertical_shift),big_cell_radius,max_cell_radius_big,data,1);
    big_merge = [data2,data3];
    %perfoming calculations mean
    for i=1:simulation
        w = 1;
        %simulating with equal probabilities and different replacement options
    %     while w<=sample_size
    %         r = rand;
    %         if r<=0.33
    %             samp_matrix1(w) = randsample(data1,1,false);
    %         elseif r>0.33 && r<=0.66
    %             samp_matrix1(w) = randsample(data2,1,true);
    %         else
    %             samp_matrix1(w) = randsample(data3,1,true);
    %         end
    %         w = w+1;
    %     end
        samp_matrix1 = randsample(data1,sample_size,false);
        samp_matrix = samp_matrix1.^4;
        samp_sum(i) = sum(samp_matrix); %stores the sum of each sample iteration
        sample_avg(i) = mean(samp_matrix); %stores the average of each sample
        sample_std(i) = std(samp_matrix);%calculate and stores the standard deviation 
    end 

    samp_sum_std = std(samp_sum,1);% standard deviation of the sums
    sample_avg_final = median(sample_avg); % Median Average EF
    samp_sum_avg = median(samp_sum); %Average of the sums average
    sample_st = median(sample_std);
    T = ['Displaying results for max_radius = ', num2str(max_radius)];
    A = ['The mean of Center Particle = ',num2str(mean(data1).^4,'%10.5e\n')];
    B = ['The mean overall = ',num2str(mean([data1,big_merge]).^4,'%10.5e\n')];
    X = ['The mean is = ',num2str(sample_avg_final,'%10.5e\n')];
    Y = ['The standard deviation is = ',num2str(sample_st,'%10.5e\n')];
    Z = ['The median of sum is = ',num2str(samp_sum_avg,'%10.5e\n')];
    W = ['The standard deviation of sum is = ',num2str(samp_sum_std,'%10.5e\n')];
    disp(T);
    disp(A);
    disp(B);
    disp(X);
    disp(Y);
    disp(Z);
    disp(W);
    disp(['--------------']);
    max_radius = max_radius +0.5;
end