cmake_minimum_required (VERSION 2.8)

find_package(Java REQUIRED)
include(UseJava)

#enable_testing()

project (HelloWorld)

set(CMAKE_JAVA_COMPILE_FLAGS "-source" "1.6" "-target" "1.6")

add_jar(first being_tested/First.java OUTPUT_DIR ${PROJECT_BINARY_DIR}/jars)

get_target_property(_jarFile HelloWorld JAR_FILE)
get_target_property(_classDir HelloWorld CLASSDIR)

message(STATUS "Jar file ${_jarFile}")
message(STATUS "Class compiled to ${_classDir}")

#add_test(NAME TestHelloWorld COMMAND ${Java_JAVA_EXECUTABLE} -cp ${_jarFile} HelloWorld)