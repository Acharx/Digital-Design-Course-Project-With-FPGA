# Digital-Design-Course-Project-With-FPGA
I Design Aircraft Engine Overheat Protection with FPGA, Xilinx. This is include only basic signal.

![block diagram](https://user-images.githubusercontent.com/10440980/211225125-9199b1e8-014e-4119-b9ff-6d6ccf9db81b.png)

Example Output
![testbench](https://user-images.githubusercontent.com/10440980/212050089-7fc5937e-97b6-4f87-b9b3-2a87c8f1cd39.png)

Left engine has overheat because of 2 of sensor gives high signal.
Right engine has not overheat because of less than 2 sensor gives high signal.
Pilot opened Auto Intervention.
Pilot also opened Right engine intervention manually.

Auto intervention is opened, for this reason, manuel intervention is not processed(signal is not transmitted).
Left Engine send signal to overheat controller.And Auto Intervention is opened. For this reason, only Left Engine Overheat Controller Opened.
