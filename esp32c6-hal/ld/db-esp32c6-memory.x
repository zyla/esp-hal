MEMORY
{
     /* MEMORY_MAP = [
        [0x00000000, 0x00010000, "PADDING"],
        [0x42800000, 0x43000000, "DROM"],
        [0x40800000, 0x40880000, "DRAM"],
        [0x40800000, 0x40880000, "BYTE_ACCESSIBLE"],
        [0x4004AC00, 0x40050000, "DROM_MASK"],
        [0x40000000, 0x4004AC00, "IROM_MASK"],
        [0x42000000, 0x42800000, "IROM"],
        [0x40800000, 0x40880000, "IRAM"],
        [0x50000000, 0x50004000, "RTC_IRAM"],
        [0x50000000, 0x50004000, "RTC_DRAM"],
        [0x600FE000, 0x60100000, "MEM_INTERNAL2"],
    ] */

    /* 512K of on soc RAM, 32K reserved for cache */
    ICACHE : ORIGIN = 0x40800000,  LENGTH = 32K

    RAM : ORIGIN = 0x40800000 + 32K, LENGTH = 512K - 32K

    /* External flash */
    ROM : ORIGIN =   0x42000000, LENGTH = 0x400000

    /* RTC fast memory (executable). Persists over deep sleep. */
    RTC_FAST : ORIGIN = 0x50000000, LENGTH = 16K /*- ESP_BOOTLOADER_RESERVE_RTC*/
}

REGION_ALIAS("REGION_TEXT", ROM);
REGION_ALIAS("REGION_RODATA", ROM);

REGION_ALIAS("REGION_DATA", RAM);
REGION_ALIAS("REGION_BSS", RAM);
REGION_ALIAS("REGION_STACK", RAM);

REGION_ALIAS("REGION_RWTEXT", RAM);
REGION_ALIAS("REGION_RTC_FAST", RTC_FAST);