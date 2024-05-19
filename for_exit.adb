--  Corresponds to fig04_08.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig04_08.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure For_Exit is
   Count : Natural;  -- stores loop variable
begin
   --  For loop variable is not accessible outside the loop,
   --  so store it on each round.
   for N in 1 .. 10 loop
      Count := N;
      exit when N = 5;
      Put (N'Image & " ");
   end loop;

   New_Line;
   Put ("Exited loop at count = " & Count'Image);
end For_Exit;
