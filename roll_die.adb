--  Corresponds to fig05_02.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_02.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

--  Rolling a six-sided die 60,000,000 times.
procedure Roll_Die is
   subtype Die_Type is Positive range 1..6;

   -- Set up the random number generator
   package Random_Die is
      new Ada.Numerics.Discrete_Random (Result_Subtype => Die_Type);
   Engine : Random_Die.Generator;

   -- Initialize the counts of the die faces rolled
   Frequency1, Frequency2, Frequency3, Frequency4, Frequency5, Frequency6 : Integer := 0;
begin
   --  N.B. The random number generator is not seeded.
   --  This is on purpose; see program fig05_04.

   for Counter in 1..60_000_000 loop
      --  Determine roll value 1-6 and increment appropriate counter
      case Random_Die.Random (Engine) is
         when 1 => Frequency1 := Frequency1 + 1;
         when 2 => Frequency2 := Frequency2 + 1;
         when 3 => Frequency3 := Frequency3 + 1;
         when 4 => Frequency4 := Frequency4 + 1;
         when 5 => Frequency5 := Frequency5 + 1;
         when 6 => Frequency6 := Frequency6 + 1;
         when others => Ada.Text_IO.Put ("Program should never get here!");
      end case;
   end loop;

   Ada.Text_IO.Put_Line ("Face    Frequency");

   Ada.Integer_Text_IO.Put (Item => 1, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency1, Width => 13);
   Ada.Text_IO.New_Line;

   Ada.Integer_Text_IO.Put (Item => 2, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency2, Width => 13);
   Ada.Text_IO.New_Line;

   Ada.Integer_Text_IO.Put (Item => 3, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency3, Width => 13);
   Ada.Text_IO.New_Line;

   Ada.Integer_Text_IO.Put (Item => 4, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency4, Width => 13);
   Ada.Text_IO.New_Line;

   Ada.Integer_Text_IO.Put (Item => 5, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency5, Width => 13);
   Ada.Text_IO.New_Line;

   Ada.Integer_Text_IO.Put (Item => 6, Width => 4);
   Ada.Integer_Text_IO.Put (Item => Frequency6, Width => 13);
   Ada.Text_IO.New_Line;
end Roll_Die;
