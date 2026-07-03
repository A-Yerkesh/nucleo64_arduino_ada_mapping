Pins mapping is shared between all microcontrollers that are built on the same PCB (Printed Circuit Board). For example, pins mapping is identical across G070RB, G071RB and G0B1RE, because they all are built on MB1360 PCB. That's why mappings in this project are per-PCB and should suit all microcontrollers that share the same PCB.

## How to add new PCB

1. Go to [STMicroelectronics' website](https://www.st.com/) and find chosen board
2. Go to "Documentation" and find user manual. It usually starts with "STM32 Nucleo-64 boards ..."
3. Supply the user manual to AI and ask it to generate a mapping file. You can use [this](./new_pcb_prompt.md) prompt