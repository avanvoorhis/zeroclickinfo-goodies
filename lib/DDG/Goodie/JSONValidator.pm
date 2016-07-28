package DDG::Goodie::JSONValidator;
# ABSTRACT: An Interactive JSON Validation Tool

use DDG::Goodie;
use strict;
use warnings;

zci answer_type => 'jsonvalidator';

zci is_cached => 1;

triggers any => share('triggers.txt')->slurp;

handle remainder => sub {

    # Return unless the remainder is empty or contains online or tool
    return unless ( $_ =~ /(^$|online|tool)/i );

    return '',
        structured_answer => {

            id => "json_validator",

            data => {
                title => 'JSON Validator',
                subtitle => 'Enter JSON below, then click the button to check if it\'s valid or not'
            },

            templates => {
                group => 'text',
                item => 0,
                options => {
                    content => 'DDH.jsonvalidator.content'
                }
            }
        };
};

1;
