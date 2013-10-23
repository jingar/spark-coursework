with Console, Sensors, Alarm, Brakes, Speedo;
use type Sensors.Sensor_Type;
package body ATP
is
   Previous_Speed: Speedo.Speed_Type;
   procedure Control
   is
   begin
      if Sensors.Read_Sensor_Majority = Sensors.Caution then
	 if not Alarm.Enabled then
	    Alarm.Enable;
	    Previous_Speed:= Speedo.Read_Speed;
	 elsif Previous_Speed = Speedo.Read_Speed then
	    Brakes.Activate;
	    Console.Inc_SPAD_Cnt;
	 end if;
      elsif Sensors.Read_Sensor_Majority = Sensors.Danger then
	 Brakes.Activate;
	 Alarm.Enable;
	 Console.Inc_SPAD_Cnt;
      end if;
   end Control;
begin
   Previous_Speed:= 0;
end ATP;
