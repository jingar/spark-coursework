package body Brake
  --# own State is BrakeStatus;
is
   BrakeStatus: Boolean;

   procedure Activate
     --# global out BrakeStatus;
     --# derives BrakeStatus from ;
   is
   begin
      BrakeStatus:= True;
   end Activate;

   procedure Deactivate;
     --# global out BrakeStatus;
     --# derives BrakeStatus from ;
   is 
   begin
      BrakeStatus:= False;
   end Deactivate;

   function Activated return Boolean;
   --# global in State;
   
end Brake;
