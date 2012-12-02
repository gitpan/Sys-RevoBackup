
use strict;
use warnings;

use 5.010_000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "an rsync-based backup script",
  "AUTHOR" => "Dominik Schulz <dominik.schulz\@gauner.org>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Sys-RevoBackup",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Sys::RevoBackup",
  "PREREQ_PM" => {
    "Config::Yak" => 0,
    "Config::Yak::OrderedPlugins" => 0,
    "Config::Yak::RequiredConfig" => 0,
    "English" => 0,
    "File::Blarf" => 0,
    "Job::Manager" => 0,
    "Linux::Pidfile" => 0,
    "List::MoreUtils" => 0,
    "Log::Tree" => 0,
    "Log::Tree::RequiredLogger" => 0,
    "Moose" => 0,
    "MooseX::App::Cmd" => 0,
    "MooseX::App::Cmd::Command" => 0,
    "Sys::Bprsync" => 0,
    "Sys::Bprsync::Job" => 0,
    "Sys::Bprsync::Worker" => 0,
    "Sys::FS" => 0,
    "Sys::Hostname::FQDN" => 0,
    "Sys::RotateBackup" => 0,
    "Sys::Run" => 0,
    "Try::Tiny" => 0,
    "Zabbix::Sender" => 0,
    "feature" => 0,
    "mro" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.16",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



