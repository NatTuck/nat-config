#!/usr/bin/perl
use 5.36.0;
use wan FATAL => 'all';

chdir("$ENV{HOME}/.config");
system("pwd");

unless (-e "./nvim") {
    say("No nvim config");
    system("ln -s nat-config/nvim .");
}

system("ls -l nvim");
