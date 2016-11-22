import os
yes=["y","Y","Yes","yes","YES"]
ans = raw_input("Do you want to instal gvim for windows?")
if ans in yes:
    os.system(r'"C:\Program Files\Internet Explorer\iexplore.exe" ftp://ftp.vim.org/pub/vim/pc/gvim74.exe')

ans = raw_input("Do you want to install git for windows?")
if ans in yes:
    os.system(r'"C:\Program Files\Internet Explorer\iexplore.exe" https://git-scm.com/download/win')

homedir = raw_input("run gvim in windows, and execute ':echo $HOME', input the path here(usualy C:\Users... or U:\ ):")
os.system(r'"C:\Program Files\Git\bin\git.exe" clone https://github.com/gombosh/dotvim.git %s\vimfiles'%ans)
os.chdir(r"%s\vimfiles"%homedir)
os.system(r'"C:\Program Files\Git\bin\git.exe" submodule update --init --recursive')
ans = raw_input("Set PATH for gvim tools?")
if ans in yes:
    os.getenv("PATH")
    os.system(r'setx PATH "%PATH%;%s\vimfiles\bin"'%homedir)
raw_input("Install finished, you can create a %s\myvimrc file to add your own commands and settings. press enter to close the installer"%ans)
