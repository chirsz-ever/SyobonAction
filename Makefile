#CXX=g++
RC       =   windres
DXLIB    =   ./dxlib
CXXFLAGS =   -I$(DXLIB) -DUNICODE -D_UNICODE
LDFLAGS  =   -L$(DXLIB)
LDFLAGS  +=  -lDxLibW -lDxUseCLibW -lDxDrawFunc -ljpeg -lpng -lzlib -ltiff\
             -ltheora_static -lvorbis_static -lvorbisfile_static -logg_static\
             -lopusfile -lopus -lsilk_common -lcelt
LDFLAGS  +=  -mwindows

TARGET   = syobon_action.exe
OBJS     = src/main.o src/loadg.o src/resource.o

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

src/resource.o: src/resource.rc
	$(RC) $< -o $@

src/resource.o: src/icon.ico
src/main.o:     src/main.h $(DXLIB)/DxLib.h
src/loadg.o:    $(DXLIB)/DxLib.h

.PHONY: clean run
clean:
	-rm -rf $(TARGET) $(OBJS)

run:$(TARGET)
	./$(TARGET)
