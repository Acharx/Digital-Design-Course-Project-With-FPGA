`timescale 1ns / 1ps

module OverHeatDetector(Sensor1,Sensor2,Sensor3,OverHeatSignal);
    input Sensor1,Sensor2,Sensor3;
    output OverHeatSignal;
   
    assign OverHeatSignal = (Sensor1 & Sensor2) | (Sensor2 & Sensor3) | (Sensor1 & Sensor3);

endmodule

module OverHeatEmergencySignalGenerator(Engine1,Engine2,EmergencySignal);
    input Engine1,Engine2;
    output EmergencySignal;
    //at aviation literature
    // left engine called engine 1
    // right engine called engine 2
    

assign EmergencySignal = Engine1 | Engine2;

endmodule

module OverHeatController(OtoController,ManuelController,OverHeatDetectionSignal,OverHeatControl);
    input OtoController,ManuelController,OverHeatDetectionSignal;
    output OverHeatControl;


assign OverHeatControl = (OtoController&OverHeatDetectionSignal) | ManuelController;

endmodule

module OverHeatIntervantion(Engine1Intervantion,Engine2Intervantion,IsThisAuto,Engine1ManuelIntervantion,Engine2ManuelIntervantion,AutoIntervantion);
    input Engine1Intervantion;
    input Engine2Intervantion;
    input IsThisAuto;
    output Engine1ManuelIntervantion;
    output Engine2ManuelIntervantion;
    output AutoIntervantion;


assign AutoIntervantion = IsThisAuto;
assign Engine1ManuelIntervantion = ( ~(IsThisAuto) & Engine1Intervantion );
assign Engine2ManuelIntervantion = ( ~(IsThisAuto) & Engine2Intervantion );

endmodule

module main(eng1s1,eng1s2,eng1s3,eng2s1,eng2s2,eng2s3,eng1o,eng2o,pio,pi1,pi2,emergencySignal);

input eng1s1,eng1s2,eng1s3,eng2s1,eng2s2,eng2s3;
output eng1o,eng2o,emergencySignal;
input pio,pi1,pi2;


//Explanation eng1s1 ==> Engine 1 Sensor 1
// eng1o ==> Engine 1 Output
// pio ==> Pilot Intervantion Auto  pi1 ==> Pilot Invervantion 1
    
wire LeftEngineOverHeatOutput;
wire RightEngineOverHeatOutput;

wire PilotIntervantionEngine1;
wire PilotIntervantionEngine2;
wire PilotIntervantionAuto;

OverHeatDetector OverHeatDetector1(eng1s1,eng1s2,eng1s3,LeftEngineOverHeatOutput);
OverHeatDetector OverHeatDetector2(eng2s1,eng2s2,eng2s3,RightEngineOverHeatOutput);

OverHeatIntervantion OverHeatIntervantion1(pi1,pi2,pio,PilotIntervantionEngine1,PilotIntervantionEngine2,PilotIntervantionAuto);

OverHeatController OverHeatController1(PilotIntervantionAuto,PilotIntervantionEngine1,LeftEngineOverHeatOutput,eng1o);
OverHeatController OverHeatController2(PilotIntervantionAuto,PilotIntervantionEngine2,RightEngineOverHeatOutput,eng2o);

OverHeatEmergencySignalGenerator OverHeatEmergencySignalGenerator1(LeftEngineOverHeatOutput,RightEngineOverHeatOutput,emergencySignal);
    
endmodule
