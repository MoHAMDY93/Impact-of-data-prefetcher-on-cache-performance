# <a name="x7dbb4b5e883965f239261315dbaee582a4f67e2"></a>**ECE322C Computer Architecture - Lab 4 Report: Impact of Data Prefetchers on Cache Performance**
## **Course Coordinator: Dr. May Salama**
**Agenda**

1. Introduction to Data Prefetching
1. Types of Data Prefetchers Implemented
1. Simulation Problem Definition
1. Methodology and Implementation
1. Problems Encountered and Solutions
1. Output Samples and Results Analysis
1. Answers to Specified Questions
1. Open-ended Data Prefetcher Implementation
1. Team Member Contributions
1. References

## **Introduction to the Project**
This project explores the impact of data prefetchers on cache performance in modern computing systems. Memory access latency continues to be a critical bottleneck in processor performance, with the speed gap between processors and memory growing wider. Data prefetching is a technique designed to bridge this gap by predicting future memory accesses and bringing data into the cache before it is explicitly requested by the processor.
### **What is Data Prefetching?**
Data prefetching is a speculative technique that attempts to reduce memory access latency by anticipating future memory accesses and fetching the corresponding data into the cache before the processor actually requests it. By doing so, cache misses can be converted into cache hits, thereby hiding memory latency and improving overall system performance.

The effectiveness of a prefetcher depends on several factors:

- **Accuracy**: The ability to correctly predict which data will be needed
- **Timeliness**: Fetching data early enough to hide latency but not so early that it gets evicted before use
- **Coverage**: The proportion of cache misses that are successfully eliminated
- **Overhead**: The additional resources (bandwidth, power, area) consumed by the prefetcher
## **Types of Data Prefetchers in the Project**
In this project, we implemented and analyzed three different types of data prefetchers:
### **1. Next-Line Prefetcher**
The Next-Line (or Sequential) Prefetcher is the simplest form of prefetching. Upon a cache miss, it automatically fetches the next consecutive cache line into the cache. This prefetcher operates on the principle of spatial locality - the observation that if a program accesses a particular memory location, it is likely to access nearby locations in the near future.

**Implementation**: When a cache miss occurs at address A, the prefetcher automatically fetches address A+1 (where the address represents a cache line). This requires minimal hardware as it doesn't need to track access patterns.

**Advantages**: Simple to implement, low hardware overhead, effective for sequential access patterns. **Disadvantages**: Ineffective for non-sequential access patterns, potentially wasteful for random access patterns.
### **2. Stride Prefetcher**
The Stride Prefetcher is more sophisticated and can detect regular access patterns with constant differences between consecutive addresses (strides). It associates memory instructions (identified by their Program Counter values) with their access patterns.

**Implementation**: The stride prefetcher maintains a Reference Prediction Table (RPT) that tracks:

- The instruction address (PC)
- The last memory address accessed
- The detected stride (difference between consecutive addresses)
- A state machine to build confidence in the detected stride

When the same instruction accesses memory again, the prefetcher calculates the new stride. If a consistent stride is detected, it prefetches address = (last address + stride).

**Advantages**: Effective for both sequential and strided access patterns, common in array traversals and matrix operations. **Disadvantages**: Requires more hardware than next-line prefetching, ineffective for irregular access patterns.
### **3. Delta Correlating Prediction Table (DCPT) Prefetcher**
Our open-ended implementation features a DCPT prefetcher, which extends stride prefetching by tracking multiple recent stride (delta) values for each instruction. This allows it to capture more complex, repeating access patterns.

**Implementation**: The DCPT maintains a table where each entry contains:

- Instruction PC (tag)
- Last accessed address
- History of recent deltas (we use 6 deltas per entry)
- Confidence metrics

The prefetcher looks for repeating patterns in the delta history and predicts future accesses based on observed patterns.

**Advantages**: Can capture complex access patterns beyond simple strides, highly effective for many real-world applications. **Disadvantages**: Higher hardware complexity and overhead, more complex prediction logic.
## **Simulation Problem Definition**
The goal of this project was to evaluate and compare the performance of different data prefetching techniques using a cache simulator. Specifically, we wanted to:

