#
# this script extracts technical metadata from a wav file and saves results as STATS.txt
# this script must be in the same folder as sox


#! usr/local/bin/perl
use Tkx;
use LWP::Simple;

# SETUP
    											
# frame objects
my $fa;
my $fb;
# label objects
my $la;
my $lb;
# button objects
my $ba;
my $bb;


#-------------------------------------------------
# convert button sub routine

sub chooseFile {
$url = Tkx::tk___getOpenFile();
$bb->configure( -state => 'active');
} 

#-------------------------------------------------
# Convert
sub runSOX {

$q = '"';
$file = $q . $url . $q;

$output = $q . 'C:\OUTPUT\STATS.txt' . $q;

system("sox $file -n stat 2> $output");

}

#-------------------------------------------------

# GUI elements
# main window
my $mw = Tkx::widget->new(".");
$mw->g_wm_title("Audio Stats");
$mw->g_wm_minsize(300, 130);

# frame a
$fa = $mw->new_frame(
-relief => 'solid',
-borderwidth => 1,
-background => 'light gray',
);
$fa->g_pack( -side => 'top', -fill => 'both' );

$la = $fa->new_label(
-text => 'Choose File to Scan:',
-font => 'bold',
-bg => 'light gray',
-foreground => 'black',
);
$la->g_pack( -side => 'top', -fill => 'both' );

$lb = $fa->new_label(
-bg => 'blue',
-foreground => 'cyan',
-width => 35,
-textvariable => \$url,
);
$lb->g_pack( -side => 'top' );

$ba = $fa->new_button(
-text => 'Choose',
-command => \&chooseFile,
-height => 1,
-width => 15,
);
$ba->g_pack( -side => 'top', -pady => 5 );


# frame b
$fb = $mw->new_frame(
-relief => 'solid',
-borderwidth => 1,
-background => 'light gray',
);
$fb->g_pack( -side => 'top', -fill => 'both' );

$bb = $fb->new_button(
-text => 'RUN',
-font => 'bold',
-command => \&runSOX,
-state => 'disabled',
-height => 2,
-width => 15,
);
$bb->g_pack( -side => 'bottom', -pady => 10 );


Tkx::MainLoop();
