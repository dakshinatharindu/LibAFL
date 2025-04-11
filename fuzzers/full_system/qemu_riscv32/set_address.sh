#!/bin/bash

FILE="src/fuzzer_breakpoint.rs"

# Magic number
# NEW_FUZZ_INPUT_ADDR="0x20020000"
# NEW_MAX_INPUT_SIZE="4"

# # Firmware size
# NEW_FUZZ_INPUT_ADDR="0x20020004"
# NEW_MAX_INPUT_SIZE="4"

# # Firmware version tag
# NEW_FUZZ_INPUT_ADDR="0x2002000C"
# NEW_MAX_INPUT_SIZE="4"

# # Timestamp tag
# NEW_FUZZ_INPUT_ADDR="0x20020014"
# NEW_MAX_INPUT_SIZE="8"

# # Digest
# NEW_FUZZ_INPUT_ADDR="0x2002001F"
# NEW_MAX_INPUT_SIZE="32"

# Signature
NEW_FUZZ_INPUT_ADDR="0x20020043"
NEW_MAX_INPUT_SIZE="64"

# Update FUZZ_INPUT_ADDR
sed -i "s/^pub static FUZZ_INPUT_ADDR: GuestPhysAddr = .*/pub static FUZZ_INPUT_ADDR: GuestPhysAddr = $NEW_FUZZ_INPUT_ADDR;/" "$FILE"

# Update MAX_INPUT_SIZE
sed -i "s/^pub static mut MAX_INPUT_SIZE: usize = .*/pub static mut MAX_INPUT_SIZE: usize = $NEW_MAX_INPUT_SIZE;/" "$FILE"

echo "Updated FUZZ_INPUT_ADDR to $NEW_FUZZ_INPUT_ADDR and MAX_INPUT_SIZE to $NEW_MAX_INPUT_SIZE in $FILE"