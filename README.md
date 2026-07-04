This project relies on [Ada Drivers Library](https://github.com/AdaCore/Ada_Drivers_Library/) and enables to reference Nucleo-64 pins by their Arduino names.
```
-- For example:

with MB1360_Arduino;
with HAL.GPIO; use HAL.GPIO;
MB1360_Arduino.D0.Set_Mode (Input);

-- Instead of:

with STM32.Device;
with HAL.GPIO; use HAL.GPIO;
STM32.Device.PC5.Set_Mode (Input);
```

Pins mapping is shared between all boards that are built on the same PCB (Printed Circuit Board) layout. For example, pins mapping is identical across G070RB, G071RB and G0B1RE, because they all are built on MB1360 PCB. That's why mappings in this project are per-PCB and should suit all boards that share the same PCB layout.

## Usage

1. Go to [Ada Drivers Library](https://github.com/AdaCore/Ada_Drivers_Library/) . You need `STM32.Device` and `STM32.GPIO` packages with all their dependencies. I recommend to follow Ada Drivers Library's installation instructions
2. Find which PCB layout your Nucleo board uses. User manual includes it and it is printed on the board itself
3. Find the mapping file for your PCB in `src/` directory and download it to your project. If no file for your PCB exist yet, follow instructions below to create it. Please, consider opening a pull request afterwards

## How to add new PCB

1. Go to [STMicroelectronics' website](https://www.st.com/) and find your board
2. Go to "Documentation" and find user manual. It usually starts with "STM32 Nucleo-64 boards ..."
3. Supply the user manual to AI and ask it to generate a mapping file. You can use [this](./new_pcb_prompt.md) prompt
4. Save the file to `src/` folder