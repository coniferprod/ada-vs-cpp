--  Corresponds to fig06_09.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_09.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Bounded;
with Ada.Containers.Generic_Array_Sort;

procedure Search_Array is
   --  Instantiate a new package for color strings
   --  with a maximum length
   package Color_Strings is new
      Ada.Strings.Bounded.Generic_Bounded_Length (Max => 6);
   use Color_Strings;  -- required for the "<" operator for Sort

   type Color_Array is array (Natural range <>) of Bounded_String;
   Colors : Color_Array :=
      (To_Bounded_String ("red"),
       To_Bounded_String ("orange"),
       To_Bounded_String ("yellow"),
       To_Bounded_String ("green"),
       To_Bounded_String ("blue"),
       To_Bounded_String ("indigo"),
       To_Bounded_String ("violet"));

   procedure Sort is new Ada.Containers.Generic_Array_Sort
      (Index_Type => Natural,
       Element_Type => Bounded_String,
       Array_Type => Color_Array);

   --  Search for a color string in an array of colors.
   function Search (Source : Color_Array; Target : String) return Boolean is
      Item : Bounded_String := To_Bounded_String (Target);
   begin
      return (for some Color of Source => Color = Item);
   end Search;

   Found : Boolean;
begin
   Put_Line ("Unsorted Colors array:");
   Put ("   ");
   for Color of Colors loop
      Put (To_String (Color) & " ");
   end loop;
   New_Line;

   --  Sort the contents of the Colors array
   --  using the generic procedure instantiated above.
   Sort (Colors);

   --  Output the sorted array
   Put_Line ("Sorted Colors array:");
   Put ("   ");
   for Color of Colors loop
      Put (To_String (Color) & " ");
   end loop;

   --  Search for "indigo" in Colors
   Found := Search (Source => Colors, Target => "indigo");
   New_Line (Spacing => 2);
   Put_Line ("""indigo"" "
      & (if Found then "was" else "was not")
      & " found in Colors array");

   --  Search for "cyan" in Colors
   Found := Search (Source => Colors, Target => "cyan");
   Put_Line ("""cyan"" "
      & (if Found then "was" else "was not")
      & " found in Colors array");
end Search_Array;
