--  Corresponds to fig04_06.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_06.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

--  Using a case statement to count letter grades.
procedure Count_Grades is
   Total : Natural := 0; --  sum of grades
   Grade_Counter : Natural := 0;  -- number of grades entered

   --  Note the multiple declaration, with all variables
   --  initialized with the same expression
   A_Count, B_Count, C_Count, D_Count, F_Count : Natural := 0;
begin
   Put_Line ("Enter the integer grades in the range 0-100.");
   Put_Line ("Type the end-of-file indicator to terminate input");
   Put_Line ("   On UNIX/Linux/macOS type <Ctrl> d then press Enter");
   Put_Line ("   On Windows type <Ctrl> z then press Enter");

   while not Ada.Text_IO.End_Of_File loop
      declare
         Grade : Natural;
      begin
         Ada.Integer_Text_IO.Get (Item => Grade);
         Total := Total + Grade;
         Grade_Counter := Grade_Counter + 1;

         --  Increment appropriate letter-grade counter
         case Grade / 10 is
            when 9 | 10 => -- grade was between 90 and 100, inclusive
               A_Count := A_Count + 1;
            when 8 => -- grade was between 80 and 89
               B_Count := B_Count + 1;
            when 7 => -- grade was between 70 and 79
               C_Count := C_Count + 1;
            when 6 => -- grade was between 60 and 69
               D_Count := D_Count + 1;
            when others => -- grade was less then 60
               F_Count := F_Count + 1;
         end case;
      end;
   end loop;

   New_Line;
   Put_Line ("Grade Report:");

   if Grade_Counter /= 0 then
      declare
         --  Calculate the average of all grades entered
         Average : Float := Float (Total) / Float (Grade_Counter);
      begin
         --  Output summary of results
         Put ("Total of the ");
         Ada.Integer_Text_IO.Put (Item => Grade_Counter, Width => 1);
         Put (" grades entered is ");
         Ada.Integer_Text_IO.Put (Item => Total, Width => 1);
         New_Line;
         Put ("Class average is  ");
         Ada.Float_Text_IO.Put (Item => Average, Fore => 1, Aft => 2, Exp => 0);
         New_Line;

         Put_Line ("Number of students who received each grade:");

         Put_Line ("A: " & A_Count'Image);
         Put_Line ("B: " & B_Count'Image);
         Put_Line ("C: " & C_Count'Image);
         Put_Line ("D: " & D_Count'Image);
         Put_Line ("F: " & F_Count'Image);
      end;
   else
      Put ("No grades were entered");
   end if;
end Count_Grades;
