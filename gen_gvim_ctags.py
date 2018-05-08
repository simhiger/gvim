#!/usr/bin/python
'''
-------------------------------------------------------------------------
File name    : gen_gvim_ctags.py
Title        :
Project      :
Developers   : Dima Roginsky
Created      : Mon Sep 02, 2013  11:30AM
Description  :
Notes        :
---------------------------------------------------------------------------
---------------------------------------------------------------------------*/
this script generates ctags file for gvim, it looks for a file list (ncvlog.args) and
generates the tags file in the home directory.
'''

import os,sys
import thread
import argparse
from time import sleep
import run_sim

# globals
#----------------------------------------------
op_done = False
file_list_arr = []
home = os.getenv('HOME')
user = os.getlogin()
OrigPwd = os.getcwd()
unmanaged_dir = os.getenv('UNMANAGED_DIR')
tools = os.getenv('tools')
green_open = '\033[32m'
blue_open = '\033[34m'
red_open = '\033[31m'
color_close = '\033[0m'
gen_gvim_ctags = utils.start_log("gen_ctags")
gen_gvim_ctags.setLevel(logging.DEBUG)
gen_gvim_ctags.handlers[0].setLevel(logging.DEBUG)
#----------------------------------------------

parser = argparse.ArgumentParser(description='Generate a tags file for Gvim.')
parser.add_argument('-i'   , help='Specify input filename (default is ncvlog.args)')
parser.add_argument('-o'   , help='Specify output filename (default is ~/tags)')
parser.add_argument('-e'   , help='gen tags to use with emacs (instead of vim)'       , action="store_true")
parser.add_argument('-sv'  , help='gen tags to systemverilog project'                 , action="store_true")
parser.add_argument('-spv' , help='gen tags to spv project'                           , action="store_true")
parser.add_argument('-v'   , help='gen tags to verilog project'                       , action="store_true")
parser.add_argument('-nc'  , help='gen tags to verilog/systemverilog cadance project' , action="store_true")
parser.add_argument('-vcs' , help='gen tags to verilog/systemverilog VCS project'     , action="store_true")
args = vars(parser.parse_args())

def gen_ctags(lang="systemverilog"):
    global op_done
    global args
    gen_gvim_ctags.info( "generating ctags...")
    cmd_str = 'ctags --options=%s/.vim/bin/.ctags --extra=+q --fields=+i --language-force=%s -L filelist.tmp -f '%(home,lang)
    if args['o']:
        cmd_str += args['o']
    else:
        cmd_str += " ~/tags "

    if args["e"]:
        cmd_str += " -e "

    gen_gvim_ctags.info( "executing:",cmd_str)
    return_code = os.system(cmd_str)
    gen_gvim_ctags.info( "return code was",return_code)
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
    gen_gvim_ctags.info( "using file :"+file_list_arr[0])
    gen_gvim_ctags.info( "creating temp file...")

    thread_for_op_done()
    popen_cmd = 'grep --regexp .*Parsing.*\\\\.sv '+file_list_arr[0].strip()+'*.log'
    gen_gvim_ctags.info( "running",popen_cmd)
    filelist = os.popen(popen_cmd)
    output_file = open("filelist.tmp","w")
    for line in filelist:
        output_file.write(line.split("'")[1]+"\n")

    output_file.close()
    op_done = True
    #gen_gvim_ctags.info( "parsing temp file list...")
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    gen_gvim_ctags.info( "generating ctags file (at ~/tags)",)
    thread_for_op_done()
    gen_ctags("systemverilog")


def gen_spv_tags():
    global file_list_arr
    gen_gvim_ctags.info( "using file :"+file_list_arr[0])
    gen_gvim_ctags.info( "creating temp file...")

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
    #gen_gvim_ctags.info( "parsing temp file list...")
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    gen_gvim_ctags.info( "generating ctags file (at ~/tags)",)
    thread_for_op_done()
    gen_ctags("C++")

def gen_nc_tags():
    gen_gvim_ctags.info( "using file :"+args["i"])
    gen_gvim_ctags.info( "creating temp file...")

    thread_for_op_done()
    with open(args["i"],"r") as filelist:
        filelist_lines = filelist.readlines()
        os.system("\\rm -rf filelist.tmp")
        for line in filelist_lines:
            try:
                line = line.strip()
                gen_gvim_ctags.info( "HANDLING:",line)
                if line[0]=="/" and line[1]!="/":
                    os.system('echo %s >> filelist.tmp'%line)
                elif "incdir" in line:
                    gen_gvim_ctags.info(('find %s -name "*.v" >> filelist.tmp'%(line.split("+")[-1])))
                    os.system('find %s -name "*.v" >> filelist.tmp'%(line.split("+")[-1]))
                    os.system('find %s -name "*.sv" >> filelist.tmp'%(line.split("+")[-1]))
                    os.system('find %s -name "*.svh" >> filelist.tmp'%(line.split("+")[-1]))
                else:
                    gen_gvim_ctags.info( "skipping",line)
                    continue
            except:
                gen_gvim_ctags.info( "skipping",line)
                continue

    os.system('cat filelist.tmp')
    op_done = True
    gen_gvim_ctags.info( "generating ctags file (at ~/tags)",)
    thread_for_op_done()
    gen_ctags("systemverilog")

