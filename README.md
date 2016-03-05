# README #

### What is this repository for? ###

This project was done as a part of Mobile Robotics course under Prof. Madhava Krishna.
This is a Matlab code with main.m as the file which would simulate everything on running.

Main parts of the code is :

1. Moving a robot from start to goal, using a novel method of curve fitting using Beizer curves. The basis used
by beizer curves are Bernstein Polynomials.

2. For a non holonomic robot y=x*tan(theta).
The method is sub optimal as it calculates x and theta in terms of weighted Bernstein polynomials and then uses them to get the equation of y.

3. The last part of the project was to traverse a robot from start to goal in the presence of static obstacles.
The space was modeled using visibility graphs and a shortest path from start to goal was calculated. On this path a Beizer curve was fitted, which subsequently became the path which the robot followed.

4. Lastly, a turtlebot was simulated, using ROS libraries, for the same and was found to travel smoothly without any jerks from start to goal. 