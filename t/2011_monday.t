use 5.010;
use warnings;
use Test::More;
use Test::Deep;

use Regexp::Grammars;
use Grammar::Schedule::YAPC::NA2011;

{ package Talk;

    use Moose;

    has 'id'         => (is => 'rw', isa => 'Num');
    has 'title'      => (is => 'rw', isa => 'Str');
    has 'presenter'  => (is => 'rw', isa => 'Presenter');
    has 'duration'   => (is => 'rw', isa => 'Num');
    has 'attendance' => (is => 'rw', isa => 'Num');
}

{ package Presenter;

    use Moose;

    has 'name'  => (is => 'rw', isa => 'Str');
    has 'alias' => (is => 'rw', isa => 'Str');
    has 'id'    => (is => 'rw', isa => 'Num');
}

my $parser = qr{
    <logfile: extract.log>
    <extends: Grammar::Schedule::YAPC::NA2011>

    <talk>

}xms;

my @expected = (
    {
        id => 3227,
        title => 'Getting the most out of YAPC',
        duration => 20,
        presenter => methods(
            id => 1670,
            name => 'Yaakov',
        ),
    }, {
        id => 3398,
        title => 'Welcome',
        duration => 25,
        presenter => methods(
            id => 983,
            name => 'Chris Prather',
            alias => 'perigrin',
        ),
    }, {
        id => 3400,
        title => 'Keynote Address',
        duration => 50,
        presenter => methods(
            id => 273,
            name => 'Larry Wall',
            alias => 'TimToady',
        ),
    }, {
        id => 3399,
        title => 'Welcome II',
        duration => 5,
        presenter => methods(
            id => 983,
            name => 'Chris Prather',
            alias => 'perigrin',
        ),
    }, {
        id => 3070,
        title => 'Lightning Talks Day 1',
        duration => 50,
        presenter => methods(
            id => 232,
            name => 'R Geoffrey Avery',
            alias => 'rGeoffrey',
        ),
    }, {
        id => 3367,
        title => 'Perl Programming Best Practices 2011',
        duration => 50,
        presenter => methods(
            id => 5228,
            name => 'Jacinta Richardson',
            alias => 'jarich',
        ),
    }, {
        id => 3305,
        title => 'Pimp your Mac with Perl',
        duration => 20,
        presenter => methods(
            id => 295,
            name => 'Mark Fowler',
            alias => 'Trelane',
        ),
    }, {
        id => 3402,
        title => 'The Perl Foundation: Year in Review',
        duration => 20,
        presenter => methods(
            id => 302,
            name => 'Karen Pauley',
        ),
    }, {
        id => 3235,
        title => 'Introduction to Perl: Data Structures',
        duration => 20,
        presenter => methods(
            id => 1813,
            name => 'Bruce Gray',
            alias => 'Util',
        ),
    }, {
        id => 3342,
        title => 'Writing Plugins for Padre, the Perl IDE',
        duration => 20,
        presenter => methods(
            id => 263,
            name => 'Gabor Szabo',
            alias => 'szabgab',
        ),
    }, {
        id => 3217,
        title => 'How NOT to build a multi-million dollar eCommerce system',
        duration => 50,
        presenter => methods(
            id => 2163,
            name => 'Cory Watson',
            alias => 'gphat',
        ),
    }, {
        id => 3326,
        title => 'How To Run Japan Perl Association',
        duration => 50,
        presenter => methods(
            id => 2811,
            name => 'Daisuke Maki',
            alias => 'lestrrat',
        ),
    }, {
        id => 3238,
        title => 'Introduction to Perl: Regular Expressions',
        duration => 20,
        presenter => methods(
            id => 5130,
            name => 'Aran Deltac',
            alias => 'bluefeet',
        ),
    }, {
        id => 3364,
        title => 'Perl Helped Me Graduate',
        duration => 20,
        presenter => methods(
            id => 1881,
            name => 'Matt Nash',
            alias => 'mattnashbrowns',
        ),
    }, {
        id => 3236,
        title => 'Introduction to Perl: Getting Data In and Out',
        duration => 20,
        presenter => methods(
            id => 7097,
            name => 'Harish Jain',
        ),
    }, {
        id => 3099,
        title => 'Perl for PHP Developers',
        duration => 50,
        presenter => methods(
            id => 7024,
            name => 'Scott Mattocks',
        ),
    }, {
        id => 3323,
        title => 'Telecommuting. Or How to survive work without a water cooler.',
        duration => 50,
        presenter => methods(
            id => 4172,
            name => 'Sterling Hanenkamp',
            alias => 'zostay',
        ),
    }, {
        id => 3333,
        title => 'Open Source Software Projects and Organizations: Community Issues',
        duration => 20,
        presenter => methods(
            id => 1467,
            name => 'James E Keenan',
            alias => 'kid51',
        ),
    }, {
        id => 3240,
        title => 'Introduction to Perl: Documentation',
        duration => 20,
        presenter => methods(
            id => 7216,
            name => 'Mark A. Stratman',
            alias => 'mstratman',
        ),
    }, {
        id => 3302,
        title => 'Math::Primality - A Google Sumer of Code Adventure Story',
        duration => 20,
        presenter => methods(
            id => 7205,
            name => 'Bob Kuo',
        ),
    }, {
        id => 3241,
        title => 'Introduction to Perl: Testing',
        duration => 20,
        presenter => methods(
            id => 1660,
            name => 'G. Wade Johnson',
            alias => 'gwadej',
        ),
    }, {
        id => 3356,
        title => 'Practical Extraction with Regexp::Grammars',
        duration => 50,
        presenter => methods(
            id => 1613,
            name => 'Nathan Gray',
            alias => 'kolibrie',
        ),
    }, {
        id => 3354,
        title => 'The Business Aware Programmer',
        duration => 50,
        presenter => methods(
            id => 289,
            name => 'Abigail',
        ),
    }, {
        id => 3222,
        title => 'So, you want to run a Perl event?',
        duration => 50,
        presenter => methods(
            id => 1949,
            name => 'Dan Wright',
            alias => 'ehdonhon',
        ),
    }, {
        id => 3231,
        title => 'Introduction to CPAN: Useful Modules',
        duration => 20,
        presenter => methods(
            id => 1655,
            name => 'Michael Peters',
            alias => 'mpeters',
        ),
    }, {
        id => 3233,
        title => 'Introduction to CPAN: Creating and Uploading',
        duration => 20,
        presenter => methods(
            id => 5240,
            name => 'Len',
        ),
    },
);
my %expected = map { $_->{id} => $_ } @expected;
my @expected_order = map { $_->{id} } @expected;

