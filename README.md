# Anestesia-sedation-level-control
Anestesia sedation level control using entropy and SEF95 parameters program with generated signals

# Basic Overview
Program calculates entropy and SEF95 parameters in different sedation level stadies.
![image](https://user-images.githubusercontent.com/36335477/40490245-ccf57894-5f73-11e8-95a6-db172589f53f.png)

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
```
Matlab r2017a or later -> https://www.mathworks.com
Matlab Signal Processing Toolbox -> https://www.mathworks.com/products/signal.html
```
### Installing
```
Load all files in same folder
Open Nastya.m
Push "Run" button
Push "Change Folder" if needed
```
## Running the tests
```
Push "Load signal" button to generate eeg signal
You can generate new signal choosing "Load new signal" button
You can see steps of analyse checking buttons:
 1. EEG
 2. Depth
You can save results pushing "Save frame" button
```
# Methods

## SEF95
Program uses spectral edge frequency detection

## Entropy
Program calculates entropy of EEG

![image](https://user-images.githubusercontent.com/36335477/40490628-b7216f18-5f74-11e8-817a-ab2957717fdb.png)

# Authors

* Eldar Shayahmetov, eldarsharpey@gmail.com
