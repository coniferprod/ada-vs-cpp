--  Corresponds to fig04_01.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_01.cpp

with Ada.Text_IO;

procedure While_Iteration is
   Counter : Integer := 1;
begin
   while Counter <= 10 loop
      Ada.Text_IO.Put (Counter'Image & "  ");
      Counter := Counter + 1;
   end loop;
end While_Iteration;
