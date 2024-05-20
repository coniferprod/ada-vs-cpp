--  Corresponds to fig05_02.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_02.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

--  Producing random integers in the range 1 through 6.
procedure Random_Integers is
   subtype Die_Type is Positive range 1..6;
   package Random_Die is
      new Ada.Numerics.Discrete_Random (Result_Subtype => Die_Type);

   Engine : Random_Die.Generator;
begin
   --  N.B. The random number generator is not seeded.
   --  That is on purpose (see program fig05_04).

   for Counter in 1..10 loop
      Ada.Integer_Text_IO.Put (Item => Random_Die.Random (Engine), Width => 1);
      Ada.Text_IO.Put (" ");
   end loop;
   Ada.Text_IO.New_Line;
end Random_Integers;
