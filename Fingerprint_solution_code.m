%% Indoor Positioning
clear; 
clc; 
close all;
% Read database of control points and relevant vector of measurements
user_db = load('user_db.txt');
control_points_db = load('control_points_db.txt');

%% User Trajectory
% Initialize matrix to store estimated positions
user_positions = zeros(length(user_db), 2);

% For each user point
for i = 1:length(user_db)
    
    % For each control point
    for j = 1:length(control_points_db)
        
        % Get user RSSI measurements
        user_measurements = user_db(i, 2:end);
        
        % Get control point RSSI measurements
        control_measurements = control_points_db(j, 4:end);
        
        % Find the distance of measurements of the user from the
        % measurements of the control point: (m_u - m_cp)
        difference = user_measurements - control_measurements;
        
        % Identify the minimum distance
        distance = abs(min(difference));
        
        % Store control point coordinates and distance
        d(j, 1) = control_points_db(j, 2);  
        d(j, 2) = control_points_db(j, 3);  
        d(j, 3) = distance;                 
        
    end

    % Attribute to the user the position of the control point with the
    % nearest measurements
    [~, min_idx] = min(d(:, 3));
    user_positions(i, 1) = d(min_idx, 1);  
    user_positions(i, 2) = d(min_idx, 2);  
    
end

% Plot of user trajectory
figure;
plot(user_positions(:,1), user_positions(:,2), '-', 'Color', [0.5, 0.8, 1], 'LineWidth', 2)
hold on
plot(control_points_db(:,2), control_points_db(:,3), 'r.', 'MarkerSize', 10)
rectangle('Position', [0 0 20 10], 'LineWidth', 2)
hold off
legend('User Trajectory', 'Control points')
title('User Trajectory')
axis([-2 22 -1 11])