plan tests => scalar(@expected) + 2;

my $source = do{ local $/; <DATA>};
chomp $source;
my $original_source = $source;

my @actual_order = ();
my $count = 0;
while ($source =~ /$parser/g) {
    $count++;
    my $result = $/{talk};
    push @actual_order, $result->id;

    if (exists($expected{$result->id})) {
        cmp_deeply(
            $result,
            methods(
                %{$expected{$result->id}},
            ),
            "talk " . $result->id,
        );
    }
}

is($count, scalar(@expected), 'number of matches found');
cmp_deeply(\@actual_order, \@expected_order, 'order of entries');

__DATA__
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<!-- Document Metadata -->
<meta http-equiv="Content-Language" content="en" />  <!-- JavaScript sugar -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script> 
<script type="text/javascript" charset="utf-8" src='http://github.com/aristus/sweet-justice/raw/master/sweet-justice.min.js'></script> 
<script src="/js/act.js"></script>


<!-- Atom news feed -->
<link rel="alternate" type="application/atom+xml" title="YAPC::NA 2011"
      href="http://www.yapc2011.us/yn2011/atom/en.xml" /><title>Schedule</title>
<!-- CSS Stylesheets -->
<link rel="stylesheet" type="text/css" href="/yn2011/css/style.css" />
<!-- Favorite icon -->
<link rel="shortcut icon" type="image/png" href="/favicon.png" />
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-939082-12']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>

