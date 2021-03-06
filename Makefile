#############################################################################
# Makefile for building: libZone.so.1.0.0
# Generated by qmake (2.01a) (Qt 4.7.4) on: Mon Jan 16 01:34:10 2012
# Project:  ZonePlugin.pro
# Template: lib
# Command: /usr/bin/qmake -spec /usr/share/qt4/mkspecs/linux-g++-32 -o Makefile ZonePlugin.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_WEBKIT -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -m32 -pipe -m32 -mfpmath=sse -msse2 -O2 -Wall -W -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -m32 -pipe -m32 -mfpmath=sse -msse2 -O2 -Wall -W -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++-32 -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtGui -I/usr/include/qt4 -I. -I../Plugin -Ibuild/objects/release/moc -Ibuild/objects/release/uih
LINK          = g++
LFLAGS        = -m32 -m32 -mfpmath=sse -msse2 -Wl,-O1 -shared -Wl,-soname,libZone.so.1
LIBS          = $(SUBLIBS)  -L/usr/lib/x86_64-linux-gnu -L/usr/lib32 -lQtGui -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = build/objects/release/obj/

####### Files

SOURCES       = ZoneFilter.cpp \
		ZonePlugin.cpp build/objects/release/moc/moc_ZonePlugin.cpp \
		build/objects/release/rcc/qrc_resources.cpp
OBJECTS       = build/objects/release/obj/ZoneFilter.o \
		build/objects/release/obj/ZonePlugin.o \
		build/objects/release/obj/moc_ZonePlugin.o \
		build/objects/release/obj/qrc_resources.o
DIST          = /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		ZonePlugin.pro
QMAKE_TARGET  = Zone
DESTDIR       = 
TARGET        = libZone.so.1.0.0
TARGETA       = libZone.a
TARGETD       = libZone.so.1.0.0
TARGET0       = libZone.so
TARGET1       = libZone.so.1
TARGET2       = libZone.so.1.0

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile  $(TARGET)

$(TARGET): build/objects/release/uih/ui_Zone.h $(OBJECTS) $(SUBLIBS) $(OBJCOMP)  
	-$(DEL_FILE) $(TARGET) $(TARGET0) $(TARGET1) $(TARGET2)
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS) $(OBJCOMP)
	-ln -s $(TARGET) $(TARGET0)
	-ln -s $(TARGET) $(TARGET1)
	-ln -s $(TARGET) $(TARGET2)



staticlib: $(TARGETA)

$(TARGETA): build/objects/release/uih/ui_Zone.h $(OBJECTS) $(OBJCOMP) 
	-$(DEL_FILE) $(TARGETA) 
	$(AR) $(TARGETA) $(OBJECTS)

Makefile: ZonePlugin.pro  /usr/share/qt4/mkspecs/linux-g++-32/qmake.conf /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/lib/x86_64-linux-gnu/libQtGui.prl \
		/usr/lib/x86_64-linux-gnu/libQtCore.prl
	$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++-32 -o Makefile ZonePlugin.pro
/usr/share/qt4/mkspecs/common/g++.conf:
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/lib/x86_64-linux-gnu/libQtGui.prl:
/usr/lib/x86_64-linux-gnu/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++-32 -o Makefile ZonePlugin.pro

dist: 
	@$(CHK_DIR_EXISTS) build/objects/release/obj/Zone1.0.0 || $(MKDIR) build/objects/release/obj/Zone1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) build/objects/release/obj/Zone1.0.0/ && $(COPY_FILE) --parents ZoneFilter.h ZonePlugin.h build/objects/release/obj/Zone1.0.0/ && $(COPY_FILE) --parents resources.qrc build/objects/release/obj/Zone1.0.0/ && $(COPY_FILE) --parents ZoneFilter.cpp ZonePlugin.cpp build/objects/release/obj/Zone1.0.0/ && $(COPY_FILE) --parents Zone.ui build/objects/release/obj/Zone1.0.0/ && (cd `dirname build/objects/release/obj/Zone1.0.0` && $(TAR) Zone1.0.0.tar Zone1.0.0 && $(COMPRESS) Zone1.0.0.tar) && $(MOVE) `dirname build/objects/release/obj/Zone1.0.0`/Zone1.0.0.tar.gz . && $(DEL_FILE) -r build/objects/release/obj/Zone1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) $(TARGET0) $(TARGET1) $(TARGET2) $(TARGETA)
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: build/objects/release/moc/moc_ZonePlugin.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) build/objects/release/moc/moc_ZonePlugin.cpp
build/objects/release/moc/moc_ZonePlugin.cpp: ZonePlugin.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) ZonePlugin.h -o build/objects/release/moc/moc_ZonePlugin.cpp

compiler_rcc_make_all: build/objects/release/rcc/qrc_resources.cpp
compiler_rcc_clean:
	-$(DEL_FILE) build/objects/release/rcc/qrc_resources.cpp
build/objects/release/rcc/qrc_resources.cpp: resources.qrc \
		img/zones.png
	/usr/bin/rcc -name resources resources.qrc -o build/objects/release/rcc/qrc_resources.cpp

compiler_image_collection_make_all: build/objects/release/ui/qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) build/objects/release/ui/qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: build/objects/release/uih/ui_Zone.h
compiler_uic_clean:
	-$(DEL_FILE) build/objects/release/uih/ui_Zone.h
build/objects/release/uih/ui_Zone.h: Zone.ui
	/usr/bin/uic-qt4 Zone.ui -o build/objects/release/uih/ui_Zone.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean compiler_uic_clean 

####### Compile

build/objects/release/obj/ZoneFilter.o: ZoneFilter.cpp ZoneFilter.h \
		ZonePlugin.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o build/objects/release/obj/ZoneFilter.o ZoneFilter.cpp

build/objects/release/obj/ZonePlugin.o: ZonePlugin.cpp ZonePlugin.h \
		ZoneFilter.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o build/objects/release/obj/ZonePlugin.o ZonePlugin.cpp

build/objects/release/obj/moc_ZonePlugin.o: build/objects/release/moc/moc_ZonePlugin.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o build/objects/release/obj/moc_ZonePlugin.o build/objects/release/moc/moc_ZonePlugin.cpp

build/objects/release/obj/qrc_resources.o: build/objects/release/rcc/qrc_resources.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o build/objects/release/obj/qrc_resources.o build/objects/release/rcc/qrc_resources.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

