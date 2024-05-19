--  Corresponds to fig04_03.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_03.cpp

with Ada.Text_IO;

procedure Sum_Even is
   Total : Integer;
   Number : Integer;
begin
   Total := 0;

   --  Use a while loop because you can't specify
   --  a step in a for loop
   Number := 2;
   while Number <= 20 loop
      Total := Total + Number;
      Number := Number + 2;
   end loop;

   Ada.Text_IO.Put_Line ("Sum is " & Total'Image);
end Sum_Even;
