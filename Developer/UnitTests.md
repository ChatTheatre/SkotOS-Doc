# Unit Tests and Continuous Integration

Historically SkotOS hasn't really had unit tests. SkotOS used to run as a persistent server, and it's not entirely clear how tests should work or what they should do in that case. And what if your test changes something it shouldn't?

With cold-bootable SkotOS, that world changes and unit tests suddenly make more sense.

## Unit Tests

Under SkotOS/test, you can find some test directories. The intent is to keep expanding them.

## GitHub Actions

Under SkotOS/.github/workflows you can find simple Continuous Integration based on GitHub Actions. These are fairly slow, with fairly elaborate setup - SkotOS has a lot of moving pieces, and it's important for CI to test from a clean cold-boot, which means compiling everything, every time. That's a 5-10 minute process as of April 2021.

In addition to testing compilation, the workflow runs some other tests. We'll keep adding more!

## DGD Testing

There's an empty skoot/usr/AutoTester object as a proof-of-concept for DGD testing. Nothing interesting there.

## Telnet and Wiztool Tests

Under SkotOS/test/telnet_wiztool you can find telnet tests that log in via Wiztool and run DGD code. These are mostly quite simple. They act basically like a human, using the wiztool to type commands. This can be useful for querying DGD's internal state using the code command.

## Metrics

Under skoot/usr/System/sys/metricsd.c, there is a Metrics object, designed to track a small number of numeric quantities and how often they change. You can use these for testing. For instance, metricsd tracks the number of SysLogD error and critical messages that have occurred since boot-up. That allows you to verify that boot-up was clean. It also allows you to check before and after an action to see if that action caused any SysLogD errors.

