--  Corresponds to fig04_05.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_05.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Iteration with a bare loop.
procedure Loop_Iteration is
   Counter : Integer := 1;
begin
   loop
      Ada.Integer_Text_IO.Put (Item => Counter, Width => 1);
      Put ("  ");
      exit when Counter = 10;
      Counter := Counter + 1;
   end loop;
end Loop_Iteration;
