#!/usr/bin/python3

import csv

def sort(lists):
    s_data = []
    r_data = []
    for i in range(1,len(lists)):
        s_data.append(lists[i][1])
    
    for i,j in enumerate(sorted(s_data)):
        s_data[i] = j

    for i in s_data:
        r_data.append([i])

    isi_data(r_data,lists)

return r_data

def buka_file(string):
    f = open('string','rt')
    temp_data = []
    try:
        reader = csv.reader(f)
        for i in reader:
            temp_data.append(i)
    finally:
        f.close()
return temp_data

def isi_data(list_1,list_2):
    for i in list_1:
        for j in list_2:
            if(i[0] == j[1]):
                i.append(j[0])
                for k in range(2,len(j)):
                    i.append(float(j[k]))


