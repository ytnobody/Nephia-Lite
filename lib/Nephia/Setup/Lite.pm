package Nephia::Setup::Lite;
use strict;
use warnings;

use parent qw/Nephia::Setup::Base/;

sub create {
    my $self = shift;

    $self->mkpath($self->approot);

    $self->psgi_file;
    $self->cpanfile;
    $self->gitignore_file;
}

1;

__DATA__

psgi_file
---
use strict;
use warnings;
use utf8;

use Nephia::Lite;

run {
    return {
        title    => "$appname",
    };
};

__DATA__
<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" href="/static/favicon.ico" />
  <title><?= $title ?> - powerd by Nephia::Lite</title>
  <style type="text/css">
    body {
        text-align: center;
        background: #f7f7f7;
        color: #666;
        padding: 0px;
        margin: 0px;
    }

    h1,h2,h3,h4,h5 {
        color: #333;
        border-left: 10px solid #AD3140;
        font-weight: 100;
        padding: 4px 7px;
    }

    a {
        color: #36c;
    }

    div.title {
        text-align: justify;
        width: 100%;
        margin: 0px;
        padding: 0px;
        background-color: #AD3140;
        border-bottom: 2px solid #fff;
        color: #f7f7f7;
    }

    span.title-label {
        font-weight: 100;
        font-size: 1.4em;
        margin: 0px 10px;
    }

    div.content {
        text-align: justify;
        background-color: #fff;
        width: 80%;
        margin: 20px auto;
        padding: 10px 30px;
        border-radius: 4px;
        border: 2px solid #eee;
    }

    pre {
        line-height: 1.2em;
        padding: 10px 2px;
        background-color: #f5f5f5;
        border-radius: 4px;
        border: 1px solid #eee;
        text-shadow:none;
        color: #111;
    }

    address.generated-by {
        width: 80%;
        padding: 0px 30px;
        margin: auto;
        margin-top: 20px;
        text-align: right;
        font-style: normal;
    }
  </style>
</head>
<body>
  <div class="title">
    <span class="title-label"><?= $title ?></span>
  </div>

  <div class="content">
    <h2>Hello, Nephia::Lite world!</h2>
    <p>Nephia::Lite is a mini and onefile web-application framework.</p>
    <pre>
    ### app.psgi
    use Nephia::Lite;

    # JSON responce sample
    run {
        my $req = shift;

        return {
            title    => "$appname",
        };
    };
    # Don't write "__DATA__" and template

    </pre>
    <h2>See also</h2>
    <ul>
      <li><a href="https://metacpan.org/module/Nephia/Lite">Read the documentation</a></li>
    </ul>
  </div>

  <address class="generated-by">Generated by Nephia</address>
</body>
</html>

===

cpanfile
---
requires 'Nephia'        => '0';
requires 'Nephia::Lite'  => '0';
requires 'Config::Micro' => '0';

on test => sub {
    requires 'Test::More', '0.98';
};


