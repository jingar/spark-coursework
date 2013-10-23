package body Brakes
is
   State: Boolean;
   procedure Activate
   is
   begin
      State:= True;
   end Activate;

   procedure Deactivate
   is 
   begin
      State:= False;
   end Deactivate;

   function Activated return Boolean
   is
   begin
      return State;
   end Activated; 
     
begin
      State:= False;
end Brakes;
