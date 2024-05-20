--  Corresponds to fig05_16.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch05/fig05_16.cpp

with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Fib is

   --  Recursive Fibonacci function.
   function Fibonacci (Index : in Natural) return Natural is
   begin
      if Index = 0 or Index = 1 then  -- base cases
         return Index;
      else  -- recursion step
         return Fibonacci (Index => Index - 1) + Fibonacci (Index => Index - 2);
      end if;
   end Fibonacci;

   --  Helper function to display term number `Index`
   --  in the Fibonacci sequence.
   procedure Display_Term (Index : Natural; Item : Positive) is
   begin
      Ada.Text_IO.Put ("Fibonacci(");
      Ada.Integer_Text_IO.Put (Item => Index, Width => 1);
      Ada.Text_IO.Put (") = ");
      Ada.Integer_Text_IO.Put (Item, Width => 1);
      Ada.Text_IO.New_Line;
   end Display_Term;

begin
   --  Calculate the terms number 0 through 10 of the Fibonacci series
   for Counter in 1..10 loop
      Display_Term (Index => Counter, Item => Fibonacci (Index => Counter));
   end loop;

   --  Display some terms later in the series
   Display_Term (Index => 20, Item => Fibonacci (Index => 20));
   Display_Term (Index => 30, Item => Fibonacci (Index => 30));
   Display_Term (Index => 35, Item => Fibonacci (Index => 35));
end Fib;
