#!/usr/bin/perl
print "Content-type: text/html\n\n";

my $root = "/cgi-bin";
my $me = "test.pl";

my $title = "Jolly Roger Technologies";
my $subtitle = "Images";

require "./head.pl";
require "./header.pl";
require "./print-images.pl";
print head();

print <<"START_BODY";
<body>
  <div class="main">
START_BODY

print header($title, $subtitle);

my $directory = '../assets/images';
images($directory);

print <<"END_BODY";
  </div>
</body>
END_BODY
