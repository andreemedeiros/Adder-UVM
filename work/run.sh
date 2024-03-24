#export PATH=/usr/bin:/bin:/tool/pandora64/bin:/xcelium20.09/tools/bin:/xcelium20.09/bin:/xcelium20.09/tools/systemc/gcc/bin
#export UVM_HOME=/xcelium20.09/tools//methodology/UVM/CDNS-1.2/sv

xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' -uvmnocdnsextra -uvmhome $UVM_HOME $UVM_HOME/src/uvm_macros.svh ./rtl/dut.v ./tb/testbench.sv  