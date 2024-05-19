--  Corresponds to fig04_04.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_04.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Fixed;

--  Compound-interest calculations with for.
procedure Compound_Interest is
   Principal : Float := 1000.0;
   Rate : Float := 0.05;
begin
   Put ("Initial principal: ");
   Ada.Float_Text_IO.Put (Item => Principal, Fore => 1, Aft => 2, Exp => 0);
   New_Line;

   Put ("    Interest rate:    ");
   Ada.Float_Text_IO.Put (Item => Rate, Fore => 1, Aft => 2, Exp => 0);
   New_Line;

   --  Display headers
   New_Line;
   Put_Line ("Year" & Ada.Strings.Fixed.Tail ("Amount on deposit", 20));

   for Year in 1 .. 10 loop
      --  Calculate amount on deposit at the end of the specified year
      declare
         Amount : Float := Principal * ((1.0 + Rate) ** Year);
         Amount_String : String (1 .. 20);
      begin
         Ada.Integer_Text_IO.Put (Item => Year, Width => 4);
         Ada.Float_Text_IO.Put (To => Amount_String, Item => Amount, Aft => 2, Exp => 0);
         Put (Ada.Strings.Fixed.Tail (Amount_String, 20));
         New_Line;
      end;
   end loop;
end Compound_Interest;
