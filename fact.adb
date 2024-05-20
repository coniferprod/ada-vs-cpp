--  Corresponds to fig05_15.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_15.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Fact is

   --  Recursive definition of the factorial function
   function Factorial (Number : in Natural) return Positive is
   begin
      if Number <= 1 then  -- test for base case
         return 1; -- base cases: 0! = 1 and 1! = 1
      else -- recursion step
         return Number * Factorial (Number - 1);
      end if;
   end Factorial;

begin
   --  Calculate the factorials of 0 through 10
   for Counter in 0..10 loop
      Ada.Integer_Text_IO.Put (Item => Counter, Width => 2);
      Ada.Text_IO.Put ("! = ");
      Ada.Integer_Text_IO.Put (Item => Factorial (Number => Counter), Width => 1);
      Ada.Text_IO.New_Line;
   end loop;
end Fact;
