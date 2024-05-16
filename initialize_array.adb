--  Corresponds to fig06_01.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_01.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Characters.Latin_1;

procedure Initialize_Array is
   type Integer_Array is array (1 .. 5) of Integer;
   Values : Integer_Array;
begin
   Values := (others => 0);

   Ada.Text_IO.Put_Line ("Element"
      & Ada.Characters.Latin_1.HT
      & "Value");
   for I in Values'Range loop
      Ada.Integer_Text_IO.Put (I);
      Ada.Integer_Text_IO.Put (Values (I));
      Ada.Text_IO.New_Line;
   end loop;

   Ada.Text_IO.Put (Values (10)'Image);

end Initialize_Array;
