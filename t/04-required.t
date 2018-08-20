use v6.c;
use Test;
use Trait::Env;

class TestClass {
    has $.attribute is env(:required);
}

subtest {
    temp %*ENV<ATTRIBUTE> = "Here";

    my $tc;
    ok $tc = TestClass.new(), "Test Class created OK";
    is $tc.attribute, "Here", "We have a test value";
       
}, "Env and required play well together";

subtest {
    %*ENV<ATTRIBUTE>:delete;
    
    my $tc;
    dies-ok { $tc = TestClass.new() }, "Test Class dies with missing required";
}, "Dies when required not set.";


done-testing;
