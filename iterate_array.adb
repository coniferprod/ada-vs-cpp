--  Corresponds to fig06_03.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_03.cpp

with Ada.Text_IO;

procedure Iterate_Array is
   type Integer_Array is array (Natural range <>) of Integer;
   Items : Integer_Array := (1, 2, 3, 4, 5);
   Running_Total : Integer;
begin
   Ada.Text_IO.Put ("Items before modification: ");
   for I of Items loop
      Ada.Text_IO.Put (I'Image & " ");
   end loop;

   --  Multiply the elements of Items by 2
   for I of Items loop
      I := I * 2;
   end loop;

   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put ("Items after modification: ");
   for I of Items loop
      Ada.Text_IO.Put (I'Image & " ");
   end loop;

   --  Sum elements of Items using iteration
   Running_Total := 0;
   for I of Items loop
      Running_Total := Running_Total + I;
      Ada.Text_IO.Put_Line ("item: " & I'Image
         & ": running total: " & Running_Total'Image);
   end loop;
end Iterate_Array;
