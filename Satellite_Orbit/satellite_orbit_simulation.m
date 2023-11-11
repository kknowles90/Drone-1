function satellite_orbit_simulation
    % Earth's gravitational constant (m^3/kg/s^2)
    G = 6.67430e-11; 
    % Mass of the Earth (kg)
    M_earth = 5.972e24; 
    % Initial position (m) and velocity (m/s) of the satellite
    initial_position = [7000e3, 0, 0]; % 7000 km altitude
    initial_velocity = [0, 7.5e3, 0]; % Approximate speed for low Earth orbit

    % Initial state [position, velocity]
    initial_state = [initial_position, initial_velocity];

    % Time span (s)
    tspan = [0, 2 * 3600]; % Simulate for 2 hours

    % ODE solver
    [t, state] = ode45(@(t, y) orbital_dynamics(t, y, G, M_earth), tspan, initial_state);

    % Extracting position for plotting
    x = state(:, 1);
    y = state(:, 2);
    z = state(:, 3);

    % Plotting the orbit
    figure;
    plot3(x, y, z);
    xlabel('X (m)');
    ylabel('Y (m)');
    zlabel('Z (m)');
    title('Satellite Orbit');
    grid on;
    axis equal;
end

function dydt = orbital_dynamics(~, y, G, M_earth)
    % Extract position and velocity
    pos = y(1:3);
    vel = y(4:6);

    % Distance from the center of the Earth
    r = norm(pos);

    % Gravitational acceleration
    acc = -G * M_earth / r^3 * pos;

    % Derivative of state
    dydt = [vel; acc];
end
