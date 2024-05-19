# Ada vs. C++

This is a small collection of example programs from
["C++20 for Programmers: An Objects-Natural Approach"](https://deitel.com/c-plus-plus-20-for-programmers)
by Paul Deitel and Harvey Deitel (Pearson, 2022)
converted from C++ to Ada 2012.

The output from the programs is the same or very similar
as the original C++ programs found in the book's
[GitHub repository](https://github.com/pdeitel/CPlusPlus20ForProgrammers),
but the Ada versions aim to be idiomatic Ada.

For copyright reasons the original C++ source code from the book
is not reproduced here, but instead links to the GitHub repository
is provided.

## Compiling the Ada program text

All the Ada programs were compiled with GNATMAKE Community 2020.
Some programs use Ada 2022 features (such as big numbers).
See the respective source file for details.

The Ada version of the ZIP file demo from Chapter 4 uses the
[Zip-Ada](https://unzip-ada.sourceforge.io) library, and is
supplied as an [Alire](https://alire.ada.dev) project.
The project was created with the command `alr init --bin zip_demo`,
and the Zip-Ada library was added using the
command `alr with zipada`. Build the program with `alr build`
and run it with `alr run`.
