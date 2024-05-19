--  Corresponds to fig04_02.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_02.cpp

with Ada.Text_IO;

procedure For_Iteration is
begin
   for Counter in 1 .. 10 loop
      Ada.Text_IO.Put (Counter'Image & "  ");
   end loop;
end For_Iteration;
