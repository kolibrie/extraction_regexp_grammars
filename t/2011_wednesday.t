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
        id => 3329,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3303,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3232,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3320,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3252,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3311,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3330,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3294,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3152,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3253,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3223,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3290,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3230,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3251,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3370,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3153,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3186,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3218,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3310,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3072,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3396,
        #title => '',
        #duration => 0,
        #presenter => methods(
        #    id => 0,
        #    name => '',
        #),
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
    <p> Talks in <b>bold type</b> have been confirmed by their respective speakers. </p>  <a href="/yn2011/schedule?day=2011-06-27">Monday</a>   |   <a href="/yn2011/schedule?day=2011-06-28">Tuesday</a>   |   <strong>Wednesday</strong>   |   <a href="/yn2011/schedule?day=2011-06-30">Thursday</a>   |   <a href="/yn2011/schedule?day=2011-07-01">Friday</a>       <h2>Wednesday, 29 June 2011</h2>
<table border="0">
<thead>
 <tr class="header">
  <th> Time </th>   <th colspan="1">Mt. Mitchell</th>    <th colspan="1">Mt. Roan</th>    <th colspan="1">Mt. Pisgah</th>    <th colspan="1">Mt. Pilot</th>    <th colspan="1">Magnolia</th>    <th colspan="1">Swannanoa</th>   </tr>
