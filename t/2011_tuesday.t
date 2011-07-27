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
        id => 3250,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3226,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3338,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3161,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3197,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3334,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3292,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3224,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3289,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3318,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3296,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3208,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3150,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3144,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3321,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3074,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3365,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3337,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3358,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3165,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3351,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3366,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3319,
        #title => '',
        #duration => 0,
        #speaker => methods(
        #    id => 0,
        #    name => '',
        #),
    }, {
        id => 3071,
        #title => '',
        #duration => 0,
        #speaker => methods(
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
    <p> Talks in <b>bold type</b> have been confirmed by their respective speakers. </p>  <a href="/yn2011/schedule?day=2011-06-27">Monday</a>   |   <strong>Tuesday</strong>   |   <a href="/yn2011/schedule?day=2011-06-29">Wednesday</a>   |   <a href="/yn2011/schedule?day=2011-06-30">Thursday</a>   |   <a href="/yn2011/schedule?day=2011-07-01">Friday</a>       <h2>Tuesday, 28 June 2011</h2>
<table border="0">
<thead>
 <tr class="header">
  <th> Time </th>   <th colspan="1">Mt. Mitchell</th>    <th colspan="1">Mt. Roan</th>    <th colspan="1">Mt. Pisgah</th>    <th colspan="1">Mt. Pilot</th>    <th colspan="1">Magnolia</th>    <th colspan="1">Swannanoa</th>   </tr>
</thead>
<tbody>  <tr class="header">   <td align="center" valign="top" class="header">09:00</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/858">&lrm;Breakfast&lrm;</a> (60&nbsp;min)  <span id="starcount-858" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:00</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/1505">Steven Lembark</a> - <a href="/yn2011/talk/3250">&lrm;Lazyness is a Virtue &amp; Static is Your Friend&lrm;</a> (20&nbsp;min)  <span id="starcount-3250" style="white-space:nowrap"><span class="starcount">4</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/1634">Ricardo Signes (&lrm;rjbs&lrm;)</a> - <a href="/yn2011/talk/3226">&lrm;Perl 5.14 for Pragmatists&lrm;</a> (50&nbsp;min)  <span id="starcount-3226" style="white-space:nowrap"><span class="starcount">26</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r3"> <a href="/yn2011/user/2931">Ingy döt Net (&lrm;ingy&lrm;)</a> - <a href="/yn2011/talk/3338"><b>&lrm;Cog - A Thoughtful Application Framework&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3338" style="white-space:nowrap"><span class="starcount">6</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="5" class="r4"> <a href="/yn2011/user/1679">Dave Rolsky (&lrm;autarch&lrm;)</a> - <a href="/yn2011/talk/3161"><b>&lrm;Introduction to Object-Oriented Programming&lrm;</b></a> (110&nbsp;min) [<a href="/yn2011/talks#140">Beginner</a>]  <span id="starcount-3161" style="white-space:nowrap"><span class="starcount">6</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="5" class="r6"> <a href="/yn2011/event/855">&lrm;Hackathon&lrm;</a> (110&nbsp;min)  <span id="starcount-855" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="5" class="r7"> <a href="/yn2011/event/869">&lrm;Organizer's Room / Speaker's Lounge&lrm;</a> (110&nbsp;min)  <span id="starcount-869" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:20</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:30</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/2245">Shawn Moore (&lrm;Sartak&lrm;)</a> - <a href="/yn2011/talk/3197"><b>&lrm;Announcing Announcements&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3197" style="white-space:nowrap"><span class="starcount">8</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">10:50</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:00</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/1650">Brock Wilcox (&lrm;awwaiid&lrm;)</a> - <a href="/yn2011/talk/3334"><b>&lrm;POE/Reflex vs Coro/AnyEvent&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3334" style="white-space:nowrap"><span class="starcount">13</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r2"> <a href="/yn2011/user/540">Jesse Vincent</a> - <a href="/yn2011/talk/3292"><b>&lrm;Perl 5.16 and Beyond&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3292" style="white-space:nowrap"><span class="starcount">15</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/1061">Piers Cawley (&lrm;pdcawley&lrm;)</a> - <a href="/yn2011/talk/3224">&lrm;Axes, Maths, Theremins and Other Tools for Change&lrm;</a> (50&nbsp;min)  <span id="starcount-3224" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">11:50</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/850">&lrm;Lunch&lrm;</a> (90&nbsp;min)  <span id="starcount-850" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">13:20</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="2" class="r2"> <a href="/yn2011/user/4307">Reini Urban (&lrm;rurban&lrm;)</a> - <a href="/yn2011/talk/3289"><b>&lrm;use types;&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3289" style="white-space:nowrap"><span class="starcount">18</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r6"> <a href="/yn2011/event/855">&lrm;Hackathon (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-855" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="6" class="r7"> <a href="/yn2011/event/869">&lrm;Organizer's Room / Speaker's Lounge (2)&lrm;</a> (110&nbsp;min)  <span id="starcount-869" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">13:50</td>    <td valign="top" rowspan="5" class="r1"> <a href="/yn2011/user/3641">Stephen Scaffidi (&lrm;Hercynium&lrm;)</a> - <a href="/yn2011/talk/3318">&lrm;Practical AnyEvent&lrm;</a> (80&nbsp;min)  <span id="starcount-3318" style="white-space:nowrap"><span class="starcount">16</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/2905">Uwe Voelker (&lrm;Perl-Uwe.com&lrm;)</a> - <a href="/yn2011/talk/3296"><b>&lrm;Sanitizing HTML 5 with Perl 5&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3296" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/4781">Mark Prather</a> - <a href="/yn2011/talk/3208"><b>&lrm;Marketing Perl&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3208" style="white-space:nowrap"><span class="starcount">9</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:10</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:20</td>    <td valign="top"  class="r2"> <a href="/yn2011/user/5427">Chas. Owens</a> - <a href="/yn2011/talk/3150">&lrm;Secret Operators: What happens when you treat operators like German.&lrm;</a> (20&nbsp;min)  <span id="starcount-3150" style="white-space:nowrap"><span class="starcount">3</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r3"> <a href="/yn2011/user/2190">JT Smith</a> - <a href="/yn2011/talk/3144"><b>&lrm;The Game Crafter, A Perl Success Story&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3144" style="white-space:nowrap"><span class="starcount">4</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r4"> <a href="/yn2011/user/1959">chromatic</a> - <a href="/yn2011/talk/3321"><b>&lrm;Modern Advocacy for Modern Perl&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3321" style="white-space:nowrap"><span class="starcount">23</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:40</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">14:50</td>    <td valign="top"  class="r2"> <a href="/yn2011/user/5140">Arthur Schmidt (&lrm;fREW&lrm;)</a> - <a href="/yn2011/talk/3074"><b>&lrm;DBIx::Class::Shadow&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3074" style="white-space:nowrap"><span class="starcount">11</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:10</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/852">&lrm;Break&lrm;</a> (30&nbsp;min)  <span id="starcount-852" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">15:40</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/6455">Rocco Caputo (&lrm;rcaputo&lrm;)</a> - <a href="/yn2011/talk/3365"><b>&lrm;Reflex - How Does it Work?! (extended dance mix)&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3365" style="white-space:nowrap"><span class="starcount">11</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r2"> <a href="/yn2011/user/159">Chip Salzenberg (&lrm;chip&lrm;)</a> - <a href="/yn2011/talk/3337">&lrm;A Million-Player Game Server in Event-Driven Perl&lrm;</a> (80&nbsp;min)  <span id="starcount-3337" style="white-space:nowrap"><span class="starcount">19</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/1691">Walt Mankowski (&lrm;waltman&lrm;)</a> - <a href="/yn2011/talk/3358"><b>&lrm;Essential One-Liners&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3358" style="white-space:nowrap"><span class="starcount">1</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/1674">Brad Lhotsky</a> - <a href="/yn2011/talk/3165"><b>&lrm;InfoSec: The Advanced Persistent Adversary and You&lrm;</b></a> (50&nbsp;min)  <span id="starcount-3165" style="white-space:nowrap"><span class="starcount">14</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top" rowspan="3" class="r6"> <a href="/yn2011/event/855">&lrm;Hackathon (3)&lrm;</a> (80&nbsp;min)  <span id="starcount-855" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="3" class="r7"> <a href="/yn2011/event/869">&lrm;Organizer's Room / Speaker's Lounge (3)&lrm;</a> (80&nbsp;min)  <span id="starcount-869" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">16:40</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/3938">Josh Rabinowitz (&lrm;&quot;joshr&quot;&lrm;)</a> - <a href="/yn2011/talk/3351"><b>&lrm;Discovering Content Gaps&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3351" style="white-space:nowrap"><span class="starcount">2</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r3"> <a href="/yn2011/user/5149">Nick Patch (&lrm;patch&lrm;)</a> - <a href="/yn2011/talk/3366"><b>&lrm;Command Line Processing with Getopt&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3366" style="white-space:nowrap"><span class="starcount">7</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  class="r4"> <a href="/yn2011/user/2244">Jason May (&lrm;jasonmay&lrm;)</a> - <a href="/yn2011/talk/3319"><b>&lrm;Broadcasting your Programming&lrm;</b></a> (20&nbsp;min)  <span id="starcount-3319" style="white-space:nowrap"><span class="starcount">8</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:00</td>    <td valign="top"  class="out" colspan="6"> <a href="/yn2011/event/853">&lrm;Break&lrm;</a> (30&nbsp;min)  <span id="starcount-853" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">17:30</td>    <td valign="top"  class="r1"> <a href="/yn2011/user/232">R Geoffrey Avery (&lrm;rGeoffrey&lrm;)</a> - <a href="/yn2011/talk/3071"><b>&lrm;Lightning Talks Day 2&lrm;</b></a> (50&nbsp;min) [<a href="/yn2011/talks#138">Lightning</a>]  <span id="starcount-3071" style="white-space:nowrap"><span class="starcount">28</span><img style="vertical-align:middle" src="/images/picked.gif" /></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top" rowspan="2" class="r7"> <a href="/yn2011/event/869">&lrm;Organizer's Room / Speaker's Lounge (4)&lrm;</a> (60&nbsp;min)  <span id="starcount-869" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">18:20</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>   </tr>  <tr class="header">   <td align="center" valign="top" class="header">18:30</td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  >   <span id="starcount-" style="white-space:nowrap"></span>
     </td>    <td valign="top"  class="r6"> <a href="/yn2011/event/877">&lrm;Parrot/Perl6 BOF&lrm;</a> (330&nbsp;min)  <span id="starcount-877" style="white-space:nowrap"></span>
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
