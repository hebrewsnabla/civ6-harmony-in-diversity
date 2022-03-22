import os, shutil, glob
files = glob.glob('*.txt')

def mycopyfile(path1, path2):
    fpath, fname = os.path.split(path1)
    shutil.copy(path2, path2 + fname)

for txtfile in files:
    with open(txtfile,'r') as file1, open('ModCivId.txt','w+') as file2:
        path2 = './copyfiles/'
        data = file1.readlines()
        data.pop(0)
        workshop_path = data.pop(0)
        workshop_path = workshop_path[:-1]
        # print(workshop_path)
        data.pop(0)
        cpy_list=[]
        for line in data:
            if line[0].isdigit():
                mod_tag = line[3:-1]
                print(mod_tag)
            else:
                path1 = line[13:-1]
                mod_id = line[13+1:13+10+1] # Cation!
                cpy_list.append(workshop_path+path1)
                # print(workshop_path+path1)
                print(mod_id)
                # print(path1)
                mycopyfile(workshop_path+path1, path2 + mod_id + '_')
