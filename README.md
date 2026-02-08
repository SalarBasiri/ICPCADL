
# 8-Channel Synchronous ICP Accelerometer Datalogger

## 📌 Project Overview

Developed in **2005** at **Guilan University**, this project was commissioned by the **Civil Engineering Department** to monitor structural vibrations and seismic behavior in scale models. The system is a complete mechatronics solution featuring custom signal conditioning, multi-MCU firmware, and a Delphi-based control interface.

🎥 [**Watch the System Demonstration on YouTube**](https://www.youtube.com/watch?v=GTqIrTORt20)

----------

## 📺 Demonstration Highlights

The linked video demonstrates the following key aspects of the project:

-   **The Test Setup:** A scale model of a building tower is mounted on a seismic shaker table controlled by an inverter [[00:19](http://www.youtube.com/watch?v=GTqIrTORt20&t=19)].
    
-   **Hardware in Action:** The ICP accelerometer is mounted on the tower, sending signals via BNC cables to the custom datalogger [[01:20](http://www.youtube.com/watch?v=GTqIrTORt20&t=80)].
    
-   **Real-time Software:** The Delphi application is shown configured for sampling, displaying real-time acceleration waveforms [[03:30](http://www.youtube.com/watch?v=GTqIrTORt20&t=210)].
    
-   **Physical Interface:** A look at the physical device featuring the LCD for standalone RMS/Peak monitoring and the 4x4 keypad [[06:06](http://www.youtube.com/watch?v=GTqIrTORt20&t=366)].
    

----------

## 🛠 Technical Specifications

### **Simultaneous Sample-and-Convert Architecture**

Unlike multiplexed systems, this architecture manages **8 separate AD1674 (12-bit) converters** in parallel.

-   **Synchronicity:** A central AVR "Main Controller" triggers all 8 converters simultaneously to ensure no phase lag between channels—essential for structural modal analysis [[03:05](http://www.youtube.com/watch?v=GTqIrTORt20&t=185)].
    
-   **High-Speed Transfer:** Data is pushed to the PC via the **Parallel Port (EPP Mode)** using custom assembly timing [[08:23](http://www.youtube.com/watch?v=GTqIrTORt20&t=503)].
    
-   **Sampling Rate:** Hardware supports up to **5,000 Samples per Second (5 kS/s)** per channel [[03:37](http://www.youtube.com/watch?v=GTqIrTORt20&t=217)].
    

### **Signal Conditioning**

-   **ICP Support:** Integrated constant current source (adjustable 2mA to 10mA) to power the internal electronics of piezoelectric sensors [[00:55](http://www.youtube.com/watch?v=GTqIrTORt20&t=55)].
    
-   **Programmable Gain:** Gain levels from **1 to 2200** are software-selectable, managed by a dedicated AVR controller and CD4051 analog muxes [[04:10](http://www.youtube.com/watch?v=GTqIrTORt20&t=250)].
    
-   **Digital Filtering:** The software includes an **FIR (Finite Impulse Response)** filter with a selectable cutoff frequency (8Hz to 500Hz) to eliminate high-frequency noise [[04:45](http://www.youtube.com/watch?v=GTqIrTORt20&t=285)].
    

----------

## 📁 Repository Structure

-   `/Software_Delphi`: Source code for the Windows XP desktop application.
    
-   `/Firmware_AVR`: BASCOM source code for the three-controller architecture (Main, Gain, and LCD/UI) [[06:58](http://www.youtube.com/watch?v=GTqIrTORt20&t=418)].
    
-   `/Hardware_Design`: Schematics and PCB layouts.
    
-   `/Docs`: The original Khwarizmi Young Award report and technical paper.
    

----------

## ⚠️ Legacy Note

This system was designed for Windows XP. It utilizes the **PortTalk** driver (`porttalk.sys` and `allowio.exe`) to perform direct hardware I/O via the Parallel Port [[08:23](http://www.youtube.com/watch?v=GTqIrTORt20&t=503)]. Modern 64-bit Windows versions will require hardware-level emulation or legacy environments to run the software.

----------

## 🎓 Credits

-   **Developer:** Salar Basiri (Mechanical Engineering)
    
-   **Supervision:** Dr. Fallah, Guilan University [[09:50](http://www.youtube.com/watch?v=GTqIrTORt20&t=590)]
    
-   **Partnership:** Faculty of Engineering, Civil Engineering Department
    

  
  

**Security & Licensing Implementation:** The production version of the software featured a custom-built hardware USB lock (Dongle) system to restrict usage to authorized workstations at Guilan University. A "Debug/Unlocked" version is included in this repository for archival and demonstration purposes.

---

## ⚖️ License & Copyright

Copyright (c) 2005-2024 Salar Basiri

This project is licensed under the **MIT License**. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
