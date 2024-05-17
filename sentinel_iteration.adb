--  Corresponds to fig03_02.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig03_02.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

--  Solving the class-average problem using sentinel-controlled iteration.
procedure Sentinel_Iteration is
   Total : Integer := 0;  --  initialize sum of grades entered by the user
   Grade_Counter : Integer := 0;  -- initialize # of grades entered so far
   Grade : Integer;  -- stores the grade on each iteration
   Average : Float;  -- stores the average of the grades
begin
   --  Processing phase: prompt for input and read grade from user
   Ada.Text_IO.Put ("Enter grade or -1 to quit: ");
   Ada.Integer_Text_IO.Get (Item => Grade);

   --  Loop until sentinel value is read from user
   while Grade /= -1 loop
      Total := Total + Grade;
      Grade_Counter := Grade_Counter + 1;

      --  Prompt for input and read next grade from user
      Ada.Text_IO.Put ("Enter grade or -1 to quit: ");
      Ada.Integer_Text_IO.Get (Item => Grade);
   end loop;

   --  Termination phase: if user entered at least one grade...
   if Grade_Counter /= 0 then
      --  Use number with decimal point to calculate average of grades.
      --  Note that we need explicit type conversions.
      Average := Float (Total) / Float (Grade_Counter);

      --  Display total and average (with two digits of precision)
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("Total of the ");
      Ada.Integer_Text_IO.Put (Item => Grade_Counter, Width => 1);
      Ada.Text_IO.Put (" grades entered is ");
      Ada.Integer_Text_IO.Put (Item => Total, Width => 1);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("Class average is  ");
      Ada.Float_Text_IO.Put (Item => Average, Fore => 1, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;
   else  -- no grades entered, output appropriate message
      Ada.Text_IO.Put_Line ("No grades were entered");
   end if;
end Sentinel_Iteration;
