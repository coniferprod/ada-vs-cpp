--  Corresponds to fig03_01.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig03_01.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

--  Solving the class-average problem using counter-controlled iteration.
procedure Counter_Iteration is
   Total : Integer := 0;  --  initialize sum of grades entered by the user
   Grade_Counter : Integer := 1;  -- initialize grade # to be entered next
   Grade : Integer;  -- stores the grade on each iteration
   Average : Integer;  -- stores the average of the grades
begin
   --  Processing phase uses counter-controlled iteration
   while Grade_Counter <= 10 loop
      Put ("Enter grade: ");
      Ada.Integer_Text_IO.Get (Item => Grade);
      Total := Total + Grade;
      Grade_Counter := Grade_Counter + 1;
   end loop;

   Average := Total / 10; -- integer division yields integer result

   --  Display total and average of grades
   New_Line;
   Put ("Total of all 10 grades is ");
   Ada.Integer_Text_IO.Put (Item => Total, Width => 1);
   New_Line;
   Put ("Class average is ");
   Ada.Integer_Text_IO.Put (Item => Average, Width => 1);
   New_Line;
end Counter_Iteration;
