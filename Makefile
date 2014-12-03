CC = gcc
CXX = g++
CFLAGS = -Wall -ggdb -fPIC
CXXFLAGS = -Wall -ggdb -fPIC
LDFLAGS = -lz -lpthread
SOURCES = xvConvert.c
OBJECTS = $(SOURCES:.c=.o)
#OBJECTS = $(SOURCES:.cc=.o)
#OBJECTS += $(SOURCES:.cpp=.o)
#OBJECTS = $(patsubst %.cc,bm_%.o,$(SOURCES))
EXECUTABLE = xvConvert

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

.cc.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

#bm_%.o: %.cc
#    $(CXX) $(CXXFLAGS) -c $< -o $@

clean :
	rm -f $(EXECUTABLE) $(OBJECTS)

.PHONY : all clean
