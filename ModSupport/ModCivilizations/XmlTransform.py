files = [

]

for fname in files:
    newfname = fname[:-4] + '_new' + '.xml'
    # print(newfname)
    with open(fname,'r',encoding='utf-8') as f, open(newfname,'w',encoding='utf-8') as newf:
        flag = 'end' # value begin or end is used to mark the place of code;
        order = 0;
        
        tabline = ' '*4
        str1 = ''

        for line in f.readlines():
            line = line.strip()
            if line == '<row>':
                flag = 'start'
                order = 0
            elif line == '</row>':
                flag = 'end'
                order = 0
            else:
                order = order + 1
            
            if flag == 'end':
                if line == '</row>':
                    print(tabline + '</Row>', file = newf)
                else:
                    print(line,file=newf)
            elif flag == 'start':
                if order == 0:
                    str1 = tabline + '<Row '
                elif order == 1:
                    pass
                elif order == 2:
                    str1 = str1 + 'Tag="' + line[5:-6] +'"'
                    str1 = str1 + ' Language="en_US">'
                    print(str1,file=newf)
                elif order == 3:
                    print(tabline*2 + line,file = newf)
            