<body>
    <div class="masthead"><h1><a href="/yn2011/">YAPC::NA 2011 &bull; Asheville, NC</a></h1></div>
    <div class="body">
        <div class="unit size2of3"><div class="content"> <!-- The schedule table --> <script type="text/javascript">
if (window.act) {
    var titles = [  'remove from personal schedule',  'add to personal schedule',  ];
    toggle_image = function(elem, talk_id, set) {
        var data = { img_name: set ? 'picked' : 'unpicked',
                     title:    titles[set ? 0 : 1 ],
                     talk_id:  talk_id,
                     set:      set
        };
        $(elem).replaceWith( act.template("tpl_mtbutton", data) );  $("#my-"+talk_id+"-text").replaceWith( act.template("tpl_mtlabel", data) );  };
    toggle_count = function(talk_id, set) {
        var elemcount = "#starcount-" + talk_id;
        $(elemcount).replaceWith(
            act.template("tpl_starcount",
                         { talk_id: talk_id,
                           count: (parseInt($(elemcount + " > .starcount").text()) || 0) + (set ? 1 : -1)
                         }
                        ));
    };
    toggle_talk = function(elem, talk_id, set) {
        $.post(act.make_uri('yn2011', 'updatemytalks_a'), {talk_id: talk_id} );
        toggle_image(elem, talk_id, !set);
        toggle_count(talk_id, !set);
    };
    $(function() {
        $(".mytalks_submit").remove();
        $(":checkbox").each(function() {
            toggle_image(this, $(this).val(), $(this).attr("checked"));
        });
    });
}
</script>

 <script type="text/html" id="tpl_mtbutton">
<img class="mtbutton" src="/images/<%=img_name%>.gif" title="<%=title%>"
     onClick ="toggle_talk(this,<%=talk_id%>,<%=set%>);" />
</script>

<script type="text/html" id="tpl_mtlabel">
<span id="my-<%=talk_id%>-text"><%=title%></span>
</script>

<script type="text/html" id="tpl_starcount">
<span id="starcount-<%=talk_id%>" style="white-space:nowrap"><% if (count) { %><span class="starcount"><%=count%></span><img style="vertical-align:middle" src="/images/picked.gif" /><% } %></span>
</script>
    <p> Talks in <b>bold type</b> have been confirmed by their respective speakers. </p>  <strong>Monday</strong>   |   <a href="/yn2011/schedule?day=2011-06-28">Tuesday</a>   |   <a href="/yn2011/schedule?day=2011-06-29">Wednesday</a>   |   <a href="/yn2011/schedule?day=2011-06-30">Thursday</a>   |   <a href="/yn2011/schedule?day=2011-07-01">Friday</a>       <h2>Monday, 27 June 2011</h2>
<table border="0">
<thead>
 <tr class="header">
  <th> Time </th>   <th colspan="1">Mt. Mitchell</th>    <th colspan="1">Mt. Roan</th>    <th colspan="1">Mt. Pisgah</th>    <th colspan="1">Mt. Pilot</th>    <th colspan="1">Magnolia</th>    <th colspan="1">Swannanoa</th>   </tr>
