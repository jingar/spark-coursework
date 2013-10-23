with Console, Sensors, Alarm, Brakes, Speedo;
use type Sensors.Sensor_Type;
package body ATP
is
   Previous_Speed: Speedo.Speed_Type;
   procedure Handle_Caution
   is
   begin
      if not Alarm.Enabled then
	 Alarm.Enable;
	 Previous_Speed:= Speedo.Read_Speed;
      elsif Previous_Speed = Speedo.Read_Speed then
	 Brakes.Activate;
	 Console.Inc_SPAD_Cnt;
      end if;
   end Handle_Caution;
   
   procedure Handle_Danger
   is 
   begin
      Brakes.Activate;
      Alarm.Enable;
      Console.Inc_SPAD_Cnt;
   end Handle_Danger;
   
   procedure Control
   is
   begin
      if not Brakes.Activated then
	 
	 if Alarm.Enabled and Sensors.Read_Sensor_Majority = Sensors.Proceed then
	    Alarm.Disable;
	 end if;
	 
	 if Sensors.Read_Sensor_Majority = Sensors.Caution then
	    Handle_Caution;
	 elsif Sensors.Read_Sensor_Majority = Sensors.Danger then
	    Handle_Danger;
	 end if;
      elsif Console.Reset_Enabled then
	 Brakes.Deactivate;
	 Alarm.Disable;
      end if;
     
   end Control;
   
begin
   Previous_Speed:= 0;
end ATP;
