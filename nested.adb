--  Corresponds to fig03_03.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig03_03.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

--  Analysis of examination results using nested control statements.
procedure Nested is
   Passes : Integer := 0;
   Failures : Integer := 0;
   Student_Counter : Integer := 1;
   Result : Integer;
begin
   --  Process 10 students using counter-controlled loop
   while Student_Counter <= 10 loop
      Put ("Enter result (1 = pass, 2 = fail): ");
      Ada.Integer_Text_IO.Get (Item => Result);

      --  if-else is nested in the while statement
      if Result = 1 then
         Passes := Passes + 1;
      else
         Failures := Failures + 1;
      end if;

      --  Increment student counter so that the loop
      --  eventually terminates.
      Student_Counter := Student_Counter + 1;
   end loop;

   --  Termination phase: prepare and display results
   Put ("Passed: ");
   Ada.Integer_Text_IO.Put (Item => Passes, Width => 1);
   New_Line;
   Put ("Failed: ");
   Ada.Integer_Text_IO.Put (Item => Failures, Width => 1);
   New_Line;

   --  Determine whether more than 8 students passed
   if Passes > 8 then
      Put_Line ("Bonus to instructor!");
   end if;
end Nested;
