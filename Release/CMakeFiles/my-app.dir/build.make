# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.17.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.17.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/hamid/code/cpp/GridManipulator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/hamid/code/cpp/GridManipulator/Release

# Include any dependencies generated for this target.
include CMakeFiles/my-app.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my-app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my-app.dir/flags.make

CMakeFiles/my-app.dir/src/Main.cpp.o: CMakeFiles/my-app.dir/flags.make
CMakeFiles/my-app.dir/src/Main.cpp.o: ../src/Main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hamid/code/cpp/GridManipulator/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my-app.dir/src/Main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/my-app.dir/src/Main.cpp.o -c /Users/hamid/code/cpp/GridManipulator/src/Main.cpp

CMakeFiles/my-app.dir/src/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my-app.dir/src/Main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/hamid/code/cpp/GridManipulator/src/Main.cpp > CMakeFiles/my-app.dir/src/Main.cpp.i

CMakeFiles/my-app.dir/src/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my-app.dir/src/Main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/hamid/code/cpp/GridManipulator/src/Main.cpp -o CMakeFiles/my-app.dir/src/Main.cpp.s

# Object files for target my-app
my__app_OBJECTS = \
"CMakeFiles/my-app.dir/src/Main.cpp.o"

# External object files for target my-app
my__app_EXTERNAL_OBJECTS =

my-app: CMakeFiles/my-app.dir/src/Main.cpp.o
my-app: CMakeFiles/my-app.dir/build.make
my-app: CMakeFiles/my-app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hamid/code/cpp/GridManipulator/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable my-app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my-app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my-app.dir/build: my-app

.PHONY : CMakeFiles/my-app.dir/build

CMakeFiles/my-app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my-app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my-app.dir/clean

CMakeFiles/my-app.dir/depend:
	cd /Users/hamid/code/cpp/GridManipulator/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hamid/code/cpp/GridManipulator /Users/hamid/code/cpp/GridManipulator /Users/hamid/code/cpp/GridManipulator/Release /Users/hamid/code/cpp/GridManipulator/Release /Users/hamid/code/cpp/GridManipulator/Release/CMakeFiles/my-app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my-app.dir/depend
