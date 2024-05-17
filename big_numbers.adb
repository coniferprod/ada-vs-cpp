--  Corresponds to fig03_05.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch03/fig03_05.cpp
--  Requires Ada 2022. See Ada 2022 RM, Section A.5.5 (http://www.ada-auth.org/standards/22rm/html/RM-A-5-5.html)
--  Compile with gnatmake using the -gnat2020 switch.
--  See also https://learn.adacore.com/courses/whats-new-in-ada-2022/chapters/big_numbers.html

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics.Big_Numbers.Big_Integers;  -- new in Ada 2022
use Ada.Numerics.Big_Numbers.Big_Integers;

procedure Big_Numbers is
   Value1 : Long_Long_Integer := 9_223_372_036_854_775_807;

begin
   Put_Line ("Long_Long_Integer Value1: " & Value1'Image);
   Put_Line ("Value1 - 1 = " & Long_Long_Integer'Image (Value1 - 1));  -- OK

   --  Adding one to the biggest long long integer:
   --  In C++, undefined (of course)
   --  In Ada, compiler warning, Constraint_Error at runtime
   -- Put_Line ("Value1 + 1 = " & Long_Long_Integer'Image (Value1 + 1));

   declare
      --  Use an arbitrary-precision integer
      --  initialized from a Long_Long_Integer
      Value2 : Big_Integer := From_String (Long_Long_Integer'Image (Value1));
   begin
      Put_Line ("Big_Integer Value2: " & To_String (Value2));
      Put_Line ("Value2 - 1 = " & To_String (Value2 - 1));  -- OK
      Put_Line ("Value2 + 1 = " & To_String (Value2 + 1));  -- OK
   end;

   --  Powers of 100_000_000 with Long_Long_Integer
   declare
      Value3 : Long_Long_Integer := 100_000_000;
      Counter : Integer := 2;
   begin
      New_Line;
      Put_Line ("Value3: " & Long_Long_Integer'Image (Value3));

      --while Counter <= 5 loop
      --   Value3 := Value3 * 100_000_000;  -- quickly exceeds maximum Long_Long_Integer value
      --   New_Line;
      --   Put ("Value3 to the power " & Counter'Image & ": " & Long_Long_Integer'Image (Value3));
      --   Counter := Counter + 1;
      --end loop;
   end;

   --  Powers of 100_000_000 with Big_Integer
   declare
      Value4 : Big_Integer := From_String ("100_000_000");
      Counter : Integer := 2;
   begin
      New_Line;
      Put_Line ("Value4: " & To_String (Value4));

      while Counter <= 5 loop
         Put_Line ("Value4 ** " & Counter'Image & ": " & To_String (Value4 ** Counter));
         Counter := Counter + 1;
      end loop;
   end;

   New_Line;

end Big_Numbers;
