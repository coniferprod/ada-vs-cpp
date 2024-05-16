--  Corresponds to fig02_05.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch02/fig02_05.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Comparing integers using if statements, relational operators
--  and equality operators.
procedure Compare_Integers is
   Number1 : Integer := 0;
   Number2 : Integer := 0;
begin
   Put ("Enter two integers to compare: ");
   Ada.Integer_Text_IO.Get (Item => Number1);
   Ada.Integer_Text_IO.Get (Item => Number2);

   if Number1 = Number2 then
      Put_Line (Number1'Image & " = " & Number2'Image);
   end if;

   if Number1 /= Number2 then
      Put_Line (Number1'Image & " /= " & Number2'Image);
   end if;

   if Number1 < Number2 then
      Put_Line (Number1'Image & " < " & Number2'Image);
   end if;

   if Number1 > Number2 then
      Put_Line (Number1'Image & " > " & Number2'Image);
   end if;

   if Number1 <= Number2 then
      Put_Line (Number1'Image & " <= " & Number2'Image);
   end if;

   if Number1 >= Number2 then
      Put_Line (Number1'Image & " >= " & Number2'Image);
   end if;
end Compare_Integers;
