import serial
import time
import joblib
import pandas as pd
import numpy as np
import requests

model = joblib.load('C:/Users/Salma/Documents/E-Nose/Code/AI/model.pkl')
scaler = joblib.load('C:/Users/Salma/Documents/E-Nose/Code/AI/scaler.pkl')
url = 'http://localhost:5000/'

try:
    ser = serial.Serial('COM4', 9600, timeout=1) # Replace 'COM3' with your Arduino's port


    for i in range(20):
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8').strip()
            line = line.split(',')
        time.sleep(1)
    
    if len(line) == 5:
        # Create an array from the input data
        features = pd.DataFrame(np.array([[int(line[0]),int(line[1]),int(line[2]),int(line[3]),int(line[4])]]).reshape(1,-1))
        # Scale the features
        features= pd.DataFrame(scaler.transform(features))
        features = features.values.reshape(features.shape[0],features.shape[1],1)
        # Predict
        prediction = model.predict(features)
        fruits = ['Banana','Apple']
        if prediction[0] < 0.5:
            output = fruits[0]
        elif prediction[0] > 0.5:
            output = fruits[1]
        else:
            output = 'Confused'
        print(output)
except serial.SerialException as e:
    print(f"Error: {e}")
finally:
    if 'ser' in locals() and ser.is_open:
        ser.close()