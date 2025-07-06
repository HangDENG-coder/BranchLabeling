# BranchTerminal GUI

This MATLAB GUI enables manual annotation of branch and terminal points in 3D neuron images, particularly for low-resolution reconstructions (e.g., mouse brain). It supports image browsing, annotation, and saving results for downstream training or correction.

![GUI interface](BranchLabeling/label/BP_GUI.png)

## 📦 Requirements

- MATLAB (tested with versions supporting `.fig` GUIs)
- Image files in `.mat` format with a 3D matrix (e.g., `image_data` or `I`)

## 🚀 Launch the GUI

```matlab
BranchTerminal
```

This will open the GUI window (`BranchTerminal.fig`) and initialize the interface.

## 🖱️ Basic Usage

### 1. 📂 Load Image
- Click `Open` or the corresponding button.
- Select a `.mat` file containing a 3D image stack.

### 2. 🔍 Navigate Slices
- Use the slider or buttons to scroll through Z-planes.
- Plane index and intensity are shown above the view.

### 3. 📌 Add Annotations
- **Left-click** on the image to add a **branch point** (shown in one color).
- **Right-click** to add a **terminal point** (different color).
- Points are stored per Z-slice.

### 4. 🧽 Undo & Clear
- `Undo` removes the last clicked point on the current slice.
- `Clear` removes all annotations from the current slice.

### 5. 💾 Save Labels
- Press `Save` to export annotation results.
- Saved as `.mat` files:
  - `branch_mask`: binary mask of branch points
  - `terminal_mask`: binary mask of terminal points
  - `coords_branch`, `coords_terminal`: coordinate arrays

## 📁 Output Format

```matlab
branch_mask: 3D binary matrix (same size as input)
terminal_mask: 3D binary matrix
coords_branch: Nx3 array of [x, y, z] for branch points
coords_terminal: Mx3 array of [x, y, z] for terminal points
```

## 🛠️ Function Overview

- `BranchTerminal.m`: main logic and callbacks
- `BranchTerminal.fig`: layout of the GUI
- Pushbuttons handle load, save, navigate, and annotation logic

## 📚 Citation

> Deng, Hang. *Machine Learning for 3D Neuron Tracking and Identification in C. elegans, and Key Points Detection*. Northeastern University, 2025.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
