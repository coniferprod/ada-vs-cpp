--  Corresponds to fig05_01.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_01.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Find_Maximum is

   --  The Maximum function is defined inside the main program.
   --  No function prototype is needed.
   --  Returns the largest of three integers.
   function Maximum (X : Integer; Y : Integer; Z : Integer) return Integer is
      Maximum_Value : Integer := X;  -- assume X is the largest to start
   begin
      --  Determine whether Y is greater than the maximum value
      if Y > Maximum_Value then
         Maximum_Value := Y;  -- make Y the new maximum value
      end if;

      --  Determine whether Z is greater than the maximum value
      if Z > Maximum_Value then
         Maximum_Value := Z;  -- make Z the new maximum value
      end if;

      return Maximum_Value;
   end Maximum;

   Int1, Int2, Int3 : Integer;
begin
   Ada.Text_IO.Put ("Enter three integer values: ");
   Ada.Integer_Text_IO.Get (Int1);
   Ada.Integer_Text_IO.Get (Int2);
   Ada.Integer_Text_IO.Get (Int3);

   Ada.Text_IO.Put ("The maximum integer value is: ");
   Ada.Integer_Text_IO.Put (Item => Maximum (Int1, Int2, Int3), Width => 1);
   Ada.Text_IO.New_Line;
end Find_Maximum;