</thead>
<tbody>  <tr class="header">   <td align="center" valign="top" class="header">09:00</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/857">&lrm;Breakfast&lrm;</a> (30&nbsp;min)  <span id="starcount-857" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">09:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1670">Yaakov</a> - <a href="/yn2011/talk/3227">&lrm;Getting the most out of YAPC&lrm;</a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3227" style="white-space:nowrap"><span class="starcount">4</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="7" class="r7"> <a href="/yn2011/event/868">&lrm;Organizer's Room / Speaker's Lounge&lrm;</a> (175&nbsp;min)  <span id="starcount-868" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">09:50</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:00</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/983">Chris Prather (&lrm;perigrin&lrm;)</a> - <a href="/yn2011/talk/3398">&lrm;Welcome&lrm;</a> (25&nbsp;min)  <span id="starcount-3398" style="white-space:nowrap"><span class="starcount">20</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:25</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/273">Larry Wall (&lrm;TimToady&lrm;)</a> - <a href="/yn2011/talk/3400">&lrm;Keynote Address&lrm;</a> (50&nbsp;min)  <span id="starcount-3400" style="white-space:nowrap"><span class="starcount">20</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:15</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:30</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/983">Chris Prather (&lrm;perigrin&lrm;)</a> - <a href="/yn2011/talk/3399">&lrm;Welcome II&lrm;</a> (5&nbsp;min)  <span id="starcount-3399" style="white-space:nowrap"><span class="starcount">11</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:35</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/232">R Geoffrey Avery (&lrm;rGeoffrey&lrm;)</a> - <a href="/yn2011/talk/3070"><b>&lrm;Lightning Talks Day 1&lrm;</b></a> (50&nbsp;min) [<a href="/yn2011/talks#137">Lightning</a>]  <span id="starcount-3070" style="white-space:nowrap"><span class="starcount">25</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">12:25</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/848">&lrm;Lunch&lrm;</a> (90&nbsp;min)  <span id="starcount-848" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">13:55</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="2" class="r2"> <a href="/yn2011/user/5228">Jacinta Richardson (&lrm;jarich&lrm;)</a> - <a href="/yn2011/talk/3367"><b>&lrm;Perl Programming Best Practices 2011&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3367" style="white-space:nowrap"><span class="starcount">19</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r7"> <a href="/yn2011/event/868">&lrm;Organizer's Room / Speaker's Lounge (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-868" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:25</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/295">Mark Fowler (&lrm;Trelane&lrm;)</a> - <a href="/yn2011/talk/3305"><b>&lrm;Pimp your Mac with Perl&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3305" style="white-space:nowrap"><span class="starcount">7</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/302">Karen Pauley</a> - <a href="/yn2011/talk/3402"><b>&lrm;The Perl Foundation: Year in Review&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3402" style="white-space:nowrap"><span class="starcount">7</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1813">Bruce Gray (&lrm;Util&lrm;)</a> - <a href="/yn2011/talk/3235"><b>&lrm;Introduction to Perl: Data Structures&lrm;</b></a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3235" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="5" class="r6"> <a href="/yn2011/event/846">&lrm;Hackathon&lrm;</a> (80&nbsp;min)  <span id="starcount-846" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:45</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:55</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/263">Gabor Szabo (&lrm;szabgab&lrm;)</a> - <a href="/yn2011/talk/3342">&lrm;Writing Plugins for Padre, the Perl IDE&lrm;</a> (20&nbsp;min)  <span id="starcount-3342" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/2163">Cory Watson (&lrm;gphat&lrm;)</a> - <a href="/yn2011/talk/3217"><b>&lrm;How NOT to build a multi-million dollar eCommerce system&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3217" style="white-space:nowrap"><span class="starcount">31</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r3"> <a href="/yn2011/user/2811">Daisuke Maki (&lrm;lestrrat&lrm;)</a> - <a href="/yn2011/talk/3326">&lrm;How To Run Japan Perl Association&lrm;</a> (50&nbsp;min)  <span id="starcount-3326" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/5130">Aran Deltac (&lrm;bluefeet&lrm;)</a> - <a href="/yn2011/talk/3238"><b>&lrm;Introduction to Perl: Regular Expressions&lrm;</b></a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3238" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:15</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:25</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/1881">Matt Nash (&lrm;mattnashbrowns&lrm;)</a> - <a href="/yn2011/talk/3364"><b>&lrm;Perl Helped Me Graduate&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3364" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/7097">Harish Jain</a> - <a href="/yn2011/talk/3236">&lrm;Introduction to Perl: Getting Data In and Out&lrm;</a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3236" style="white-space:nowrap"><span class="starcount">1</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:45</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/847">&lrm;Break&lrm;</a> (30&nbsp;min)  <span id="starcount-847" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:15</td>    <td valign="top" rowspan="3" class="r1"> <a href="/yn2011/user/7024">Scott Mattocks</a> - <a href="/yn2011/talk/3099"><b>&lrm;Perl for PHP Developers&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3099" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/4172">Sterling Hanenkamp (&lrm;zostay&lrm;)</a> - <a href="/yn2011/talk/3323"><b>&lrm;Telecommuting. Or How to survive work without a water cooler.&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3323" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/1467">James E Keenan (&lrm;kid51&lrm;)</a> - <a href="/yn2011/talk/3333"><b>&lrm;Open Source Software Projects and Organizations: Community Issues&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3333" style="white-space:nowrap"><span class="starcount">9</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/7216">Mark A. Stratman (&lrm;mstratman&lrm;)</a> - <a href="/yn2011/talk/3240"><b>&lrm;Introduction to Perl: Documentation&lrm;</b></a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3240" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="7" class="r6"> <a href="/yn2011/event/846">&lrm;Hackathon (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-846" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="7" class="r7"> <a href="/yn2011/event/868">&lrm;Organizer's Room / Speaker's Lounge (3)&lrm;</a> (110&nbsp;min)  <span id="starcount-868" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:35</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:45</td>    <td valign="top"  class="r3"> <a href="/yn2011/user/7205">Bob Kuo</a> - <a href="/yn2011/talk/3302"><b>&lrm;Math::Primality - A Google Sumer of Code Adventure Story&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3302" style="white-space:nowrap"><span class="starcount">6</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1660">G. Wade Johnson (&lrm;gwadej&lrm;)</a> - <a href="/yn2011/talk/3241"><b>&lrm;Introduction to Perl: Testing&lrm;</b></a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3241" style="white-space:nowrap"><span class="starcount">5</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:05</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:15</td>    <td valign="top" rowspan="3" class="r1"> <a href="/yn2011/user/1613">Nathan Gray (&lrm;kolibrie&lrm;)</a> - <a href="/yn2011/talk/3356"><b>&lrm;Practical Extraction with Regexp::Grammars&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3356" style="white-space:nowrap"><span class="starcount">9</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/289">Abigail</a> - <a href="/yn2011/talk/3354">&lrm;The Business Aware Programmer&lrm;</a> (50&nbsp;min)  <span id="starcount-3354" style="white-space:nowrap"><span class="starcount">12</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r3"> <a href="/yn2011/user/1949">Dan Wright (&lrm;ehdonhon&lrm;)</a> - <a href="/yn2011/talk/3222"><b>&lrm;So, you want to run a Perl event?&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3222" style="white-space:nowrap"><span class="starcount">6</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1655">Michael Peters (&lrm;mpeters&lrm;)</a> - <a href="/yn2011/talk/3231">&lrm;Introduction to CPAN: Useful Modules&lrm;</a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3231" style="white-space:nowrap"><span class="starcount">1</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:35</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:45</td>    <td valign="top"  class="r4"> <a href="/yn2011/user/5240">Len</a> - <a href="/yn2011/talk/3233">&lrm;Introduction to CPAN: Creating and Uploading&lrm;</a> (20&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3233" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">18:05</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/854">&lrm;Reception&lrm;</a> (120&nbsp;min)  <span id="starcount-854" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">20:05</td>    <td valign="top" rowspan="2" class="r1"> <a href="/yn2011/event/849">&lrm;Conference Dinner&lrm;</a> (180&nbsp;min)  <span id="starcount-849" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="3" class="r6"> <a href="/yn2011/event/875">&lrm;Available Space&lrm;</a> (235&nbsp;min)  <span id="starcount-875" style="white-space:nowrap"></span>
     </td>    <td valign="top"  class="r7"> <a href="/yn2011/event/868">&lrm;Organizer's Room / Speaker's Lounge (4)&lrm;</a> (5&nbsp;min)  <span id="starcount-868" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">20:10</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">23:05</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">00:00</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  </tbody>
