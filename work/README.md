-> To run the verification environment, the "make" command can be used, which executes the makefile containing the execution of all files.


*** Verification plan ***

- Introduction:

	- The objective is to verify the functionalities.

- Levels of abstraction:

	- The module will be checked as a whole, considering its inputs and outputs.

- Verification Technology:

	- Verification will be carried out using the UVM methodology (Universal Verification Methodology) in a functional verification environment.

- Reference model to use:

	- The reference model will be the dut itself.

- Transactions:

	- Transactions will be defined by the transaction class.

- Verification flowchart:

	- It starts with the creation of a testbench.
	- The reference model is implemented.
	- Implement the sequencer and connect to the reference model input.
	- The agent is implemented within the testbench environment and its driver is connected to the sequencer and its monitor to the reference model.
	- The computer is implemented and connects, on one side, to the agent and, on the other side, to the reference model.
	- The agent connects to the DUT (Device Under Test).

- Stimulus definitions:

	- The stimuli will be defined by the test sequences that will be sent to the DUT through the sequencer.

- Coverage:

	- Coverage will be monitored by the Coverage model, which checks whether all parts of the design have been exercised.

- Resources:

	- A Cadence/Xcelium license will be required for the simulation.

- References:

	- UVM Documentation, Cadence Xcelium.

