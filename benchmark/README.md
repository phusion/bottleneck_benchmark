Usage
----

Modify the `bench.rb` file to hit the endpoint you like. Make sure that `wrk` is on your path. Then run:

```bash
ruby bench.rb > bench_result 
```

To run the benchmark. Then there's a `wrk_parser.rb` you can use to print a pretty result:

```bash
ruby wrk_parser.rb bench_result
```

In this directory are also some results of the benchmarks executed for a Phusion blog article on resource bottlenecks.
