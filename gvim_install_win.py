import os
yes=["y","Y","Yes","yes","YES"]
ans = raw_input("Do you want to instal gvim for windows?")
if ans in yes:
    os.system(r'"C:\Program Files\Internet Explorer\iexplore.exe" ftp://ftp.vim.org/pub/vim/pc/gvim74.exe')

ans = raw_input("Do you want to install git for windows?")
if ans in yes:
    os.system(r'"C:\Program Files\Internet Explorer\iexplore.exe" https://git-scm.com/download/win')

ans = raw_input("run gvim in windows, and execute ':echo $HOME', input the path here(usualy C:\Users... or U:\ ):")
os.system(r"git clone https://github.com/gombosh/dotvim.git %s\vimfiles"%ans)
os.chdir(r"%s\vimfiles"%ans)
os.system(r"git submodule update --init --recursive")
raw_input("Install finished, you can create a %s\myvimrc file to add your own commands and settings. press enter to close the installer"%ans)
