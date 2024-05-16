--  Corresponds to fig06_02.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_02.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

procedure Initialize_Two_Arrays is
   type Integer_Array is array (Natural range <>) of Integer;
   Values : Integer_Array := (32, 27, 64, 18, 95);

   -- No type inference, so we need to declare the type
   -- and the array
   type Float_Array is array (Natural range <>) of Float;
   Values2 : Float_Array := (1.1, 2.2, 3.3, 4.4);

begin
   for I in Values'Range loop
      Ada.Integer_Text_IO.Put (Item => Values (I), Width => 1);
      Ada.Text_IO.Put ("  ");
   end loop;
   Ada.Text_IO.New_Line (Spacing => 2);

   for I in Values2'Range loop
      Ada.Float_Text_IO.Put (Item => Values2 (I), Fore => 1, Aft => 1, Exp => 0);
      Ada.Text_IO.Put ("  ");
   end loop;

   Ada.Text_IO.New_Line;
end Initialize_Two_Arrays;
