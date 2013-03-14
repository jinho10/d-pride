QEMU_ROOT ?= ..
XEN_ROOT ?= $(QEMU_ROOT)/../xen-unstable.hg

include ../config-host.mak

TARGET_ARCH=i386
TARGET_PATH:=$(SRC_PATH)/$(TARGET_DIRS)
CONFIG_SOFTMMU=yes

TARGET_CPPFLAGS += -isystem /usr/src/xen-4.1-testing.hg/stubdom/../extras/mini-os/include -D__MINIOS__ -DHAVE_LIBC -isystem /usr/src/xen-4.1-testing.hg/stubdom/../extras/mini-os/include/posix -isystem /usr/src/xen-4.1-testing.hg/stubdom/../tools/xenstore  -isystem /usr/src/xen-4.1-testing.hg/stubdom/../extras/mini-os/include/x86 -isystem /usr/src/xen-4.1-testing.hg/stubdom/../extras/mini-os/include/x86/x86_32 -U __linux__ -U __FreeBSD__ -U __sun__ -nostdinc -isystem /usr/src/xen-4.1-testing.hg/stubdom/../extras/mini-os/include/posix -isystem /usr/src/xen-4.1-testing.hg/stubdom/cross-root-i686/i686-xen-elf/include -isystem /usr/lib/i386-linux-gnu/gcc/i686-linux-gnu/4.4.5/include -isystem /usr/src/xen-4.1-testing.hg/stubdom/lwip-x86_32/src/include -isystem /usr/src/xen-4.1-testing.hg/stubdom/lwip-x86_32/src/include/ipv4 -I/usr/src/xen-4.1-testing.hg/stubdom/include -I../xen/include -DCONFIG_STUBDOM -D__XEN_TOOLS__
TARGET_CFLAGS=  -O1 -fno-omit-frame-pointer -fno-optimize-sibling-calls  -m32 -march=i686 -m32 -march=i686 -g -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-value -Wdeclaration-after-statement  -fno-stack-protector -fno-exceptions
TARGET_LDFLAGS= -nostdlib -L/usr/src/xen-4.1-testing.hg/stubdom/cross-root-i686/i686-xen-elf/lib

bindir = ${LIBEXEC}