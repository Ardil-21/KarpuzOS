OSNAME = karpuzos
BUILD = build
ISO = $(OSNAME).iso

all: clean iso

$(BUILD):
	mkdir -p $(BUILD)/boot/grub

kernel:
	$(CC) -m32 -ffreestanding -c kernel/kernel.c -o $(BUILD)/kernel.o
	ld -m elf_i386 -Ttext 0x100000 -o $(BUILD)/kernel.bin $(BUILD)/kernel.o --oformat binary

iso: kernel
	cp grub/grub.cfg $(BUILD)/boot/grub/grub.cfg
	cp $(BUILD)/kernel.bin $(BUILD)/boot/kernel.bin
	grub-mkrescue -o $(ISO) $(BUILD)

clean:
	rm -rf $(BUILD) $(ISO)
