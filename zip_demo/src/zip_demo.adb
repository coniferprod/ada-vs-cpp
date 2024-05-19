--  Corresponds to fig04_11.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_11.cpp

--  Using the Zip-Ada library to write and read a ZIP file.
--  See https://unzip-ada.sourceforge.io

with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Directories;
with Zip.Create;

procedure Zip_Demo is
   Zip_File_Name : Ada.Strings.Unbounded.Unbounded_String;

   --  From "Ada 95: Problem Solving and Program Design", 3rd Ed
   --  by Michael B. Feldman and Elliot B. Koffman (Addison-Wesley, 1999),
   --  Section 5.1.
   Content : String :=
      "Just as the ability to make decisions is a very important " &
      "programming tool, so is the ability to specify that a group " &
      "of operations is to be repeated. For example, a company with " &
      "seven employees will want to repeat the gross pay and net pay " &
      "computations in its payroll program seven times, once for each employee. " &
      "The repetition of steps in a program is called a loop. The loop body " &
      "contains the steps to be repeated. Ada provides three control statements " &
      "for specifying repetition. This chapter examines the FOR statement and " &
      "previews the WHILE statement. The WHILE statement and the third loop " &
      "form, the general LOOP statement, are examined in Chapter 6.";

   Zip_File : aliased Zip.Create.Zip_File_Stream;
   Archive : Zip.Create.Zip_Create_Info;
begin
   Ada.Text_IO.Put ("Enter a ZIP file name: ");
   Zip_File_Name := Ada.Text_IO.Unbounded_IO.Get_Line;

   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put ("Content'Length = " & Content'Length'Image);

   --  Create the ZIP file object
   Zip.Create.Create_Archive (
      Info => Archive,
      Z_Stream => Zip_File'Unchecked_Access,
      Archive_Name => Ada.Strings.Unbounded.To_String (Zip_File_Name));

   --  Write the content into a text file in the archive
   Zip.Create.Add_String (
      Info => Archive,
      Contents => Content,
      Name_In_Archive => "intro.txt");

   --  Save the archive
   Zip.Create.Finish (Info => Archive);
end Zip_Demo;
