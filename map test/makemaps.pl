#!/usr/bin/perl

use strict;
use warnings;

my $name="manchuxetex";
my $master="$name.maps";
my $output="mappings/$name";
mkdir("mappings");

#schemes = manchu mdf haen xmhdcd zakh

## Manchu
open MAPS, "<$master" ;
open OUTPUT, ">$output-manchu.map";
while (<MAPS>) {
	s/^\@M // ;
	s/^\@.+\n//m ;
	s/^#[A-Z]*M[A-Z]* // ;
	s/^#-[T]+ // ;
	s/^#.+\n//m ;
	print OUTPUT
} ;
close OUTPUT;
close MAPS;

## MöllenDorf
open MAPS, "<$master" ;
open OUTPUT, ">$output-trans-mdf.map";
while (<MAPS>) {
	s/^\@TD // ;
	s/^\@m // ;
	s/^\@.+\n//m ;
	s/^#[A-Z]*T[A-Z]*D // ;
	s/^#[A-Z]*T[A-Z]* // ;
	s/^#-[M]+D // ;
	s/^#-[M]+ // ;
	s/^#D // ;
	s/^#.+\n//m ;
	print OUTPUT
} ;
close OUTPUT;
close MAPS;

## Haenisch
open MAPS, "<$master" ;
open OUTPUT, ">$output-trans-haen.map";
while (<MAPS>) {
	s/^\@TH // ;
	s/^\@H // ;
	s/^\@.+\n//m ;
	s/^#[A-Z]*T[A-Z]*H // ;
	s/^#[A-Z]*T[A-Z]* // ;
	s/^#-[M]+H // ;
	s/^#-[M]+ // ;
	s/^#H // ;
	s/^#.+\n//m ;
	print OUTPUT
} ;
close OUTPUT;
close MAPS;

## xmhdcd
open MAPS, "<$master" ;
open OUTPUT, ">$output-trans-xmhdcd.map";
while (<MAPS>) {
	s/^\@TX // ;
	s/^\@X // ;
	s/^\@.+\n//m ;
	s/^#[A-Z]*T[A-Z]*X // ;
	s/^#[A-Z]*T[A-Z]* // ;
	s/^#-[M]+X // ;
	s/^#-[M]+ // ;
	s/^#X // ;
	s/^#.+\n//m ;
	print OUTPUT
} ;
close OUTPUT;
close MAPS;

# Let's compile them now
system("cp *.map mappings/");
system("for map in mappings/*.map; do echo \"compiling \$map ...\" && teckit_compile \$map; done");