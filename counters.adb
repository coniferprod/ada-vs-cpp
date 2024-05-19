--  Corresponds to fig06_07.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_07.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Counters is
   subtype Die_Type is Positive range 1 .. 6;
   package Die_Throw is
      new Ada.Numerics.Discrete_Random (Result_Subtype => Die_Type);
   Gen : Die_Throw.Generator;
   Die : Die_Type;
   Frequency : array (Die_Type) of Integer := (others => 0);
begin
   --  Initialize the random number generator
   Die_Throw.Reset (Gen);

   --  Since we have exactly six values in the Frequency array
   --  we don't need to "ignore element zero" like in the C++ example.

   --  We have already initialized all the frequencies to zero above.

   --  Roll the die many, many times;
   --  use the die value as the frequency index.
   for Roll in 1 .. 60_000_000 loop
      Die := Die_Throw.Random (Gen);
      Frequency (Die) := Frequency (Die) + 1;
   end loop;

   Ada.Text_IO.Put_Line ("Face    Frequency");
   for F in Frequency'Range loop
      Ada.Integer_Text_IO.Put (Item => F, Width => 4);
      Ada.Text_IO.Put ("  ");
      Ada.Integer_Text_IO.Put (Item => Frequency (F));
      Ada.Text_IO.New_Line;
   end loop;
end Counters;