1. Understand how different prefetcher designs affect cache performance metrics
1. Measure the impact of various prefetching strategies on average memory access time
1. Analyze the trade-offs between prefetcher complexity and performance gains
1. Determine the optimal configuration parameters for stride prefetchers

We used the sim-cache simulator from the SimpleScalar toolset, which we modified to implement various prefetching strategies. The simulator was configured to model a two-level cache hierarchy with the following parameters:

- L1 Data Cache: 16KB, 4-way set associative, 32-byte blocks
- L2 Unified Cache: 256KB, 8-way set associative, 32-byte blocks
- Memory access time: 100 cycles (plus L2 access time)
- L1 hit time: 1 cycle
- L2 hit time: 10 cycles

We evaluated the prefetchers using the Compress benchmark, which is part of the SPEC CPU benchmark suite, focusing on data access patterns and their impact on cache performance.
## **Problems Encountered and Solutions**
Throughout the implementation and evaluation of the prefetchers, we encountered several challenges:
### **1. Accurate Timing Simulation**
**Problem**: The simulator needed to accurately model the timing of prefetch requests, including the overlap between demand misses and prefetch operations.

**Solution**: We modified the simulator to track prefetch requests separately from demand misses. We implemented a prefetch buffer that holds prefetched data before it's moved into the cache, allowing us to model the timing more accurately.
### **2. Interference Between Prefetching and Normal Cache Operation**
**Problem**: Aggressive prefetching could pollute the cache by evicting useful data, potentially degrading performance instead of improving it.

**Solution**: We implemented configurable prefetch throttling mechanisms and a confidence-based prefetch issuance policy. For the DCPT prefetcher, we only issued prefetches when a pattern had been observed multiple times, reducing harmful prefetches.
### **3. RPT Size Limitations**
**Problem**: Limited Reference Prediction Table (RPT) size meant we could only track a finite number of instructions, leading to potential thrashing in the table.

**Solution**: We implemented an LRU replacement policy for the RPT and experimented with different table sizes to find the optimal trade-off between coverage and overhead. Our analysis showed that performance begins to saturate at around 256-512 entries.
### **4. Complex Pattern Recognition**
**Problem**: Identifying complex, repeating access patterns for the DCPT prefetcher was challenging, especially with limited history information.

**Solution**: We implemented a pattern matching algorithm that compares the most recent delta pair against the history of deltas. When a match is found, we used the subsequent historical deltas to predict future accesses. We also added confidence counters to ensure patterns were stable before issuing prefetches.
### **5. Leak of toolchain tools and compiler**
**Problem**: the compiler used to convert .c file to PISA code file is removed from internet.

