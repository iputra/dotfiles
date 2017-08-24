#!/usr/bin/python3
import csv

def nilai_akhir(u1,u2,u3,u4,u5,u6,u7):
    return 0.15*(u1+u2+u3+u4)+0.4*((u5+u6+u7)/3)

f = open('nilai-teka.csv','rt')
data = []
try:
    reader = csv.reader(f)
    for i in reader:
        data.append(i)
finally:
    f.close()

for i in range(1,len(data)):
    for j in range(2,len(data[i])):
        data[i][j] = float(data[i][j])

data[0].append("nilai akhir")
data[0].append("nilai mutu")

for i in range(1,len(data)):
    data[i].append(nilai_akhir(data[i][2],data[i][3],data[i][4],data[i][5],data[i][6],data[i][7],data[i][8]))

for i in range(1,len(data)):
    if(data[i][9]>=75):
        data[i].append('A')
    elif(data[i][9]>=70):
        data[i].append('AB')
    elif(data[i][9]>=65):
        data[i].append('B')
    elif(data[i][9]>=60):
        data[i].append('BC')
    else:
        data[i].append('C')

while(True):
    nim = input('Masukan NIM : ')
    for i in range(1,len(data)):
        if(nim.upper() == data[i][1]):
            print(data[i],'\n')
        elif(i >= len(data)):
            print('data tidak ditemukan!\n')

