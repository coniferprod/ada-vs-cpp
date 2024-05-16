--  Corresponds to fig02_06.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch02/fig02_06.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;

procedure String_Test is
   S1 : String := "happy";
   S2 : String := " birthday";
   S3 : Ada.Strings.Unbounded.Unbounded_String
      := Ada.Strings.Unbounded.Null_Unbounded_String;
   Result : Boolean;

   function Starts_With (Source, Pattern : String) return Boolean is
   begin
      return Source'Length >= Pattern'Length and then
         Ada.Strings.Fixed.Head (Source, Pattern'Length) = Pattern;
   end Starts_With;

   function Ends_With (Source, Pattern : String) return Boolean is
   begin
      return Source'Length >= Pattern'Length and then
         Ada.Strings.Fixed.Tail (Source, Pattern'Length) = Pattern;
   end Ends_With;

begin
   --  Display the strings and their lengths
   Put_Line ("S1: """ & S1 & """; length: " & S1'Length'Image);
   Put_Line ("S2: """ & S2 & """; length: " & S2'Length'Image);
   Put_Line ("S3: """ & Ada.Strings.Unbounded.To_String (S3) & """; length: "
      & Ada.Strings.Unbounded.To_String (S3)'Length'Image);

   --  Compare strings with = and /=
   New_Line;
   Put_Line ("The results of comparing S2 and S1:");
   Result := S2 = S1;
   Put_Line ("S2 = S1: " & Result'Image);
   Result := S2 /= S1;
   Put_Line ("S2 /= S1: " & Result'Image);

   New_Line;
   Put_Line ("Testing S3 for empty:");
   if S3 = "" then
      Put_Line ("S3 is empty; assigning to S3;");
      S3 := Ada.Strings.Unbounded.To_Unbounded_String (S1 & S2);
      Put_Line ("S3: """ & Ada.Strings.Unbounded.To_String (S3) & """");
   end if;

   New_Line;

   Result := Starts_With (S1, "ha");
   Put_Line ("S1 starts with ""ha"": " & Result'Image);

   Result := Starts_With (S2, "ha");
   Put_Line ("S2 starts with ""ha"": " & Result'Image);

   Result := Ends_With (S1, "ay");
   Put_Line ("S1 ends with ""ay"": " & Result'Image);

   Result := Ends_With (S2, "ay");
   Put_Line ("S2 ends with ""ay"": " & Result'Image);
end String_Test;
