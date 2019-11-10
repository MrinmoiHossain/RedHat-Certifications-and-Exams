#!/bin/bash

# Variables
NEWUSERFILE=/tmp/support/newusers

# Loop
for ENTRY in $(cat $NEWUSERFILE); do
    # Extract first, last, and tier fields
    FIRSTNAME=$(echo $ENTRY | cut -d: -f1)
    LASTNAME=$(echo $ENTRY | cut -d: -f2)
    TIER=$(echo $ENTRY | cut -d: -f4)

    # Make account name
    FIRSTINITIAL=$(echo $FIRSTNAME | cut -c 1 | tr 'A-Z' 'a-z')
    LOWERLASTNAME=$(echo $LASTNAME | tr 'A-Z' 'a-z')

    ACCTNAME=$FIRSTINITIAL$LOWERLASTNAME

    # Create account
    useradd $ACCTNAME -c "$FIRSTNAME $LASTNAME"
done
