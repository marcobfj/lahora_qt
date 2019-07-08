
DEFINES = -DQT_DEPRECATED_WARNINGS -DQT_CORE_LIB
FLAGS = -pipe -stdlib=libc++ -g -std=gnu++11 $(EXPORT_ARCH_ARGS) -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -mmacosx-version-min=10.10 -Wall -W -fPIC $(DEFINES)
INCPATH = -I. -I. -I/usr/local/Qt-5.9.7/lib/QtCore.framework/Headers -I. -I/usr/local/Qt-5.9.7/mkspecs/macx-clang -F/usr/local/Qt-5.9.7/lib
LFLAGS = -stdlib=libc++ -headerpad_max_install_names $(EXPORT_ARCH_ARGS) -Wl,-syslibroot,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -mmacosx-version-min=10.10 -Wl,-rpath,@executable_path/Frameworks -Wl,-rpath,/usr/local/Qt-5.9.7/lib
LIBS = $(SUBLIBS) -F/usr/local/Qt-5.9.7/lib -framework QtCore -framework DiskArbitration -framework IOKit 



#Buscar que significa esto
EXPORT_ACTIVE_ARCHS = $(filter $(EXPORT_VALID_ARCHS), $(ARCHS))
EXPORT_VALID_ARCHS = x86_64
EXPORT_ARCH_ARGS = $(foreach arch, $(if $(EXPORT_ACTIVE_ARCHS), $(EXPORT_ACTIVE_ARCHS), $(EXPORT_VALID_ARCHS)), -arch $(arch))

OBJECTS = myTime.o moc_myTime.o main.o 

#all: myTime.o moc_myTime.o main.o  
all: time_app_m

time_app_m: $(OBJECTS)
	clang++ $(LFLAGS) -o time_app_m myTime.o moc_myTime.o main.o $(LIBS)
	@echo  "¡Listo!"

main.o: main.cpp
	clang++ -c $(FLAGS) $(INCPATH) -o main.o main.cpp

myTime.o: myTime.cpp myTime.h
	clang++ -c $(FLAGS) $(INCPATH) -o myTime.o myTime.cpp

moc_myTime.o: moc_myTime.cpp
	clang++ -c $(FLAGS) $(INCPATH) -o moc_myTime.o moc_myTime.cpp 

moc_myTime.cpp: myTime.h
	moc -o moc_myTime.cpp myTime.h 

clean:
	rm $(OBJECTS) moc_myTime.cpp time_app_m