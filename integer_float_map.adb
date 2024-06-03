--  Corresponds to fig13_09.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch13/fig13_09.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Containers.Ordered_Maps;

procedure Integer_Float_Map is
   package Integer_Float_Maps is new
     Ada.Containers.Ordered_Maps
       (Key_Type        => Integer,
        Element_Type    => Float);

   use Integer_Float_Maps;
   use Ada.Float_Text_IO;

   -- Inserts a key-value pair into the map.
   -- Replaces any existing value for the key.
   procedure Insert (M : out Map; K : Integer; V : Float) is
      C : Cursor;
      Ins : Boolean;
   begin
      Insert (M, K, V, C, Ins);  -- ignore the cursor and the flag
   end Insert;

   M : Map;
begin
   -- Use our locally defined Insert procedure
   Insert (M, 15, 2.7);
   Insert (M, 30, 111.11);
   Insert (M, 5, 1010.1);
   Insert (M, 10, 22.22);
   Insert (M, 25, 33.333);
   Insert (M, 5, 77.54);
   Insert (M, 20, 9.345);
   Insert (M, 15, 99.3);

   Put_Line ("M contains:");
   Put_Line ("Key    Value");

   for C in M.Iterate loop
      Put (Integer'Image (Key (C)) & "    ");
      Put (Item => M (C), Fore => 1, Aft => 3, Exp => 0);
      New_Line;
   end loop;

   M (25) := 9999.99;  -- use indexing to change value for key 25

   -- unable to add a value to the map with indexing, must use
   -- Include (or Insert)
   M.Include (40, 8765.43);

   -- iterate through the elements
   Put_Line ("After updates, M contains:");
   Put_Line ("Key    Value");

   for C in M.Iterate loop
      Put (Integer'Image (Key (C)) & "    ");
      Put (Item => M (C), Fore => 1, Aft => 3, Exp => 0);
      New_Line;
   end loop;

end Integer_Float_Map;

