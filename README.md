
<img width="1536" height="1024" alt="memory_sv" src="https://github.com/user-attachments/assets/d5f709b4-90a8-4979-adbe-ca0ed03e2e3f" />

# Memory Verification Environment – SystemVerilog

A SystemVerilog-based verification environment for a synchronous memory module.  
Includes constrained-random stimulus, assertions, functional coverage, a scoreboard, BFMs, monitors, and UCDB coverage analysis.

---

## Project Structure

```text
mem_tb.sv           - Top-level testbench  
memory.sv           - DUT (Memory module)

mem_agent.sv        - Agent (generator + driver + monitor)
mem_gen.sv          - Stimulus generator
mem_tx.sv           - Transaction class
mem_bfm.sv          - Bus Functional Model (driver)
mem_mon.sv          - Monitor
mem_sbd.sv          - Scoreboard
mem_cov.sv          - Functional coverage model
mem_assert.sv       - Assertions
mem_env.sv          - Environment
mem_intrf.sv        - Interface
mem_comm.sv         - Common definitions

list.svh            - File list

run.do              - Compile/run script
wave.do             - Waveform configuration
cov.do              - Coverage script
exclusion.do        - Coverage exclusions

1wr.ucdb            - Coverage DB
1wr_1rd.ucdb        - Coverage DB
5wr.ucdb            - Coverage DB
5wr_5rd.ucdb        - Coverage DB
nwr_nrd.ucdb        - Coverage DB
final.ucdb          - Final merged coverage
```
## Features

### 1. Constrained-Random Stimulus
Randomized memory transactions with constraints on address, data, and read/write distribution.

### 2. Bus Functional Model
Implements cycle-accurate read and write operations to the memory DUT.

### 3. Assertions
Checks protocol correctness, timing rules, and address legality.

### 4. Functional Coverage
Tracks:
- Address ranges  
- Data distribution  
- Operation types  
- Cross coverage  

### 5. Scoreboard
Ensures end-to-end data consistency and read-after-write correctness.

### 6. UCDB Coverage
Multiple individual UCDBs plus a final merged coverage database.

### 7. Modular Testbench
UVM-style architecture (without using UVM library):  
Generator → Driver → DUT → Monitor → Scoreboard → Coverage

## Outputs

- Complete UCDB coverage databases  
- Final merged coverage report  
- Waveform dump  
- Simulation logs  
- Assertion logs  

---

## Author

**Rakesh Magapu**  
Aspiring VLSI & Verification Engineer  
Open to roles in Digital Design, Verification, and Frontend VLSI.
