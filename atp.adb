with Console, Sensors, Alarm, Brakes, Speedo;
use type Sensors.Sensor_Type;
package body ATP
is
   -- Previous_Speed used in the Handle_Caution, to determine if the speed has changed.
   Previous_Speed: Speedo.Speed_Type;
   -- Previous_Majority is the majority value chosen by the sensors subsystem. It is used in Handle_Undefined, to determine if two undefined values have
   -- been detected consequently. 
   Previous_Majority: Sensors.Sensor_Type;
   
   procedure Handle_Caution
   is
   begin
      if not Alarm.Enabled then
	 Alarm.Enable;
	 Previous_Speed:= Speedo.Read_Speed;
      elsif Previous_Speed <= Speedo.Read_Speed then
	 Brakes.Activate;
	 Console.Inc_SPAD_Cnt;
      end if;
   end Handle_Caution;
   
   procedure Handle_Undefined
   is
   begin
      Alarm.Enable;
      if Previous_Majority = Sensors.Undef then
	 Brakes.Activate;
      end if;
   end Handle_Undefined;
   
   procedure Handle_Danger
   is 
   begin
      Brakes.Activate;
      Alarm.Enable;
      Console.Inc_SPAD_Cnt;
   end Handle_Danger;
   
   
   -- Main procedure in the ATP package, this procedure handles the decision making.
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
	 elsif Sensors.Read_Sensor_Majority = Sensors.Undef then
	    Handle_Undefined;
	 end if;
      elsif Console.Reset_Enabled then
	 Brakes.Deactivate;
	 Alarm.Disable;
      end if;
      Previous_Majority:= Sensors.Read_Sensor_Majority;
   end Control;
begin
   --Initialize default values;
   Previous_Speed:= 0;
   Previous_Majority:= Sensors.Undef;
end ATP;
