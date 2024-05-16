--  Corresponds to fig06_04.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_04.cpp

with Ada.Text_IO;

procedure Initialize_Constant_Array is
   Array_Size : constant Integer := 5;
   type Integer_Array is array (Natural range <>) of Integer;
   Values : Integer_Array (1 .. Array_Size); -- array has 5 elements
begin
   for I in Values'Range loop
      Values (I) := 2 * I;
   end loop;

   for V of Values loop
      Ada.Text_IO.Put (V'Image & "  ");
   end loop;

   Ada.Text_IO.New_Line;
end Initialize_Constant_Array;