</table>     </div></div>
        <div class="menu unit lastUnit"><!-- user menu -->  <h2> Register </h2>
 <li> <a href="/yn2011/main">Log in</a> </li>
  <li> <a href="/yn2011/register">New user</a> </li>
     <h2> Conference </h2>
<li> <a href="/yn2011/sponsorship.html">Call for Sponsors</a></li>
<li> <a href="/yn2011/training.html">Call for Trainers</a></li>
<li> <a href="/yn2011/bof.html">Call for BoFs</a> </li>
<li> <a href="/yn2011/venue.html">Venue</a></li>
<li> <a href="/yn2011/news">News</a> </li>
<li> <a href="/yn2011/wiki">Wiki</a> </li>
 <!-- users menu --> <h2> Users </h2>
 <li> <a href="/yn2011/search"> Search </a> </li>
 <li> <a href="/yn2011/stats"> Statistics </a> </li>
   <!-- talks menu --> <h2> <a href="/yn2011/talks"> Presentations </a> </h2>
 <li> <a href="/yn2011/favtalks"> Favorite Talks </a> </li>
   <li> <a href="/yn2011/schedule"> Schedule </a> </li>
 <li> <a href="/yn2011/timetable.ics"> iCal export </a> </li>
         <!-- money menu -->   <!-- admin menu -->   <h2> Sponsors </h2>
