-- Author:              Saad Arif
--
-- Filename:            atp.ads
--
-- Description:         ATP package is the main controller using all the subsystems make decisions based on track-side signals.
--                      ATP makes decision based on what passed to the control by the sensors subsystem. Note there is no Handle_Proceed procedure as 
--                      requirements stated no actions are to be taken when the proceed signal is encountered by the sensors. 

--# inherit Console, Sensors, Alarm, Brakes, Speedo;
package ATP
  --# own Previous_Speed, Previous_Majority;
  --# initializes Previous_Speed, Previous_Majority;
is
   
   procedure Handle_Caution;
   --# global in Speedo.Speed;
   --#        in out Alarm.State,Brakes.State, Console.SPAD_Cnt, Previous_Speed;
   
   procedure Handle_Undefined;
   --# global in Previous_Majority;
   --#        out Alarm.State;
   --# in out Brakes.State;
   
   procedure Handle_Danger;
   --# global out Alarm.State, Brakes.State;
   --#     in out Console.SPAD_Cnt;
   
   procedure Control;
   --# global in Sensors.State, Speedo.Speed, Console.Reset_Status;
   --# in out Console.SPAD_Cnt, Alarm.State, Brakes.State, Previous_Speed;
   --# in out Previous_Majority;
   
   
end ATP;



