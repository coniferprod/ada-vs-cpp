--  Corresponds to fig05_17.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_17.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Fact_Iter is

   --  Iterative factorial function
   function Factorial (Number : in Natural) return Positive is
      Result : Positive;
   begin
      Result := 1;
      for I in 2 .. Number loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

begin
   --  Calculate the factorials of 0 through 10
   for Counter in 0..10 loop
      Ada.Integer_Text_IO.Put (Item => Counter, Width => 2);
      Ada.Text_IO.Put ("! = ");
      Ada.Integer_Text_IO.Put (Item => Factorial (Number => Counter), Width => 1);
      Ada.Text_IO.New_Line;
   end loop;
end Fact_Iter;
