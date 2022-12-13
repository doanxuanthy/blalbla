import os

def absoluteFilePaths(directory):
    path_list =[]
    file_name_list = []
    remove_item = "data"
    for dirpath,_,filenames in os.walk(directory):
        for f in filenames:
            if (f.endswith(".c")) and (remove_item not in str(f)) :
            #yield os.path.abspath(os.path.join(dirpath, f))
                path_list.append(os.path.abspath(os.path.join(dirpath, f)))
                file_name_list.append(f)
    return path_list, file_name_list

#def check_file_exist(file_name):
#    if (not open(file_name)):
#        os.remove(file_name)
#        file_output = open(file_name)
#    else:
#        file_output = open(file_name)
#    return file_output

def export_beyond_command(path_baseline, file_name_baseline, path_updated, file_name_updated, path_output, file_output):
#    f_out = check_file_exist(file_output)
    f_out = open(file_output, "a")
    for i in file_name_baseline:
        for j in file_name_updated:
            if (i == j):
                left_cmp = path_baseline[file_name_baseline.index(i)]
                #print(left_cmp)
                right_comp = path_updated[file_name_updated.index(j)]
                #print(right_comp)
                data = 'file-report layout:side-by-side options:line-numbers output-to:"{0}\{1}.html" output-options:wrap-word,html-color "{2}" "{3}"\n'.format(path_output,i ,left_cmp ,right_comp)
                f_out.write(data)
                break
    f_out.close

path_baseline, file_name_baseline = absoluteFilePaths("D://task//beyond//baseline//r_sci_rx_v4.40")
path_updated, file_name_updated = absoluteFilePaths("D://task//beyond//output//r_sci_rx_v4.50")
path_output = 'D:\\task\\beyond\\html_files'
file_output = "D://task//beyond//report//beyond_commands.txt"
export_beyond_command(path_baseline,file_name_baseline,path_updated,file_name_updated,path_output,file_output)

#for e in file_name_updated:
#    print(e)




