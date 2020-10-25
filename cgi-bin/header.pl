sub header() {
  my $title = shift;
  my $subtitle = shift;
  my $header = <<"END_MESSAGE";
<h1 id="title">$title</h1>
<h5 id="subtitle">$subtitle</h5>
<div class="nav">
  <a class="nav-link">Home</a>
  <a class="nav-link">Photos</a>
  <a class="nav-link">Papers</a>
</div>
END_MESSAGE

  return $header;
}

1;
