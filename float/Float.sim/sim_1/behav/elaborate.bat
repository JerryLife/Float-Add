@echo off
set xv_path=F:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto b4c8823660cd45f5aafd72c08c149f41 -m64 --debug typical --relax --mt 2 --include "../../../Float.srcs/sources_1/new" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_sim_behav xil_defaultlib.top_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
