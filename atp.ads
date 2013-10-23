--# inherit Console, Sensors, Alarm, Brakes, Speedo;
package ATP
  --# own Previous_Speed;
  --# initializes Previous_Speed;
is
   procedure Control;
   --# global in Sensors.State, Speedo.Speed;
   --# in out  Console.SPAD_Cnt, Alarm.State, Brakes.State, Previous_Speed;
   --  Console.Reset_Status,
   
   procedure Handle_Caution;
   --# global in Alarm.State, Speedo.Speed,Brakes.State, Console.State;
   
end ATP;



