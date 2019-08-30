#!/usr/bin/perl 	 
use Template;

	 # some useful options (see below for full list)
	 my $config = {
	#     INCLUDE_PATH => ’/search/path’,  # or list ref
	    INCLUDE_PATH => "/root/chm_mk_v2/template_hhc/",  # or list ref
	     INTERPOLATE  => 1,		      # expand "$var" in plain text
	     POST_CHOMP	  => 1,		      # cleanup whitespace
	  # PRE_PROCESS  => ’header’,	      # prefix each template
	     EVAL_PERL	  => 1,		      # evaluate Perl code blocks
	 };
	@tmp=`find . |grep html\$`;
	@files=map{chomp; if (/html$/){s/^\.\///; s/\//\\/g;};$_} @tmp;
	 my $template = Template->new(\$config);

	 # define template variables for replacement
	 my $vars = {
	     files  => \@files,
	};

	my $input="HTML_HPP.tpl";

	 # process input template, substituting variables
	 $template->process(\*DATA, $vars,"HTML.hpp" )
	     || die $template->error();

__DATA__
[OPTIONS]
Auto Index=Yes
Binary TOC=No
Binary Index=Yes
Compatibility=1.1
Compiled file=HTML.chm
Contents file=HTML.hhc
Default topic=index.html
Error log file=ErrorLog.log
Index file=HTML.hhk
Title=HTML
Full-text search=Yes
Display compile progress=Yes
Display compile notes=Yes
Default window=main

[WINDOWS]
main=,"HTML.hhc","HTML.hhk","index.html","index.html",,,,,0x23520,222,0x1046,[10,10,780,560],0xB0000,,,,,,0

[FILES]
[% FOREACH  file IN files %] 
[% file %][% END %]
