#CXX=g++
RC       =   windres
DXLIB    =   ./dxlib
CXXFLAGS =   -I$(DXLIB)
LDFLAGS  =   -L$(DXLIB)
LDFLAGS  +=  -lDxLib -lDxUseCLib -lDxDrawFunc -ljpeg -lpng -lzlib -ltiff\
             -ltheora_static -lvorbis_static -lvorbisfile_static -logg_static\
             -lopusfile -lopus -lsilk_common -lcelt
LDFLAGS  +=  -mwindows

BUILDDIR  = build
TARGET    = syobon_action.exe
OBJS      = main.o loadg.o resource.o
BUILDOBJS = $(OBJS:%.o=$(BUILDDIR)/%.o)

all: $(BUILDDIR) $(TARGET)

${BUILDDIR}:
	@if [ ! -d $@ ]; then mkdir -p $@; fi;

$(TARGET): $(BUILDOBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/resource.o: src/resource.rc
	$(RC) $< -o $@

$(BUILDDIR)/%.o: src/%.cpp
	$(CXX) -c $< -o $@  $(CXXFLAGS)

$(BUILDDIR)/resource.o: src/icon.ico
$(BUILDDIR)/main.o:     src/main.h $(DXLIB)/DxLib.h
$(BUILDDIR)/loadg.o:    $(DXLIB)/DxLib.h

.PHONY: clean run all
clean:
	-rm -rf $(TARGET) $(BUILDOBJS)

run:$(TARGET)
	./$(TARGET)
