The STM32 Nucleo board User Manual (UMxxxx) is supplied together with this
prompt. Produce a single Ada package specification file mapping the board's
Arduino Uno V3 header pins to STM32 GPIO pins.

Assume the target Ada GPIO library declares an individual `GPIO_Point`
constant for every physical pin, named by its port and number (`PA0`,
`PA1`, `PB11`, etc.).

## Steps

1. **Identify the PCB reference**, not the MCU order code. This is usually
   stated as "MBxxxx" in the manual's ordering information, product-marking,
   or mechanical-parts section.

2. **Locate the ARDUINO connector pinout table** (typically titled something
   like "ARDUINO connector pinout"). For every Arduino-named signal (A0–A5,
   D0–D15), extract the corresponding STM32 pin (e.g. PA5, PB11).

3. **Exclude non-GPIO entries** — any row whose STM32-pin column is blank/"-"
   or names a non-GPIO signal (NC, IOREF, NRST, 3V3, 5V, GND, VIN,
   AVDD/VREF+, VBAT, etc.).

4. **Resolve ambiguous entries.** Some cells list two possible STM32 pins
   joined by "or" — this happens when a solder bridge can reroute a pin to
   an alternate function. For each such pin:
   - Check the manual's I/O assignment table (if present) for the single pin
     listed there as the primary/default function — use that.
   - Check the manual's solder-bridge/jumper table for which bridge governs
     the choice and its factory-default state.
   - If, after checking both tables, the ambiguity is still not confidently
     resolved, **do not produce the file**. State clearly which pin(s)
     remain ambiguous and why the available tables don't settle it, and
     stop — do not guess or fill in an assumption.

## Output format

If every pin was resolved, produce exactly one Ada package specification
file:

- **File name:** `<pcb_reference_lowercase>_arduino.ads`
- **Package name:** `<PCB_Reference>_Arduino`
- **Context clauses:** exactly `with STM32.Device; use STM32.Device;` and
  `with STM32.GPIO; use STM32.GPIO;` — nothing else.
- **Exactly two comment blocks**, at the top of the file, and no comments
  anywhere else:
  - A `Source:` block citing the exact document title, revision, and table
    name/number used.
  - A `Notes:` block, included only if step 4 applied to at least one pin —
    omit it entirely otherwise. State which Arduino pin(s) were affected,
    the resolved STM32 pin, the alternate pin, and what switches between
    them.
- **One declaration per pin**, in exactly this form:

  ```
  <Name> : GPIO_Point renames <STM32_Pin_Name>;
  ```

  where `<STM32_Pin_Name>` is the port+number identifier for that pin
  (e.g. `PA5`, `PB11`).
- **Order:** A0–A5 first, then D0–D15, ascending. No section headers, no
  blank-line groupings, no per-line comments.
- End the file with `end <Package_Name>;`

Do not include usage examples, clock-initialization code, HAL-architecture
explanations, or any comment beyond the two blocks specified above.

## Illustrative format example (placeholder values only)

```ada
--  Source: UMxxxx Rev N, Table N ("ARDUINO connector pinout").
--
--  Notes: <describe any ambiguous pin here, or omit this block entirely
--  if nothing was ambiguous>.

with STM32.Device; use STM32.Device;
with STM32.GPIO; use STM32.GPIO;

package MBxxxx_Arduino is

   A0 : GPIO_Point renames PA0;
   ...
   D15 : GPIO_Point renames PB8;

end MBxxxx_Arduino;
```

## If information is missing

If the source document does not clearly state a PCB reference, ask for it
rather than guessing from the MCU order code alone.