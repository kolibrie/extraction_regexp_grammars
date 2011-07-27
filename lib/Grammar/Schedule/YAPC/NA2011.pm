package Grammar::Schedule::YAPC::NA2011; 

use Regexp::Grammars;
use Grammar::Schedule::YAPC;

qr{
    <grammar: Grammar::Schedule::YAPC::NA2011>
    <extends: Grammar::Schedule::YAPC>

    <objrule: Talk=talk>
      <presenter> -
      \<a href=\"/yn2011/talk/<id>\"\>
      (?:\<b\>)?
      <.lrm> <title> <.lrm>
      (?:\</b\>)?
      \</a\>
      <duration>

    <objrule: Presenter=presenter>
      \<a href=\"/yn2011/user/<id>\"\>
      <name>
      (?:\(\&lrm;<alias>\&lrm;\))?
      \</a\>

    <token: title>
      (?:. <!lrm>)+ .

    <token: duration>
      \( <MATCH= (\d+) > <.nbsp> min \)

    <token: lrm>
      \&lrm;

}xms;

1;
