/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) :
  	ORIGIN = 0x1f000,
  	LENGTH = 0x28000
  RAM (rwx) :
  	ORIGIN = 0x20003800,
  	LENGTH = 0xc800
}

SECTIONS
{
  .fs_data :
  {
    PROVIDE(__start_fs_data = .);
    KEEP(*(.fs_data))
    PROVIDE(__stop_fs_data = .);
  } > RAM

} INSERT AFTER .data;

INCLUDE "nrf5x_common.ld"
