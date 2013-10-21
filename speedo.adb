package body Speedo
  --# own Speed is Speed_Value;
is
   Speed_Value: Speed_Type;
   procedure Write_Speed(S: in Speed_Type)
   --# global out Speed_Value;
   --# derives Speed_Value from S;
   is
   begin
      Speed_Value:= S;
   end Write_Speed;

   function Read_Speed return Speed_Type
   --# global in Speed_Value;
   is
   begin
      return Speed_Value;
   end Read_Speed;
begin
   Speed_Value:= 0;
end Speedo;
