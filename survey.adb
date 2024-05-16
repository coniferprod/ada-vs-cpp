--  Corresponds to fig06_08.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch06/fig06_08.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Survey is
   subtype Response_Type is Positive range 1 .. 5;
   type Response_Array is array (Natural range <>) of Response_Type;
   Responses : constant Response_Array :=
      (1, 2, 5, 4, 3, 5, 2, 1, 3, 1, 4, 3, 3, 3, 2, 3, 3, 2, 2, 5);
   Frequency : array (Response_Type) of Integer := (others => 0);
begin
   for Response of Responses loop
      Frequency (Response) := Frequency (Response) + 1;
   end loop;

   Ada.Text_IO.Put_Line ("Rating  Frequency");
   for I in Frequency'Range loop
      Ada.Integer_Text_IO.Put (Item => I, Width => 6);
      Ada.Text_IO.Put ("  ");
      Ada.Integer_Text_IO.Put (Item => Frequency (I), Width => 9);
      Ada.Text_IO.New_Line;
   end loop;
end Survey;