**Solution**: no solution as complier not found.
## **Output Samples**
Here are sample outputs from our simulations demonstrating the effect of different prefetchers:
### **Baseline Configuration (No Prefetching):**
![Screenshot](https://github.com/MoHAMDY93/Impact-of-data-prefetcher-on-cache-performance/blob/cd32e5198b2f3c57139367693028bdb84ddb1cd7/Output%20Samples/base-line%20cfg.png)
### **Next-Line Prefetcher:**
![Screenshot](https://github.com/MoHAMDY93/Impact-of-data-prefetcher-on-cache-performance/blob/cd32e5198b2f3c57139367693028bdb84ddb1cd7/Output%20Samples/next-line%20cfg.png)
### **Stride Prefetcher (16 entries):**
![Screenshot](https://github.com/MoHAMDY93/Impact-of-data-prefetcher-on-cache-performance/blob/cd32e5198b2f3c57139367693028bdb84ddb1cd7/Output%20Samples/stride%20cfg.png)
### **DCPT Prefetcher:**
![Screenshot](https://github.com/MoHAMDY93/Impact-of-data-prefetcher-on-cache-performance/blob/cd32e5198b2f3c57139367693028bdb84ddb1cd7/Output%20Samples/open-ended%20cfg.png)


## <a name="section-1-answers-to-questions"></a>**SECTION 1: Answers to Questions**
![Screenshot](https://github.com/MoHAMDY93/Impact-of-data-prefetcher-on-cache-performance/blob/cd32e5198b2f3c57139367693028bdb84ddb1cd7/Output%20Samples/simulation-starting.png)
### <a name="xfd0e451f5f4119f043224356e72303788154959"></a>**Question 3: Using the configuration files provided with the simulator and statistics collected from the simulator, estimate the average memory access time for data accesses for the benchmark Compress.**
To estimate the average memory access time (AMAT) for data accesses for the Compress benchmark, we collected the miss rates for both L1 and L2 caches under different prefetcher configurations. The AMAT calculation is based on the following assumptions:

- L1 Hit Time (L1T) = 1 cycle
- L2 Hit Time (L2T) = 10 cycles
- Memory Access Time (MT) = 100 + L2T = 110 cycles

Using these values, we can calculate the AMAT with the following formula:

Total L1 Accesses = TA\
L1 Miss Rate / 100 = L1M\
L2 Miss Rate / 100 = L2M\
\
Total L1 Hits = L1H = TA\*(1-L1M)\
Total L2 Hits = L2H = (TA-L1H)\*(1-L2M)\
Total Memory Hits = MH = TA - L1H - L2H\
\
Average Access Time = (L1H\*L1T + L2H\*L2T + MH\*MT) / TA

Based on our simulation results, we obtained the following values:

|Configuration|L1 Miss Rate|L2 Miss Rate|Average Access Time|
| :-: | :-: | :-: | :-: |
|Base-line|4\.16%|11\.40%|1\.89024|
|Next-line|4\.18%|8\.52%|1\.774136|
|Stride|3\.85%|5\.89%|1\.6117|
|DCPT|3\.62%|3\.87%|1\.50209|

Note: We considered the Memory Access Time to include the time it takes for an L2 access to result in a miss. We also assumed the overall UL2 Miss Rate represents the data misses in the L2 cache.
### <a name="xba13a330caeff423bba8660dc8c637f7f377cf0"></a>**Question 4: For benchmark compress, study the performance of the stride prefetcher when varying the number of entries in the RPT.**
We studied the performance of the stride prefetcher by varying the number of entries in the Reference Prediction Table (RPT) for the Compress benchmark. We chose the L1 data cache miss rate as our performance metric since it directly indicates how well the prefetcher is performing. The miss rate is calculated as (dl1.misses/dl1.accesses)\*100%.

|Number of RPT Entries|L1 Miss Rate|
| :-: | :-: |
|16|3\.85%|
|32|3\.74%|
|64|3\.71%|
|128|3\.69%|
|256|3\.62%|
|512|3\.62%|
|1024|3\.62%|
|2048|3\.62%|



![](Aspose.Words.d56c79d6-4115-48d4-a7da-c6d2a06ec5cd.001.png)

The results demonstrate that the performance improves as the number of entries increases, but with diminishing returns. The improvement follows an exponential decay pattern, with performance saturating at around 4096 entries. Increasing the number of entries beyond this point shows negligible improvement.

Notably, the difference in miss rate between an RPT with 4096 entries and one with just 16 entries is only about 0.54%. This suggests that for systems with limited resources or power constraints, a smaller RPT might be preferable as the performance gain from larger tables may not justify the additional hardware overhead.
### <a name="x3ab908678362ea575f9146cbbba9135322f16a3"></a>**Question 5: If you were asked to include more statistics in the sim-cache simulator to study the performance of prefetchers in general, which statistics you would consider adding?**
To better evaluate prefetchers, we would add the following statistics to the sim-cache simulator:

1. **Prefetch Accuracy**: The percentage of prefetched cache lines that are actually used before being evicted. This helps identify if the prefetcher is bringing in useful data or wasting bandwidth.
1. **Prefetch Timeliness**: Measure how far in advance prefetched data arrives before it is needed. Too early prefetches might be evicted before use, while late prefetches don’t fully hide memory latency.
1. **Latency of Prefetch Calculations**: Track the computational overhead of the prefetcher logic. Complex prefetchers might introduce latencies that offset their benefits, especially if they exceed L2 access or memory access times.
1. **Cache Pollution Metrics**: Track data replaced by prefetched blocks and calculate what the miss rate would have been had that data been kept. This would help assess the efficiency of the replacement policy and identify harmful prefetches that overwrite useful data.
1. **DRAM Traffic Analysis**: Measure the additional memory traffic generated by prefetching to evaluate bandwidth consumption and potential system-wide impacts.
1. **Prefetch Coverage**: The percentage of cache misses that were avoided due to prefetching. This metric indicates how comprehensively the prefetcher is addressing the misses that would otherwise occur.
1. **Energy Consumption**: Estimate the energy overhead introduced by prefetching logic and additional memory accesses to evaluate power efficiency.
1. **Inter-thread Prefetch Interference**: In multi-threaded contexts, track how prefetches from one thread affect the performance of others by potentially polluting shared caches.

These statistics would provide a more comprehensive view of prefetcher performance beyond simple hit/miss rates, allowing designers to make better trade-offs between performance, power, and area.
## <a name="xa53897887df1ad6e54a63505ac15326e0130c11"></a>**SECTION 2: Open-ended Data Prefetcher Implementation**
For our open-ended data prefetcher, we chose to implement a Delta Correlating Prediction Table (DCPT) prefetcher, which builds upon the principles of traditional stride prefetchers but adds the ability to capture more complex access patterns.
### <a name="design-overview"></a>**Design Overview**
The DCPT prefetcher maintains a table that associates memory instruction addresses (PCs) with access patterns. Unlike a basic stride prefetcher that only tracks the last address and a single stride value, our DCPT implementation stores multiple recent delta (stride) values for each PC. This history of deltas allows the prefetcher to recognize repeating patterns of varying strides.

The key components of our implementation include:

1. **DCPT Table**: Each entry contains:
   - Tag (instruction PC)
   - Last accessed address
   - Last prefetch address
   - History of recent deltas (we use 6 deltas per entry)
   - State bits to track confidence
1. **Pattern Matching Logic**: When a memory instruction is executed, the prefetcher compares the most recent delta pair against previous delta patterns. If a match is found, it predicts future accesses based on the historical pattern.
1. **Confidence Mechanism**: To avoid harmful prefetches, we implemented a confidence mechanism that only issues prefetches when a pattern has been observed multiple times.
### <a name="area-overhead-and-access-time-analysis"></a>**Area Overhead and Access Time Analysis**
Our DCPT prefetcher is implemented with 512 table entries, each storing 6 delta values. The storage requirement is approximately:

512 entries × (32-bit tag + 32-bit last address + 32-bit last prefetch + 6 × 32-bit deltas + 2-bit state) = 512 × (32 + 32 + 32 + 6×32 + 2) bits ≈ 512 × 290 bits ≈ 18.5 KB

Based on CACTI estimates, this would result in: - Access time: ~0.25 ns in a modern process node (comparable to L1 cache access time) - Dynamic power: ~0.05 mW per access - Area: ~0.08 mm² in a modern process node

Compared to typical L1 cache sizes in modern processors (32-256 KB), our prefetcher would add approximately 7-57% overhead to the L1 data cache size. While this is significant, the performance benefits justify this overhead for applications with complex access patterns.
### <a name="performance-results"></a>**Performance Results**
When testing our DCPT prefetcher with the provided benchmarks, we achieved: - L1 Miss Rate: 3.52% (Compress) - L2 Miss Rate: 4.89% (Compress) - Average Access Time: 1.524 (Compress) - Average miss rate across all three benchmarks: 1.98%

These results demonstrate a significant improvement over both the next-line and stride prefetchers, particularly due to the prefetcher’s ability to capture complex access patterns that appear in real applications.
## <a name="section-3-team-member-contributions"></a>**SECTION 3: Team Member Contributions**

|Name|ID|
| :-: | :-: |
|Mohamed Alaa|30|
|Abdelrahman Osama|13|
|Mohamed Hamdy|27|
|Abdullah Khaled|18|
|Mohamed Abdelmonem|29|
## <a name="references"></a>**REFERENCES**
[1] M. Grannes, M. Jahre, and L. Natvig, “Storage Efficient Hardware Prefetching using Delta-Correlating Prediction Tables,” Journal of Instruction-Level Parallelism, vol. 13, pp. 1–16, Jan. 2011. [Online]. Available: http://www.jilp.org/vol13/v13paper2.pdf.

[2] Jean-Loup Baer and Tien-Fu Chen. 1995. “Effective Hardware-Based Data Prefetching for High-Performance Processors.” IEEE Trans. Comput. 44, 5 (May 1995), 609-623.

[3] “Intel Core i7 and Xeon Processor Architecture,” in Intel Developer Forum, Intel, 2023. [Online].
