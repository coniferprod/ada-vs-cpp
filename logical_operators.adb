--  Corresponds to fig04_10.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_10.cpp

with Ada.Text_IO; use Ada.Text_IO;

procedure Logical_Operators is
   Value : Boolean;
begin
   --  Create a truth table for the logical AND operator
   Put_Line ("Logical AND (and)");
   Value := False and False;
   Put_Line ("False and False: " & Value'Image);

   Value := False and True;
   Put_Line ("False and True: " & Value'Image);

   Value := True and False;
   Put_Line ("True and False: " & Value'Image);

   Value := True and True;
   Put_Line ("True and True: " & Value'Image);
   New_Line;

   --  Create a truth table for the logical OR operator
   Put_Line ("Logical OR (or)");
   Value := False or False;
   Put_Line ("False or False: " & Value'Image);

   Value := False or True;
   Put_Line ("False or True: " & Value'Image);

   Value := True or False;
   Put_Line ("True or False: " & Value'Image);

   Value := True and True;
   Put_Line ("True or True: " & Value'Image);
   New_Line;

   --  Create truth table for NOT (logical negation) operator
   Put_Line ("Logical negation (not)");
   Value := not False;
   Put_Line ("not False: " & Value'Image);

   Value := not True;
   Put_Line ("not True: " & Value'Image);
   New_Line;
end Logical_Operators;
