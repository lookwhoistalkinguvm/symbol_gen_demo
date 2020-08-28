# symbol_gen_demo

Demonstrate Unified Symbol Driver design pattern.

UVM demo testbench that shows how constraint coding can be used instead of procedural 
coding in a methodology that allow agents to be generated largely automatically once 
the driver functionality has been defined in compartmentalized orthogonal units. There 
is no need, when following this approach, to manually write the code for the monitor. 
Monitoring is still done passively by a monitor component instantiated in the agent t
hat listens to activity on the bus, but the constraint code in the driver specification 
is directly re-used by the monitor function through inheritance.

A screen recording of a PowerPoint presentation of this methodology can be found here:
https://youtu.be/NswC47F9yrU 
