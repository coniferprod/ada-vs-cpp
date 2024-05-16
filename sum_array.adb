--  Corresponds to fig06_05.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_05.cpp

with Ada.Text_IO;

procedure Sum_Array is
   type Integer_Array is array (Natural range <>) of Integer;
   Items : Integer_Array := (10, 20, 30, 40);
   Total : Integer := 0;
begin
   for I of Items loop
      Total := Total + I;
   end loop;

   Ada.Text_IO.Put_Line ("Total of array elements: " & Total'Image);
end Sum_Array;
