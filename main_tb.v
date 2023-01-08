`timescale 1ns / 1ps

module main_tb();

reg left_engine_s1,left_engine_s2,left_engine_s3;
reg right_engine_s1,right_engine_s2,right_engine_s3;
reg pilot_int_1,pilot_int_2,pilot_int_auto;
wire overheat_control_1,overheat_control_2,emergencySignal;

main UUT(
.eng1s1(left_engine_s1),
.eng1s2(left_engine_s2),
.eng1s3(left_engine_s3),
.eng2s1(right_engine_s1),
.eng2s2(right_engine_s2),
.eng2s3(right_engine_s3),
.eng1o(overheat_control_1),
.eng2o(overheat_control_2),
.pio(pilot_int_auto),
.pi1(pilot_int_1),
.pi2(pilot_int_2),
.emergencySignal(emergencySignal)
);

initial begin

pilot_int_1=0;
pilot_int_2=1;
pilot_int_auto=1;
left_engine_s1=1;
left_engine_s2=1;
left_engine_s3=0;
right_engine_s1=0;
right_engine_s2=1;
right_engine_s3=0;
end

endmodule
