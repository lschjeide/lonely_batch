lonely_batch
============

Lonely Planet Coding Exercise

We have two (admittedly not very clean) .xml files from our legacy CMS system - taxonomy.xml holds the information about how destinations are related to each other and destinations.xml holds the actual text content for each destination.

We would like you to create a batch processor that takes these input files and produces an .html file (based on the output template given with this test) for each destination. Each generated web page must have:
1. Some destination text content. Use your own discretion to decide how much information to display on the destination page.
2. Navigation that allows the user to browse to destinations that are higher in the taxonomy. For example, Beijing should have a link to China.
3. Navigation that allows the user to browse to destinations that are lower in the taxonomy. For example, China should have a link to Beijing.

The batch processor should take the location of the two input files and the output directory as parameters.

These sample input files contain only a small subset of destinations.  We will test your software on the full Lonely Planet dataset, which currently consists of almost 30,000 destinations.

When we receive your project the code will be:
1. Built and run against the dataset supplied.
2. Evaluated based on coding style and design choices in all of these areas: 
a. Readability.
b. Simplicity.
c. Extensibility.
d. Reliability.
e. Performance.