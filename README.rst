
# OpenDFT Framework: Reproducible Design for Test Flow for Open Source CPUs

## Abstract

Open source processors such as Microwatt have become important platforms for education and innovation in digital design. However, they often lack industry grade Design for Testability (DFT) features that are necessary to make hardware manufacturable, verifiable, and robust in silicon.  

This project introduces the **OpenDFT Framework**, the first open and reproducible methodology for integrating scan chains, memory built in self test (MBIST), and power aware test features into open source CPUs. The framework is demonstrated on the Microwatt POWER core but is generalizable to other designs. The contributions include scan insertion across pipeline and control registers, MBIST integration for the data memory, and power aware strategies such as shift clock gating and X masking. The project will deliver fault coverage improvements with measured area, timing, and power overheads using open source EDA tools.  

---

## Introduction

The growth of open source hardware has created new opportunities for community driven innovation, yet a critical gap remains between functional RTL prototypes and tapeout ready silicon. In professional chip design flows, DFT ensures that manufacturing defects can be detected, yield can be improved, and long term reliability can be achieved. Without DFT, processors that are correct in simulation may still fail in silicon due to untested faults or excessive power surges during test.  

Microwatt, an open source POWER ISA CPU core, is widely used as a baseline for learning and experimentation. However, like most open source CPUs, it does not include built in DFT features. This project addresses this limitation by introducing a structured and reproducible framework, **OpenDFT**, to systematically integrate testability into open source processors.  

---

## Methodology

### Scan Chain Insertion
Pipeline and control registers in Microwatt are augmented with scan enabled flip flops. This enables direct control and observability of internal states through scan in and scan out pins. Multiple balanced chains are used to reduce test time and to mitigate hold time violations.  

### Memory Built In Self Test (MBIST)
Microwatt’s data memory is wrapped with a self test controller that implements March algorithms such as March C. These patterns are applied automatically to detect stuck at and transition faults. The MBIST logic includes an address generator, data pattern generator, comparator, and fail log register.  

### Power Aware Test Features
To address reliability challenges during test, two enhancements are applied.  
- **Scan shift clock gating** reduces unnecessary switching during scan load and unload.  
- **X masking in the MISR** prevents unknown values from corrupting signature compression.  

These features ensure that test execution does not cause unrealistic power spikes or IR drop issues.  

## Block Diagram and Framework Overview

![Block Diagram](Screenshot%202025-09-22%20163756.png)

Figure 1: Overview of the OpenDFT Framework. The diagram illustrates how Design for Testability features are integrated into the Microwatt CPU, including scan chain insertion for pipeline registers, a memory BIST wrapper for fault detection, and power aware test control for reliable operation. Together, these components demonstrate a reproducible methodology for making open source CPUs silicon ready.

### Evaluation Flow
The modified Microwatt RTL will be validated using open source tools:  
- **Simulation**: Verilator and Icarus Verilog for functional and fault campaigns  
- **Synthesis and Timing**: Yosys and OpenSTA  
- **Physical Implementation**: OpenROAD and OpenLane for realistic timing and power  
- **Power Estimation**: VCD based switching activity analysis  
- **Fault Simulation**: Python based injection and coverage calculation  

---

## Results (Expected)

The OpenDFT enhanced Microwatt will be compared against the baseline to measure:  
- **Fault Coverage**: improvements in stuck at and transition fault detection  
- **Timing Overhead**: slack reduction and maximum frequency impact  
- **Area Overhead**: additional gates introduced by scan cells and MBIST logic  
- **Power Overhead**: functional power versus test mode switching power  

It is expected that fault coverage will exceed ninety five percent with less than ten percent overhead in timing and area, and that scan shift switching activity will be significantly reduced relative to a naïve DFT insertion.  

---

## Conclusion and Future Work

This project establishes the **OpenDFT Framework**, a reproducible methodology for integrating DFT into open source CPUs. Demonstrated on Microwatt, the framework provides scan chain insertion, MBIST integration, and power aware test features with measurable improvements in test coverage and reproducibility. Beyond Microwatt, the methodology can be extended to other open source processors, enabling community driven projects to move closer to manufacturable and silicon ready designs.  

Future extensions may include hierarchical DFT for multicore architectures, AI driven test generation for functional coverage closure, and DFT integration for analog and mixed signal subsystems.  

---

---

## Open Source License

All project materials are released under the **Apache 2.0 License**, ensuring free and unrestricted use in alignment with the OpenPOWER Foundation’s open source ethos. 
