TARGET = retrogram-rtlsdr
LIBS = -lncurses -lboost_program_options -lrtlsdr -lsndfile -lm -lfftw3 -lasound
CXX = g++
CXXFLAGS = -g -Wall -std=c++11

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = retrogram-rtlsdr.cpp sound.cpp fir.cpp coeff.cpp meanvalue.cpp
HEADERS = ascii_art_dft.hpp

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(CXXFLAGS) $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