</thead>
<tbody>  <tr class="header">   <td align="center" valign="top" class="header">09:00</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/859">&lrm;Breakfast&lrm;</a> (60&nbsp;min)  <span id="starcount-859" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:00</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/1466">Robin Darby</a> - <a href="/yn2011/talk/3329">&lrm;Perl service-oriented architectures.&lrm;</a> (50&nbsp;min)  <span id="starcount-3329" style="white-space:nowrap"><span class="starcount">8</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r2"> <a href="/yn2011/user/6497">Duke Leto</a> - <a href="/yn2011/talk/3303"><b>&lrm;Visual Introduction to Parrot Virtual Machine&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3303" style="white-space:nowrap"><span class="starcount">7</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/2856">Jay Shirley (&lrm;jshirley&lrm;)</a> - <a href="/yn2011/talk/3232">&lrm;Building better applications with Data::Manager&lrm;</a> (50&nbsp;min)  <span id="starcount-3232" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1683">Kevin Falcone (&lrm;jibsheet&lrm;)</a> - <a href="/yn2011/talk/3320"><b>&lrm;Shipwright: Application Distribution Simplified&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3320" style="white-space:nowrap"><span class="starcount">20</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="5" class="r6"> <a href="/yn2011/event/856">&lrm;Hackathon&lrm;</a> (110&nbsp;min)  <span id="starcount-856" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="5" class="r7"> <a href="/yn2011/event/870">&lrm;Organizer's Room / Speaker's Lounge&lrm;</a> (110&nbsp;min)  <span id="starcount-870" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:50</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:00</td>    <td valign="top" rowspan="3" class="r1"> <a href="/yn2011/user/1797">Stevan Little (&lrm;stevan&lrm;)</a> - <a href="/yn2011/talk/3252"><b>&lrm;Jackalope&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3252" style="white-space:nowrap"><span class="starcount">20</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/3785">Christoph Otto (&lrm;cotto&lrm;)</a> - <a href="/yn2011/talk/3311"><b>&lrm;Parrot: State of the VM&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3311" style="white-space:nowrap"><span class="starcount">12</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/7134">Christoph Wild (&lrm;xtoph&lrm;)</a> - <a href="/yn2011/talk/3330"><b>&lrm;Twitter on SEN Openstage 60/80 using Perl Catalyst&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3330" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r4"> <a href="/yn2011/user/1695">Tatsuhiko Miyagawa (&lrm;miyagawa&lrm;)</a> - <a href="/yn2011/talk/3294">&lrm;Deploying Plack web applications&lrm;</a> (50&nbsp;min)  <span id="starcount-3294" style="white-space:nowrap"><span class="starcount">23</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:20</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:30</td>    <td valign="top"  class="r3"> <a href="/yn2011/user/6489">Jonathan Hogue</a> - <a href="/yn2011/talk/3152">&lrm;Using HTTP::Proxy to Monitor Web Site Performance&lrm;</a> (20&nbsp;min)  <span id="starcount-3152" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:50</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/851">&lrm;Lunch&lrm;</a> (90&nbsp;min)  <span id="starcount-851" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">13:20</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="2" class="r2"> <a href="/yn2011/user/6606">Solomon Foster</a> - <a href="/yn2011/talk/3253"><b>&lrm;Numerics in Perl 6&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3253" style="white-space:nowrap"><span class="starcount">5</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r6"> <a href="/yn2011/event/856">&lrm;Hackathon (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-856" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r7"> <a href="/yn2011/event/870">&lrm;Organizer's Room / Speaker's Lounge (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-870" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">13:50</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/6535">Kartik Thakore (&lrm;kthakore&lrm;)</a> - <a href="/yn2011/talk/3223"><b>&lrm;Super Laser Battles: Game Development in Perl&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3223" style="white-space:nowrap"><span class="starcount">11</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/1681">Jonathan Rockway (&lrm;jrockway&lrm;)</a> - <a href="/yn2011/talk/3290"><b>&lrm;Intro to ZeroMQ&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3290" style="white-space:nowrap"><span class="starcount">20</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/5225">Doug Bell (&lrm;preaction&lrm;)</a> - <a href="/yn2011/talk/3230"><b>&lrm;Testing with PSGI&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3230" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:10</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:20</td>    <td valign="top" rowspan="3" class="r1"> <a href="/yn2011/user/4828">Jesse Luehrs (&lrm;doy&lrm;)</a> - <a href="/yn2011/talk/3251"><b>&lrm;OX - The hardest working two letters in Perl&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3251" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r2"> <a href="/yn2011/user/5208">Devin Austin (&lrm;dhoss&lrm;)</a> - <a href="/yn2011/talk/3370"><b>&lrm;Presenting: Deimos&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3370" style="white-space:nowrap"><span class="starcount">1</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r3"> <a href="/yn2011/user/6351">Mark Allen</a> - <a href="/yn2011/talk/3153">&lrm;Intro to Dancer&lrm;</a> (50&nbsp;min)  <span id="starcount-3153" style="white-space:nowrap"><span class="starcount">8</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r4"> <a href="/yn2011/user/1677">Robert Blackwell (&lrm;rblackwe&lrm;)</a> - <a href="/yn2011/talk/3186">&lrm;Communicating with Perl and Arduino&lrm;</a> (50&nbsp;min)  <span id="starcount-3186" style="white-space:nowrap"><span class="starcount">12</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:40</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:50</td>    <td valign="top"  class="r2"> <a href="/yn2011/user/3941">Mateu Hunter</a> - <a href="/yn2011/talk/3218"><b>&lrm;Moose Weather&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3218" style="white-space:nowrap"><span class="starcount">4</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:10</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/845">&lrm;Break&lrm;</a> (30&nbsp;min)  <span id="starcount-845" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:40</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/1846">Matt S Trout (&lrm;mst&lrm;)</a> - <a href="/yn2011/talk/3310">&lrm;State of the Velociraptor&lrm;</a> (50&nbsp;min)  <span id="starcount-3310" style="white-space:nowrap"><span class="starcount">33</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r7"> <a href="/yn2011/event/870">&lrm;Organizer's Room / Speaker's Lounge (3)&lrm;</a> (170&nbsp;min)  <span id="starcount-870" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:40</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/232">R Geoffrey Avery (&lrm;rGeoffrey&lrm;)</a> - <a href="/yn2011/talk/3072"><b>&lrm;Lightning Talks Day 3&lrm;</b></a> (50&nbsp;min) [<a href="/yn2011/talks#139">Lightning</a>]  <span id="starcount-3072" style="white-space:nowrap"><span class="starcount">28</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:40</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/983">Chris Prather (&lrm;perigrin&lrm;)</a> - <a href="/yn2011/talk/3396"><b>&lrm;Closing&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3396" style="white-space:nowrap"><span class="starcount">22</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">18:00</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="2" class="r6"> <a href="/yn2011/event/873">&lrm;Available Space&lrm;</a> (360&nbsp;min)  <span id="starcount-873" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">18:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
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
