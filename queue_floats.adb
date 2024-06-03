--  Corresponds to fig13_11.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch13/fig13_11.cpp

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Containers.Synchronized_Queue_Interfaces;
with Ada.Containers.Unbounded_Synchronized_Queues;

procedure Queue_Floats is
   package Float_Interface is
      new Ada.Containers.Synchronized_Queue_Interfaces
         (Element_Type => Float);

   package Unbounded_Float_Package is
      new Ada.Containers.Unbounded_Synchronized_Queues
         (Queue_Interfaces => Float_Interface);

   use type Ada.Containers.Count_Type;

   Values : Unbounded_Float_Package.Queue;
   V : Float;
begin
   Values.Enqueue (3.2);
   Values.Enqueue (9.8);
   Values.Enqueue (5.4);

   Put ("Popping from Values: ");

   -- pop elements from queue
   while Values.Current_Use /= 0 loop
      Values.Dequeue (V);
      Put (Item => V, Fore => 1, Aft => 1, Exp => 0);
      Put (" ");
   end loop;
end Queue_Floats;
