rosbag record /encoders_controller/encoders -e "/lse_xsens_mti/xsens/(.*)" -e "/move_base/(.*)" /octomap/octomap_point_cloud_centers /navigation/cmd_vel /planning/cmd_vel /wheel_odometry/odom /map /tf /joint_states /octomap/occupied_cells_vis /throttle_commands /vehicle_state -e "/gazebo/(.*)"

#rosbag record /stereo/left/image_raw /stereo/left/camera_info /stereo/right/image_raw /stereo/right/camera_info /encoders_controller/encoders /lse_xsens_mti/xsens/fix /lse_xsens_mti/xsens/mag /lse_xsens_mti/xsens/imu/data /move_base/result /move_base/status /move_base/feedback /move_base/goal  

#rosbag record /stereo/left/image_raw /stereo/left/camera_info /stereo/right/image_raw /stereo/right/camera_info /encoders_controller/encoders /lse_xsens_mti/xsens/fix /lse_xsens_mti/xsens/mag /lse_xsens_mti/xsens/imu/data /velocity_commands /steering_commands /throttle_commands /carina_controller/cmd_vel /map /move_base/SBPLLatticePlanner/plan /move_base/result /move_base/status /move_base/feedback /move_base/current_goal /move_base/goal  

#/camera/image_raw /camera/camera_info /vehicle_state

