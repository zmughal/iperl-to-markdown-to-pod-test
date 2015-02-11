#!/usr/bin/env perl

use strict;
use warnings;

use Path::Class;
use JSON::MaybeXS;
use Markdown::Pod;
use HTML::FromANSI;

my $input = join '', <>; # read from STDIN
my $md2pod = Markdown::Pod->new;

my $nb = decode_json( $input );

my $pod_string;

for my $cell ( @{ $nb->{cells} } ) {
	if( $cell->{cell_type} eq 'markdown' ) {
		my $md = join '', @{ $cell->{source} };
		$pod_string .= $md2pod->markdown_to_pod( markdown => $md );
	} elsif( $cell->{cell_type} eq 'code' ) {
		my $code = join '', @{ $cell->{source} };

		# move it over 4 spaces for code
		$pod_string .= join '', map { s/^/    /r } @{ $cell->{source} };
		$pod_string .= "\n\n";

		my @outputs = @{ $cell->{outputs} };
		for my $output (@outputs) {
			my $data = $output->{data};
			if( exists $data->{"text/html"} ) {
				# HTML preferred
				$pod_string .= "=begin html\n\n";
				$pod_string .= join '', @{ $data->{"text/html"} };
				$pod_string .= "\n\n=end html\n\n";
			} elsif( exists $data->{"text/plain"} ) {
				$pod_string .= "=begin html\n\n";
				$pod_string .= ansi2html( join '', @{ $data->{"text/plain"} } );
				$pod_string .= "\n\n=end html\n\n";
			}
		}
	}

	$pod_string .= "\n\n";
}

print $pod_string; # write to STDOUT