def gen_vcs_tags():
    gen_gvim_ctags.info( "using file :"+args["i"])
    gen_gvim_ctags.info( "creating temp file...")

    thread_for_op_done()

    # run qbar compilation. (if filelist exists, delete it first)
    filelist_path = unmanaged_dir+'/qvmr/'+user+'/simland/standalone/default/hdl/vcs_mx/vcs-mx_vK-2015.09-SP2-13-T0428/LINUX64/session.log'
    if (os.path.isfile(filelist_path)):
        os.system("\\rm -f "+filelist_path)

    ret = run_sim.comp_qbar("dtr_wrapper")
    if ret != 0 :
        gen_gvim_ctags.error(red_open+ 'QBAR compilation FAILED. exiting....  ' +color_close+ '\n')
        sys.exit(1)
    else:
        gen_gvim_ctags.info(green_open+ 'QBAR compilation finished successfully '+color_close+ '\n')

    filelist = run_sim.prep_filelist("dtr_wrapper","dtr_wrapper","dtr_wrapper")

    with open(args["i"],"r") as filelist:
        filelist_lines = filelist.readlines()
        os.system("\\rm -rf filelist.tmp")
        for line in filelist_lines:
            try:
                line = line.strip()
                gen_gvim_ctags.info( "HANDLING:",line)
                if line[0]=="/" and line[1]!="/":
                    os.system('echo %s >> filelist.tmp'%line)
                elif "incdir" in line:
                    gen_gvim_ctags.info(('find %s -name "*.v" >> filelist.tmp'%(line.split("+")[-1])))
                    os.system('find %s -name "*.v" >> filelist.tmp'%(line.split("+")[-1]))
                    os.system('find %s -name "*.sv" >> filelist.tmp'%(line.split("+")[-1]))
                    os.system('find %s -name "*.svh" >> filelist.tmp'%(line.split("+")[-1]))
                else:
                    gen_gvim_ctags.info( "skipping",line)
                    continue
            except:
                gen_gvim_ctags.info( "skipping",line)
                continue

    os.system('cat filelist.tmp')
    op_done = True
    gen_gvim_ctags.info( "generating ctags file (at ~/tags)",)
    thread_for_op_done()
    gen_ctags("systemverilog")

def gen_verilog_tags():
    global file_list_arr
    gen_gvim_ctags.info( "using file :"+file_list_arr[0])
    gen_gvim_ctags.info( "creating temp file...")
    if args["i"]:
        file_list_arr=[args["i"]]
    else:
        file_list_arr=["comp.log"]


    thread_for_op_done()
    popen_cmd = 'grep --regexp .*Parsing.*\\\\.v '+file_list_arr[0].strip()
    gen_gvim_ctags.info( "running",popen_cmd)
    filelist = os.popen(popen_cmd)
    output_file = open("filelist.tmp","w")
    for line in filelist:
        output_file.write(line.split("'")[1]+"\n")

    output_file.close()
    os.system('find . -name "*.v" >> filelist.tmp')
    os.system('find ../../common/rtl -name "*.v" >> filelist.tmp')
    os.system("cat filelist.tmp")
    op_done = True
    #gen_gvim_ctags.info( "parsing temp file list...")
    #thread_for_op_done()
    #os.system("perl -pi -e 's/^\s+//' filelist.tmp")
    #op_done = True
    gen_gvim_ctags.info( "generating ctags file (at ~/tags)",)
    thread_for_op_done()
    gen_ctags()


def main():
    global op_done
    global args
    global file_list_arr

    #gen_gvim_ctags.info( "searching for file list...")
    #thread_for_op_done()
    #file_list = os.popen('find . -name "ncls.log"')
    #op_done = True
    #file_list_arr = file_list.readlines()
    #if not file_list_arr:
    #    gen_gvim_ctags.info( "could not find file list, please compile your
    #    project before running the script.")
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

    if args["nc"]:
        gen_nc_tags()

    if args["vcs"]:
        gen_vcs_tags()

    gen_gvim_ctags.info( "\nctags generation done...")
    #os.system('rm -f filelist.tmp')
    gen_gvim_ctags.info( "temp file removed...")
    gen_gvim_ctags.info( "operation done.")

main()



