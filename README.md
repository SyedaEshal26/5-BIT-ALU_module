## 1. **INTRODUCTION TO ARTHEMATIC LOGIC UNIT **
---
This project implements a 5-bit Arithmetic Logic Unit (ALU) in Verilog. The ALU performs basic arithmetic operations: Addition, Subtraction, and Multiplication. The project is designed to test skills in digital system design, Verilog programming, Simulation.


## 2. **PROJECT STRUTURE**
---
### **5-bit-ALU**

├── alu_ad.v

├── alu_sub.v

├── alu_mul.v

├── alu_top.v

├── registor.v

## 3. **MODULES**
---
### **1. alu_ad.v**
**This code implements a 5-bit Arithmetic Logic Unit (ALU) specifically for addition.**

-The module `alu_add` takes two 5-bit operands (_`operand_a and operand_b`_) as input and outputs the 5-bit sum (_`result`_) along with a carry-out bit (_`carry_out`_).

-It utilizes a cascade of five full adders (_`full_adder`_) to perform the addition on each bit position, handling potential carry propagation.

-The provided `full_adder` module implements the full adder logic using XOR and logic gates for efficient sum and carry-out generation.

-This description highlights the functionality of the code, the key components (_`alu_add and full_adder`_), and their roles.


### **2. alu_sub.v**

**This code implements a 5-bit Arithmetic Logic Unit (ALU) specifically for addition.**

-The module `alu_sub` takes two 5-bit operands (_`operand_a and operand_b`_) as input and outputs the 5-bit sum (_`result`_) along with a borrow-out bit (_`borrow_out`_).

-It utilizes a cascade of five full subtracters (_`full_subtracter`_) to perform the addition on each bit position, handling potential borrow propagation.

-The provided `full_subtracter` module implements the full subtracter logic using XOR and logic gates for efficient sum and borrow-out generation.

-This description highlights the functionality of the code, the key components (_`alu_sub and full_subtracter`_), and their roles.

### **3. alu_mult.v**

**This code implements a 5-bit x 5-bit unsigned multiplication unit.**

-The module `alu_mult` takes two 5-bit operands (_`operand_a and operand_b`_) as input and outputs the 10-bit unsigned product (_`result`_).

-It employs a bit-by-bit multiplication algorithm. For each bit position (_`i`_) in operand_b:
If the bit is set (_`1`_), the module adds operand_a shifted left by i positions to the temporary result (_`temp_result`_).

-This approach efficiently handles partial product accumulation.

-Internal registers (_`temp_result, temp_a, temp_b`_) and a loop (_`for`_) facilitate the multiplication process.

### **4. register.v**

#### 4a. register_input.v 

**This code implements a 5-bit register with a load enable.**

-The module register_input takes a clock signal (_`clk`_), 5-bit data input (_`data_in`_), and a load signal (_`load`_) as inputs.
-It outputs a 5-bit register output (_`reg_out`_).
-The register updates its value (_`reg_out_`) with the provided data (_`data_in_`) only on the positive edge of the clock (_`posedge clk_`) when the load signal (_`load_`) is asserted high (_`1_`).
-This behavior ensures the register retains its value until a new load operation occurs.
#### 4b. register_output.v 

**This code implements a 5-bit register with an enable.**

-The module register_output takes a clock signal (_`clk_`), 5-bit data input (_`data_in_`), and an enable signal (_`enable_`) as inputs.
-It outputs a 5-bit register output (_`reg_out_`).
-Similar to register_input, it updates its value (_`reg_out_`) with the provided data (_`data_in_`) only on the positive edge of the clock (_`posedge clk_`) but under the control of the enable signal (_`enable_`).
-When enable is high (_`1_`), the register updates; otherwise, it retains its current value.



### **4. alu_top.v**

**This code implements a top-level module for a 5-bit Arithmetic Logic Unit (ALU) with register support.**

* The module _`alu_top`_ provides a user interface for the ALU functionality.
* It takes various control signals:
    * _`clk`_: Clock signal for register updates.
    * _`load_a`_ and _`load_b`_: Load signals for operand registers (_`reg_a`_ and _`reg_b`_).
    * _`data_in`_: Common data input for both operands.
    * _`op_sel`_: Operation selection signal (_`00`_ for addition, _`01`_ for subtraction, _`10`_ for multiplication).
    * _`enable_out`_: Enable signal for the output register.
    
* It outputs the final result (_`result`_) on a 10-bit bus.

Internally, the module utilizes:

* Registers (_`reg_a`_ and _`reg_b`_) to store operands (_`operand_a`_ and _`operand_b`_).
* Separate ALU modules (_`adder`_, _`subtractor`_, _`multiplier`_) for performing addition, subtraction, and multiplication, respectively.
* An operation selection logic that chooses the appropriate ALU output based on _`op_sel`_.
* An output register to hold the final result before it's driven to the output bus.

This description highlights the overall functionality, user interface, and internal components of the top-level ALU module.

## 6. ** GETTING STARTED**
---
```
git clone https://github.com/SyedaEshal26/5-bit-ALU.git
cd 5-bit-ALU
```

## 6. ** USAGE**
---
1. Open ModelSim/Quartus Prime.
2. Create a new project and add all Verilog files.
3. Compile the project.
4. Run the testbench and verify the results.


## 7. **Contributing**
---
If you would like to contribute to this project, please fork the repository and submit a pull request.
***
---
---
---
