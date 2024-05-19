--  Corresponds to fig04_09.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig04_09.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure For_Continue is
begin
   --  For loop variable is not accessible outside the loop,
   --  so store it on each round.
   for Count in 1 .. 10 loop
      --  The original C++ code:
      --  if (count == 5) {
      --      continue;
      --  }
      --  Ada does not have the equivalent of a continue statement,
      --  so negate the condition and use an if statement:
      if Count /= 5 then
         Put (Count'Image & " ");
      end if;
   end loop;

   New_Line;
   Put_Line ("Used if statement to skip printing 5");
end For_Continue;
