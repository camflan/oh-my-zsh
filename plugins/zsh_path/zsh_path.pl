#!/usr/bin/perl
# This script transforms and splits up the current path for use in my zsh shell
# theme.

use strict;
use Term::ExtendedColor 'fg';

chomp(my $pwd = `pwd`);

my @chars = split//, $pwd;

my $i = 1;

for(@chars) {
  if($_ eq '/') {
    if(defined($ENV{DISPLAY})) {
      if($i == 1) {
        print fg('blue6', fg('bold', " /"));
        $i++;
        next;
      }
    }
    else {
      if($i == 1) {
        print "\e[31;1m /\e[0m";
        $i++;
        next;
      }
    }

    if(defined($ENV{DISPLAY})) {
      print fg("yellow$i", " » ");
      $i += 6
    }
    else {
      print "\e[33m > \e[0m";
      $i += 6;
    }
  }
  else {
    if(defined($ENV{DISPLAY})) {
      print fg('blue6', $_);
    }
    else {
      print "\e[34m$_\e[0m";
    }
  }
}
