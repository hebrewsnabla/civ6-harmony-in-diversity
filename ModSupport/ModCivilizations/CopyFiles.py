import os,shutil

def mycopyfile(path, path1, path2):
    file_path = path + path1
    fpath, fname = os.path.split(file_path)
    # print(path2)
    # print(file_path,path2+fname)
    shutil.copy(file_path, path2 + fname)
ModCiv_path = 'C:/Users/f/Documents/My Games/Sid Meier\'s Civilization VI/Mods/civ6-harmony-in-diversity/ModSupport/ModCivilizations'

with open(ModCiv_path + '/FileOthersTrans.txt','r') as file1, open(ModCiv_path + '/ModCivId.txt','w') as file2:
    path2 = 'C:/Users/f/Documents/My Games/Sid Meier\'s Civilization VI/Mods/files/'
    data = file1.readlines()
    data.pop(0)
    workshop_path = data.pop(0)
    workshop_path = workshop_path[:-1]
    # print(workshop_path)
    data.pop(0)
    xml_list=[]
    for line in data:
        if line[0].isdigit():
            mod_tag = line[3:-1]
            print(mod_tag)
        else:
            path1 = line[13:-1]
            mod_id = line[13+1:13+10+1] # Cation!
            xml_list.append(path1)
            # print(workshop_path+path1)
            print(mod_id)
            # print(path1)
            mycopyfile(workshop_path, path1, path2 + mod_id + '_')
