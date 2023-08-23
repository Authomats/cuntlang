
import re
import os
#import pathlib


# linux -> macos

def replace_main(filedata):
      str = "main"
      num = filedata.count(str)
      if not num == 0:
            filedata = re.sub(str, "_main", filedata, num)
      return filedata


def replace_plt_idiom(filedata):
      replaced = 0
      while True:
            match_obj = re.search("\s[a-zA-Z_]+@plt", filedata)
            #print(match_obj)
            if match_obj is None:
                  break
            m_span = match_obj.span()
            cfn = filedata[m_span[0]:m_span[1]]
            cfn_new = cfn.replace("@plt", "")
            cfn_new = " _" + cfn_new[1: ]
            filedata = re.sub(cfn, cfn_new, filedata, 1)
            replaced += 1
      #print(f"replaced: {replaced}")
      return filedata


def name_to_macos(filepath):
      filepath_new = filepath.replace("_linux.S", "_macos.S")
      return filepath_new


def generate_macos(filepath_linux):
      filepath_new = name_to_macos(filepath_linux)
      #print(filepath_new)
      with open(filepath_linux, 'r') as f:
            filedata = f.read()
            #f.close()

      filedata = replace_main(filedata)

      filedata = replace_plt_idiom(filedata)

      #print(filedata)
      os.system(f'touch {filepath_new}')
      with open(filepath_new, "w") as f:
            f.write(filedata)
            #f.close()


# macos -> linux

def replace_underscore_main(filedata):
      str = "_main"
      num = filedata.count(str)
      if not num == 0:
            filedata = re.sub(str, "main", filedata, num)
      return filedata


def replace_underscore_fn_idiom(filedata):
      replaced = 0
      while True:
            match_obj = re.search("\s_[a-zA-Z_]+", filedata)
            if match_obj is None:
                  break
            m_span = match_obj.span()
            cfn = filedata[m_span[0]:m_span[1]]
            cfn_new = " " + cfn[2: ] + "@plt"
            print(cfn_new)
            filedata = re.sub(cfn, cfn_new, filedata, 1)
            replaced += 1
      return filedata


def name_to_linux(filepath):
      filepath_new = filepath.replace("_macos.S", "_linux.S")
      return filepath_new


def generate_linux(filepath_macos):
      filepath_new = name_to_linux(filepath_macos)
      #print(filepath_new)
      with open(filepath_macos, 'r') as f:
            filedata = f.read()
            #f.close()

      filedata = replace_underscore_main(filedata)

      filedata = replace_underscore_fn_idiom(filedata)

      #print(filedata)
      os.system(f'touch {filepath_new}')
      with open(filepath_new, "w") as f:
            f.write(filedata)
            #f.close()


# entry

def main():
      filepath_linux = '../asm/example_linux.S'
      generate_macos(filepath_linux)
      filepath_macos = '../asm/example_macos.S'
      generate_linux(filepath_macos)


if __name__ == '__main__':
      main()
