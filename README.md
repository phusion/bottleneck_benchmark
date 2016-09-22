Resource bottlenecks
====================

This Rails application has a `benchmark_controller` with three actions, `cpu`, `io` and `cpu_and_io`. They can be hit with an http `POST` to the corresponding `benchmarks/<action>` route.

In the `benchmark` directory there are scripts for executing benchmarks.
