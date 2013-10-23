package body Console
is 
   Reset_Status: Boolean;
   SPAD_Cnt: Integer;
   
   procedure Enable_Reset
   is
   begin
      Reset_Status:= True;
   end Enable_Reset;
   
   procedure Disable_Reset
   is 
   begin
      Reset_Status:= False;
   end Disable_Reset;
   
   function Reset_Enabled return Boolean
   is
   begin
      return Reset_Status;
   end Reset_Enabled;
   
   procedure Inc_SPAD_Cnt
   is
   begin
      Spad_Cnt:= Spad_Cnt + 1;
   end Inc_SPAD_Cnt;
   
   procedure Reset_SPAD_Cnt
   is
   begin
      Spad_Cnt:= 0;
   end Reset_SPAD_Cnt;
   
   function SPAD_Cnt_Value return Integer
   is
   begin
      return SPAD_Cnt;
   end SPAD_Cnt_Value;
   
begin
   Reset_Status:= False;
   SPAD_Cnt:= 0;
end Console;

