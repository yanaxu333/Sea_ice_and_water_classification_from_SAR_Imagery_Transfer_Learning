import os, re, time, sys
import string
import numpy  as np
import scipy.io as sio
vector=np.zeros((2428,1))
# get all the images in the 'all' folder.
filter_dir = "/home/lein/yan2/samples/18"
filterfile_list = os.listdir(filter_dir)
print filterfile_list

iv=0
file_index = 0
while(file_index < len(filterfile_list)):
    root, ext = os.path.splitext(filterfile_list[file_index])
    print root[0]
    vector[iv]=root[0]
    file_index=file_index+1
    iv=iv+1

#print vector
#sio.savemat('/home/lein/yan2/samples/labels/label_2',{'data':vector})
sio.savemat('/home/lein/yan2/samples/name/name_17',{'data':filterfile_list})
