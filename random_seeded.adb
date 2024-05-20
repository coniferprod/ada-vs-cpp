--  Corresponds to fig05_04.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_04.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

--  Randomizing the die-rolling program.
procedure Random_Seeded is
   subtype Die_Type is Positive range 1..6;
   package Random_Die is
      new Ada.Numerics.Discrete_Random (Result_Subtype => Die_Type);

   Engine : Random_Die.Generator;
   Seed : Integer := 0;  -- stores the seed entered by the user
begin
   Ada.Text_IO.Put ("Enter seed: ");
   Ada.Integer_Text_IO.Get (Seed);

   --  Set up the random number generator
   Random_Die.Reset (Gen => Engine, Initiator => Seed);

   --  Display 10 random die rolls
   for Counter in 1..10 loop
      Ada.Integer_Text_IO.Put (Item => Random_Die.Random (Engine), Width => 1);
      Ada.Text_IO.Put (" ");
   end loop;
   Ada.Text_IO.New_Line;
end Random_Seeded;
