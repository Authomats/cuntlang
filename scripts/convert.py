
import re
import os
#import pathlib


def main():
      filepath_str = '../asm/example.S'
      new_filepath = '../asm/example_macos.S'
      f = open(filepath_str, 'r')
      filedata = f.read()
      f.close()
      filedata = re.sub("main", "_main", filedata, 2)
      match_obj = re.search("\s[a-zA-Z_]+@plt", filedata)
      m_span = match_obj.span()
      cfn = filedata[m_span[0]:m_span[1]]
      cfn_new = cfn.replace("@plt", "")
      cfn_new = " _" + cfn_new[1: ]
      filedata = re.sub(cfn, cfn_new, filedata, 1)
      print(filedata)
      os.system(f'touch {new_filepath}')
      f = open(new_filepath, "w")
      f.write(filedata)
      f.close()



if __name__ == '__main__':
      main()
