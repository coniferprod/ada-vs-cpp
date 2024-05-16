--  Corresponds to fig06_06.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

--  For the string replication operator:
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Bar_Chart is
   type Integer_Array is array (Natural range <>) of Integer;
   Frequencies : constant Integer_Array := (0, 0, 0, 0, 0, 0, 1, 2, 4, 2, 1);
   Counter, First, Last : Integer;
begin
   Ada.Text_IO.Put_Line ("Grade distribution:");

   --  For each element of Frequencies,
   --  output a bar of the chart
   Counter := 0;
   for Frequency of Frequencies loop
      --  Output bar labels ("00-09:", ..., "90-99:", "100:")
      if Counter < 10 then
         First := Counter * 10;
         Last := First + 9;
         Ada.Integer_Text_IO.Put (Item => First, Width => 2);
         Ada.Text_IO.Put ("-");
         Ada.Integer_Text_IO.Put (Item => Last, Width => 2);
         --  Note that 0 and 9 are not zero-padded from the left here;
         --  that could maybe be arranged by skillfully applying
         --  the Ada.Strings.Fixed.Tail function.
      else
         Last := 100;
         Ada.Integer_Text_IO.Put (Item => Last, Width => 5);
      end if;
      Ada.Text_IO.Put (": ");
      Counter := Counter + 1;

      --  Print a line containing a bar of asterisks
      Ada.Text_IO.Put_Line (Frequency * "*");
   end loop;
end Bar_Chart;
