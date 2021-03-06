cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries

#set(ROS_BUILD_TYPE RelWithDebInfo)
#set(ROS_BUILD_TYPE Debug)
set(ROS_BUILD_TYPE Release)

add_definitions(-std=c++0x)
add_definitions(-msse3 -msse4.1 -msse4.2)
add_definitions(-mfpmath=sse -Ofast -flto -march=native)

rosbuild_init()

#add_definitions(-Wno-deprecated -DEIGEN_DONT_VECTORIZE -DEIGEN_DISABLE_UNALIGNED_ARRAY_ASSERT)

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# auto-generated dynamic reconfiguration GUI
rosbuild_find_ros_package(dynamic_reconfigure)
include(${dynamic_reconfigure_PACKAGE_PATH}/cmake/cfgbuild.cmake)
gencfg()

#uncomment if you have defined messages
#rosbuild_genmsg()
#uncomment if you have defined services
rosbuild_gensrv()

#find_package(OpenCV REQUIRED)

#common commands for building c++ executables and libraries
#rosbuild_add_library(${PROJECT_NAME} src/example.cpp)
#target_link_libraries(${PROJECT_NAME} another_library)
#rosbuild_add_boost_directories()
#rosbuild_link_boost(${PROJECT_NAME} thread)
#rosbuild_add_executable(example examples/example.cpp)
#target_link_libraries(example ${PROJECT_NAME})

#rosbuild_add_executable(odometry_node src/odometry_node.cpp)
#rosbuild_add_executable(state_publisher src/state_publisher.cpp)

set(COMMON_SRC_FILES
	src/WheelOdometry.cpp
)

set(COMMON_LIBS
	#gsl gslcblas
)

rosbuild_add_executable(extended_odometry 
	${COMMON_SRC_FILES}
	src/WheelOdometryExtended.cpp
	src/extended_odometry.cpp)
target_link_libraries(extended_odometry ${COMMON_LIBS})

rosbuild_add_executable(simple_odometry 
	${COMMON_SRC_FILES}
	src/WheelOdometrySimple.cpp
	src/simple_odometry.cpp)
target_link_libraries(simple_odometry ${COMMON_LIBS})

rosbuild_add_executable(pose_markers 
	src/odometry_markers_node.cpp)
	
#rosbuild_add_executable(encoders_kalman 
#	src/encoders_kalman.cpp)
#target_link_libraries(encoders_kalman 
#	${OpenCV_LIBS})

rosbuild_add_executable(utm_odometry_node 
	src/utm_odometry_node.cpp)

#rosbuild_add_executable(fix_republish_node 
#	src/fix_republish_node.cpp)
	

rosbuild_add_executable(robot_pose_ekf 
                       src/odom_ekf/odom_estimation.cpp 
                       src/odom_ekf/nonlinearanalyticconditionalgaussianodo.cpp 
                       src/odom_ekf/odom_estimation_node.cpp)
rosbuild_link_boost(robot_pose_ekf thread)

rosbuild_add_executable(pose_reset_node 
	src/pose_reset_node.cpp)

rosbuild_add_executable(odom_from_pose_node 
	src/odom_from_pose_node.cpp)
	
rosbuild_add_executable(imu_yaw_node 
	src/imu_yaw_node.cpp)

rosbuild_add_executable(imu_calibrate_node 
	src/imu_calibrate_node.cpp)


rosbuild_add_executable(fake_odom_frame 
	src/fake_odom_frame.cpp)
	
	
#include_directories(src/libswiftnav/include)
#add_subdirectory(src/libswiftnav)
#rosbuild_add_executable(from_fix src/from_fix.cpp)
#target_link_libraries(from_fix swiftnav)
