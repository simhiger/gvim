#!/home/dorong/bin/python/bin/python
'''
-------------------------------------------------------------------------
File name    : /raid/users/dorong/gen_gvim_ctags.py
Title        :
Project      :
Developers   : Doron Gombosh
Created      : Mon Sep 02, 2013  11:30AM
Description  :
Notes        :
---------------------------------------------------------------------------
Copyright 2013 (c) SIRC
---------------------------------------------------------------------------*/
this script generates ctags file for gvim, it looks for a file list (ncvlog.args) and
generates the tags file in the home directory.
'''

import os,sys
import thread
import argparse
from time import sleep

op_done = False
file_list_arr = []

parser = argparse.ArgumentParser(description='Generate a tags file for Gvim.')
parser.add_argument('-i', help='Specify input filename (default is ncvlog.args)')
parser.add_argument('-o', help='Specify output filename (default is ~/tags)')
parser.add_argument('-e', help='gen tags to use with emacs (instead of vim)',action="store_true")
parser.add_argument('-sv', help='gen tags to systemverilog project',action="store_true")
parser.add_argument('-spv', help='gen tags to spv project',action="store_true")
parser.add_argument('-v', help='gen tags to verilog project',action="store_true")
args = vars(parser.parse_args())

def gen_ctags(lang="systemverilog"):
    global op_done
    global args
    print "generating ctags..."
    cmd_str = '/home/dorong/bin/ctags/bin/ctags --extra=+q --fields=+i --language-force=%s -L filelist.tmp -f '%lang
    if args['o']:
        cmd_str += args['o']
    else:
        cmd_str += " ~/tags "

    if args["e"]:
        cmd_str += " -e "

    print "executing:",cmd_str
    return_code = os.system(cmd_str)
    print "return code was",return_code
    op_done = True

def wait_for_op_end():
    global op_done
    while not op_done:
        sleep(1)
        sys.stdout.write(".")
        sys.stdout.flush()

def thread_for_op_done():
    global op_done
    op_done = False
    thread.start_new_thread(wait_for_op_end,())

def gen_systemverilog_tags():
    global file_list_arr
    print "using file :"+file_list_arr[0]
    print "creating temp file..."

    thread_for_op_done()
    popen_cmd = 'grep --regexp .*Parsing.*\\\\.sv '+file_list_arr[0].strip()+'*.log'
    print "running",popen_cmd
    filelist = os.popen(popen_cmd)
    output_file = open("filelist.tmp","w")
    for line in filelist:
        output_file.write(line.split("'")[1]+"\n")

    output_file.close()
    op_done = True
    #print "parsing temp file list..."
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    print "generating ctags file (at ~/tags)",
    thread_for_op_done()
    gen_ctags("systemverilog")

def gen_spv_tags():
    global file_list_arr
    print "using file :"+file_list_arr[0]
    print "creating temp file..."

    thread_for_op_done()
    os.system('find . -name "*.cpp" > filelist.tmp')
    os.system('find . -name "*.h" >> filelist.tmp')
    os.system('find ../../../SpvCommon/ -name "*.cpp" >> filelist.tmp')
    os.system('find ../../../SpvCommon/ -name "*.h" >> filelist.tmp')
    os.system('find ../../../SpvCommonPkt/ -name "*.cpp" >> filelist.tmp')
    os.system('find ../../../SpvCommonPkt/ -name "*.h" >> filelist.tmp')
    os.system('ls /sw/SpvProduct/include/*.h >> filelist.tmp')
    os.system('cat filelist.tmp')
    op_done = True
    #print "parsing temp file list..."
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    print "generating ctags file (at ~/tags)",
    thread_for_op_done()
    gen_ctags("C++")

def gen_verilog_tags():
    global file_list_arr
    print "using file :"+file_list_arr[0]
    print "creating temp file..."
    if args["i"]:
        file_list_arr=[args["i"]]
    else:
        file_list_arr=["comp.log"]


    thread_for_op_done()
    popen_cmd = 'grep --regexp .*Parsing.*\\\\.v '+file_list_arr[0].strip()
    print "running",popen_cmd
    filelist = os.popen(popen_cmd)
    output_file = open("filelist.tmp","w")
    for line in filelist:
        output_file.write(line.split("'")[1]+"\n")

    output_file.close()
    os.system('find . -name "*.v" >> filelist.tmp')
    os.system('find ../../common/rtl -name "*.v" >> filelist.tmp')
    os.system("cat filelist.tmp")
    op_done = True
    #print "parsing temp file list..."
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    print "generating ctags file (at ~/tags)",
    thread_for_op_done()
    gen_ctags()


def main():
    global op_done
    global args
    global file_list_arr

    #print "searching for file list..."
    #thread_for_op_done()
    #file_list = os.popen('find . -name "ncls.log"')
    #op_done = True
    #file_list_arr = file_list.readlines()
    #if not file_list_arr:
    #    print "could not find file list, please compile your project before running the script."
    #    return
    #else:
    if args["i"]:
        file_list_arr.append(args["i"])
    else:
        file_list_arr.append("")

    if args["spv"]:
        gen_spv_tags()

    if args["v"]:
        gen_verilog_tags();

    if args["sv"]:
        gen_systemverilog_tags()

    print "\nctags generation done..."
    #os.system('rm -f filelist.tmp')
    print "temp file removed..."
    print "operation done."

main()



