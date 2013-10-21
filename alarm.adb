package body Alarm
   --# own State is AlarmStatus;
is
   AlarmStatus: Boolean;
   procedure Enable
   --# global out AlarmStatus;
   --# derives AlarmStatus from ;
   is
   begin
      AlarmStatus:= True;
   end Enable;
   
   procedure Disable
   --# global out AlarmStatus;
   --# derives AlarmStatus from ;
   is
   begin
      AlarmStatus:= False;
   end Disable;
   
   function Enabled return Boolean
     --# global in AlarmStatus;
   is
   begin
      return AlarmStatus;
   end Enabled;
     
begin
     AlarmStatus:= False;
end Alarm;
