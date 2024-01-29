#!/usr/bin/perl
use 5.30.0;
use warnings FATAL => 'all';

use File::Spec::Functions qw(splitpath);
use JSON;

my @confs = (
    ['~/.config/emacs', 'git@github.com:NatTuck/emacs-config.git'],
    ['~/.config/i3', 'git@github.com:NatTuck/i3-config.git'],
);

for my $pair (@confs) {
    my ($path, $repo) = @$pair;
    $path = expand($path);
    if (-d "$path") {
        system(qq{(cd "$path" && git pull)});
    }
    else {
        system(qq{git clone "$repo" "$path"});
    }
}

sub expand {
    my ($xx) = @_;
    my $home = $ENV{'HOME'};
    $xx =~ s/\~/$home/g;
    return $xx;
}
