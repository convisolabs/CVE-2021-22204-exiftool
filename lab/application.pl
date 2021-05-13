#!/usr/bin/env perl

use strict;
use warnings;
use Mojo::URL;
use Mojo::File;
use Mojo::UserAgent;
use UUID::Tiny ":std";
use Mojolicious::Lite -signatures;
use Image::ExifTool qw(:Public);

get "/" => sub ($request) {
    my $endpoint = $request -> param("endpoint");

    if (($endpoint) && (length($endpoint) <= 100)) { 
        my $url = Mojo::URL -> new($endpoint);

        if ($url -> scheme()) {
            my $userAgent  = Mojo::UserAgent -> new();
            my $getContent = $userAgent -> insecure(1) -> get($endpoint) -> result();

            if ($getContent -> is_success()) {
                my $file = $getContent -> body();
                
                my $generate = create_uuid_as_string(UUID_V4);
                my $path = Mojo::File -> new("files/$generate");
                
                $path = $path -> spurt($file);

                my $exifTool     = Image::ExifTool -> new();
                my $informations = $exifTool -> ImageInfo("files/$generate");

                if ($informations) {
                    return ($request -> render ( 
                        json => [{ 
                                date => $informations -> {FileModifyDate},
                                mime => $informations -> {MIMEType},
                                type => $informations -> {FileType}
                        }]
                    ));
                }  
            }
        }
    }
    
    return ($request -> render (
        text => "<script>window.location='/?endpoint=https://www.cpan.org/misc/images/cpan.png'</script>"
    ));
};

app -> start();