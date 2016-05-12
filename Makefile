NAME                    = standard_router
INI_DIR                 = /etc/php5/fpm/conf.d
EXTENSION_DIR           = $(shell php-config --extension-dir)

EXTENSION               = standard_router.so
INI                     = standard_router.ini
COMPILER                = g++
LINKER                  = g++

COMPILER_FLAGS          = -Wall -c -O2 -std=c++11 -fpic -o
LINKER_FLAGS            = -shared
LINKER_DEPENDENCIES     = -lphpcpp

#	Command to remove files, copy files and create directories.
RM                      = rm -f
CP                      = cp -f
MKDIR                   = mkdir -p

#	All source files are simply all *.cpp files found in the current directory
SOURCES                 = $(wildcard *.cpp)
OBJECTS                 = $(SOURCES:%.cpp=%.o)

#	From here the build instructions start
all:            ${OBJECTS} ${EXTENSION}

${EXTENSION}:   ${OBJECTS}
		${LINKER} ${LINKER_FLAGS} -o $@ ${OBJECTS} ${LINKER_DEPENDENCIES}

${OBJECTS}:
		${COMPILER} ${COMPILER_FLAGS} $@ ${@:%.o=%.cpp}

install:		
		${CP} ${EXTENSION} ${EXTENSION_DIR}
		${CP} ${INI} ${INI_DIR}
				
clean:
		${RM} ${EXTENSION} ${OBJECTS}
