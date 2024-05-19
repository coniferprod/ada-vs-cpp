--  Corresponds to fig04_11.cpp
--  https://github.com/pdeitel/CPlusPlus20ForProgrammers/blob/master/examples/ch04/fig04_11.cpp

--  Using the Zip-Ada library to write and read a ZIP file.
--  See https://unzip-ada.sourceforge.io

with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;
with Ada.Calendar;
with Ada.Calendar.Formatting;
with Interfaces;

with Zip;
with Zip.Create;
with Zip_Streams;
--with Zip_Streams.Calendar;

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

begin
   Ada.Text_IO.Put ("Enter a ZIP file name: ");
   Zip_File_Name := Ada.Text_IO.Unbounded_IO.Get_Line;

   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put ("Content'Length = " & Content'Length'Image);

   declare
      use Zip.Create;

      Output : aliased Zip_File_Stream;
      Archive : Zip_Create_Info;

   begin
      --  Create the ZIP file object
      Create_Archive (
         Info => Archive,
         Z_Stream => Output'Unchecked_Access,
         Archive_Name => Ada.Strings.Unbounded.To_String (Zip_File_Name));

      --  Write the content into a text file in the archive
      Add_String (
         Info => Archive,
         Contents => Content,
         Name_in_archive => "intro.txt");

      --  Save the archive
      Finish (Info => Archive);
   end;

   declare
      use Zip;

      Archive : Zip_info;

      --  Procedure that is called for each ZIP directory entry.
      procedure Action (
         name : String;
         file_index       : Zip_Streams.ZS_Index_Type;
         comp_size        : Zip_64_Data_Size_Type;
         uncomp_size      : Zip_64_Data_Size_Type;
         crc_32           : Interfaces.Unsigned_32;
         date_time        : Time;
         method           : PKZip_method;
         name_encoding    : Zip_name_encoding;
         read_only        : Boolean;
         encrypted_2_x    : Boolean;  --  PKZip 2.x encryption
         user_code        : in out Integer) is
      begin
         Ada.Integer_Text_IO.Put (Item => Integer (uncomp_size), Width => 1);

         --  Zip-Ada has its own datetime type, so we need to convert to Ada's
         --  Time for use with the Ada 2005+ calendar formatting.
         Ada.Text_IO.Put (
            Item => Ada.Calendar.Formatting.Image (
               Date => Zip_Streams.Calendar.Convert (date_time)));

         Ada.Text_IO.Put (name);
         Ada.Text_IO.New_Line;
      end Action;

      -- Calls the Action procedure for each ZIP directory entry.
      procedure Print_Directory is new Traverse_verbose (Action);

   begin
      -- Load the ZIP file
      Load (info => Archive, from => Ada.Strings.Unbounded.To_String (Zip_File_Name));

      --  Display the archive's file name and directory listing
      Ada.Text_IO.New_Line (2);
      Ada.Text_IO.Put_Line ("ZIP file's name: " & Zip_name (Archive));
      Ada.Text_IO.New_Line (2);

      Ada.Text_IO.Put_Line ("ZIP file's directory listing:");
      Ada.Text_IO.Put_Line ("  Length      Date    Time    Name");
      Ada.Text_IO.Put_Line ("---------  ---------- -----   ----");
      Print_Directory (Archive);

      --  TODO: Find out if Zip-Ada has a way to get the total size
      --  of the files.
      Ada.Text_IO.Put (Item => Entries (info => Archive)'Image);
      Ada.Text_IO.Put (" " & (if Entries (info => Archive) = 1 then "file" else "files"));
   end;

   --  TODO: Getting and Displaying Information About a Specific File in the ZIP Archive

   --  TODO: Extracting "intro.txt" and Displaying Its Original Contents

   --  FIXME: The timestamp of the created intro.txt doesn't seem quite right
end Zip_Demo;
