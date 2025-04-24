#!/bin/bash

# Number of iterations
num_iterations=10  # Change as needed

for ((i=0; i<num_iterations; i++)); do
    echo "Running iteration $i..."

    # Run the command on lidar 0
    ./trajlo ../data/config_gptr_sim_lidar0.yaml

    # Check if output file exists before renaming
    if [[ -f lidar0_estimated_pose.txt ]]; then
        mv lidar0_estimated_pose.txt "lidar0_estimated_pose_${i}.txt"
        echo "Renamed output to lidar0_estimated_pose_${i}.txt"
    else
        echo "Warning: lidar0_estimated_pose.txt not found!"
    fi

    # Run the command on lidar 1
    ./trajlo ../data/config_gptr_sim_lidar1.yaml

    # Check if output file exists before renaming
    if [[ -f lidar1_estimated_pose.txt ]]; then
        mv lidar1_estimated_pose.txt "lidar1_estimated_pose_${i}.txt"
        echo "Renamed output to lidar1_estimated_pose_${i}.txt"
    else
        echo "Warning: lidar1_estimated_pose.txt not found!"
    fi

done