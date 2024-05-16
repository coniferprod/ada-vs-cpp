--  Corresponds to fig02_04.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch02/fig02_04.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Addition program that displays the sum of two integers.
procedure Addition is
   Number1 : Integer := 0;
   Number2 : Integer := 0;
   Sum : Integer := 0;
begin
   Ada.Text_IO.Put ("Enter first integer: ");
   Ada.Integer_Text_IO.Get (Item => Number1);

   Ada.Text_IO.Put ("Enter second integer: ");
   Ada.Integer_Text_IO.Get (Item => Number2);

   Sum := Number1 + Number2;

   Ada.Text_IO.Put ("Sum is ");
   Ada.Integer_Text_IO.Put (Item => Sum, Width => 1);
   Ada.Text_IO.New_Line;
end Addition;
