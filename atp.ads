--# inherit Console, Sensors, Alarm, Brakes, Speedo;
package ATP
  --# own Previous_Speed;
  --# initializes Previous_Speed;
is
   
   procedure Handle_Caution;
   --# global in Speedo.Speed;
   --#        in out Alarm.State,Brakes.State, Console.SPAD_Cnt, Previous_Speed;
   
   procedure Handle_Danger;
   --# global out Alarm.State, Brakes.State;
   --#     in out Console.SPAD_Cnt;
   
   procedure Control;
   --# global in Sensors.State, Speedo.Speed;
   --# in out Console.SPAD_Cnt, Alarm.State, Brakes.State, Console.Reset_Status, Previous_Speed;
   
   
end ATP;



