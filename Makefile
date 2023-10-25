include ../Makefile.common

CHECKFILE = check-x64
ASMFILE = bonus_x64
ASFLAGS = -felf64
CFLAGS = -fno-pie -no-pie -g
LDFLAGS = -fno-pie -no-pie -g
DEPS = $(CHECKFILE).o $(ASMFILE).o

all: checker

build: checker

$(CHECKFILE).o: $(CHECKFILE).c
	$(CC) $(CFLAGS) -c $< -o $@

$(ASMFILE).o: $(ASMFILE).asm
	nasm -g $(ASFLAGS) $< -o $@

checker: $(DEPS)
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o checker

debug: checker
	gdb -ex "break intertwine" -ex "run" ./checker