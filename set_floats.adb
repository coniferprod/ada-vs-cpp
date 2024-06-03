--  Corresponds to fig13_07.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch13/fig13_07.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Containers.Ordered_Sets;

procedure Set_Floats is

   package Float_Sets is new
      Ada.Containers.Ordered_Sets
         (Element_Type => Float);

   use Float_Sets;

   procedure Print_Set (S : Set) is
      use Ada.Float_Text_IO;
   begin
      for F of S loop
         Put (Item => F, Fore => 1, Aft => 1, Exp => 0);
         Put (Item => " ");
      end loop;
      New_Line;
   end Print_Set;

   S : Set;
   C : Cursor;
   Ins : Boolean;
begin
   -- I don't know of a set literal in Ada,
   -- so we insert the values one at a time,
   -- using the form of Insert that does not error.
   S.Insert (2.1, C, Ins);
   S.Insert (4.2, C, Ins);
   S.Insert (9.5, C, Ins);
   S.Insert (2.1, C, Ins); -- this would error with the normal Insert
   S.Insert (3.7, C, Ins);

   Put ("S contains: ");
   Print_Set (S);

   -- insert 13.8 in S; the Insert function updates the
   -- Boolean value Ins to indicate if the item was inserted
   S.Insert (New_Item => 13.8, Position => C, Inserted => Ins);
   New_Line;
   Put_Line ("13.8 " & (if Ins then "was" else "was not") & " inserted");

   Put ("S contains: ");
   Print_Set (S);

   -- insert 9.5 in S
   S.Insert (New_Item => 9.5, Position => C, Inserted => Ins); -- value already in set
   New_Line;
   Put_Line ("13.8 " & (if Ins then "was" else "was not") & " inserted");

   Put ("S contains: ");
   Print_Set (S);
end Set_Floats;
