sub images() {
  my $dir = shift;

  opendir (DIR, $dir) or die $!;

  while (my $file = readdir(DIR)) {
      next if ($file =~ m/^\./);
      print <<IMG;
  <a href="$root/$me?img=$file">
  <img class="thumb-nail" alt="$file" src="/img/$file">
  </a>
IMG
  }

  closedir(DIR);
}
1;
