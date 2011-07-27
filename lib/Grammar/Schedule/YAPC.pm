package Grammar::Schedule::YAPC; 

use Regexp::Grammars;

qr{
    <grammar: Grammar::Schedule::YAPC>

    <token: name>
      \w+ (?:(?:\.?<.ws>|\-|\'|ö) \w+)+

    <token: alias>
      (?:\w|-|\.|\&quot;)+

    <token: id>
      \d+

    <token: nbsp>
      \&nbsp;

}xms;

1;
