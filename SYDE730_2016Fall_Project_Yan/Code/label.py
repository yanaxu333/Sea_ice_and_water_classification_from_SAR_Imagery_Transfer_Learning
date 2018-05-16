import os, re, time, sys
import string
import numpy  as np
import scipy.io as sio
vector=np.zeros((150968,1))
# get all the images in the 'all' folder.
filter_dir = "/home/lein/Yan_Project/24/more_patches"
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

print vector
sio.savemat('/home/lein/Yan_Project/24/label_4',{'data':vector})
sio.savemat('/home/lein/Yan_Project/24/name_4',{'data':filterfile_list})
