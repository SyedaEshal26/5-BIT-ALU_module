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

## 5. **TEST_BENCH**
---
ALU TOP MODEL TEST BENCH 
```
module tb_alu_top;
    // Testbench signals
    reg clk;
    reg load_a;
    reg load_b;
    reg [4:0] data_in;
    reg [1:0] op_sel;
    reg enable_out;
    wire [9:0] result;

    // VCD file declaration
    initial begin
        $dumpfile("tb_alu_top.vcd"); // Name your VCD file here
        $dumpvars(0, tb_alu_top);   // Dump all signals starting at time 0
    end

    // Instantiate the ALU top module
    alu_top uut (
        .clk(clk),
        .load_a(load_a),
        .load_b(load_b),
        .data_in(data_in),
        .op_sel(op_sel),
        .enable_out(enable_out),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        load_a = 0;
        load_b = 0;
        data_in = 5'b0;
        op_sel = 2'b0;
        enable_out = 0;

        // Apply test vectors
        // Test Addition
        #10 data_in = 5'b00101; load_a = 1; #10 load_a = 0; // Load operand_a = 5
        #10 data_in = 5'b00011; load_b = 1; #10 load_b = 0; // Load operand_b = 3
        #10 op_sel = 2'b00; enable_out = 1; #10 enable_out = 0; // Perform addition: 5 + 3

        // Test Subtraction
        #10 data_in = 5'b01010; load_a = 1; #10 load_a = 0; // Load operand_a = 10
        #10 data_in = 5'b00100; load_b = 1; #10 load_b = 0; // Load operand_b = 4
        #10 op_sel = 2'b01; enable_out = 1; #10 enable_out = 0; // Perform subtraction: 10 - 4

        // Test Multiplication
        #10 data_in = 5'b00011; load_a = 1; #10 load_a = 0; // Load operand_a = 3
        #10 data_in = 5'b00010; load_b = 1; #10 load_b = 0; // Load operand_b = 2
        #10 op_sel = 2'b10; enable_out = 1; #10 enable_out = 0; // Perform multiplication: 3 * 2

        // Finish simulation
        #20 $finish;
    end

    // Monitor results
    initial begin
        $monitor("Time = %0t, clk = %b, load_a = %b, load_b = %b, data_in = %b, op_sel = %b, enable_out = %b, result = %b",
                 $time, clk, load_a, load_b, data_in, op_sel, enable_out, result);
    end
endmodule
```

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
