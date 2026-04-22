# 🌊 Wave Superposition Simulation

[![Processing](https://img.shields.io/badge/Processing-4.x-blue)](https://processing.org/)
[![Language](https://img.shields.io/badge/Language-Processing%20(Java)-orange)](https://processing.org/)
[![License](https://img.shields.io/badge/License-GNU%20GPLv3-green)](https://www.gnu.org/licenses/gpl-3.0.en.html)

This project is an interactive simulation developed in Processing that visualises wave propagation and the formation of standing waves through superposition.

It allows users to explore how two waves travelling in opposite directions combine, using real-time controls for frequency and velocity.

---

## 🎓 Academic Context

This project has been developed as part of the Multimedia degree programme coursework.  
Its purpose is to support the understanding of fundamental wave physics concepts through visual and interactive representation.

---

## ⚠️ Language Notice

Please note that parts of this project (including comments within the source code and interface elements) are currently written in Catalan, as this is the language in which the course is being delivered.

An English version will be provided in due course.

---

## ✨ Features

- Real-time simulation of two travelling waves
- Visualisation of wave superposition (standing waves)
- Interactive sliders for:
  - Frequency (F)
  - Wave velocity (V)
- Clear colour differentiation between:
  - Wave 1 (rightward propagation)
  - Wave 2 (leftward propagation)
  - Resulting wave (superposition)
- Direction indicators for wave movement
- Toggle screen (press SPACE) to display author name

---

## ⚙️ Controls

- **Sliders (top of the window):**
  - Adjust frequency and velocity dynamically
- **Keyboard:**
  - Press `SPACE` to toggle between:
    - Simulation view
    - Author display screen

---

## 🧠 How It Works

The simulation is based on fundamental wave equations:

- Wavelength:  
  λ = V / F

- Angular frequency:  
  ω = 2πF

- Wave number:  
  k = 2π / λ

Two waves are generated:

- Wave 1: travelling to the right  
- Wave 2: travelling to the left  

Their sum produces a standing wave pattern, which is visualised in real time.

---

## 🛠️ Technologies Used

- Processing (Java-based creative coding framework)
- ControlP5 library (for GUI elements such as sliders)

---

## 📦 Installation

1. Download and install Processing:  
   https://processing.org/

2. ⚠️ **Dependency Notice**

   This project requires the **ControlP5** library developed by Andreas Schlegel.  
   The sketch will not run correctly unless this library is installed.

3. Install the ControlP5 library:
   - Open Processing
   - Go to `Sketch → Import Library → Add Library`
   - Search for **ControlP5** (by Andreas Schlegel)
   - Click **Install**

4. Clone this repository:
   ```bash
   git clone https://github.com/claudiacordobam/WaveSuperpositionSimulation.git
   ```
5. Open the `.pde` file in Processing and run the sketch.

---

## 📸 Preview

The simulation displays:

Two independent waves (top and middle)
Their resulting superposition (bottom)
Direction arrows indicating propagation

---

## 👩‍💻 Author

**Claudia Córdoba**
Multimedia student exploring the intersection of technology, physics, and creativity.

---

## 📄 Licence

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.  
You are free to use, modify, and distribute this software under the terms of the GPL licence.
See the [LICENSE](LICENSE) file for details. 📝