<li> <a href="http://cpanel.net"><img src="/yn2011/img/cpanel.jpg"/></a></li> 
<li> <a href="http://booking.com"><img src="/yn2011/img/booking.png"/></a></li> 
<li> <a href="http://www.grantstreet.com/"><img src="/yn2011/img/grantstreetgroup.png"/></a></li> 
<li> <a href="http://www.activestate.com/"><img src="/yn2011/img/activestate.png"/></a></li> 
<li> <a href="http://www.magazines.com/"><img src="/yn2011/img/mags_dot_com.png"/></a></li> 
<li> <a href="http://tamarou.com"><img src="/yn2011/img/tamarou.png"/></a></li>
<li> <a href="http://www.shadowcat.co.uk/"><img src="/yn2011/img/shadowcat.png"/></a></li>
<li> <a href="http://www.dyn.com/"><img src="/yn2011/img/dyn.png"/></a></li>
  <h2> <a href="http://act.mongueurs.net/conferences.html">Other conferences</a> </h2>
  <li><a href="http://conferences.yapceurope.org/npw2011/">Nordic Perl Workshop 2011</a></li>
  <li><a href="http://journeesperl.fr/2011/">French Perl Workshop 2011</a></li>
  <li><a href="http://conference.perlchina.org/bjpw2011/">Beijing Perl Workshop</a></li>
  <li><a href="http://yapceurope.lv/ye2011/">YAPC::Europe 2011</a></li>
  <li><a href="http://conferences.yapceurope.org/ipw2011/">Italian Perl Workshop 2011</a></li>
  <li><a href="http://pghpw.org/ppw2011/">Pittsburgh Perl Workshop 2011</a></li>
    <div class="footer"> 
<p> 
    <a href="colophon.html">Colophon</a><br/>
    Site Design by <a href="http://tamarou.com">Tamarou</a> &bull; Image by <a rel="cc:attributionURL" href="http://www.flickr.com/photos/lhutton/4743800369/">Leander Hutton</a> <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/2.0/">CC BY-NC-SA 2.0</a> 
    &bull; Copyright &copy; <a href="http://dahut.pm.org">Dahut.pm</a> &bull; Powered by <a href="http://act.mongueurs.net/">Act</a>
</p> 
</div></div>
    </div>
</body>
</html> 
