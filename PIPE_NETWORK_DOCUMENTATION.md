# Pipe Network: Decentralized Content Delivery Network
## Technical Documentation and API Reference

## Table of Contents
- [Welcome](#welcome)
- [Introduction](#introduction)
  - [Current Limitations of Centralized CDNs](#current-limitations-of-centralized-cdns)
  - [The Demand for Decentralized, Permissionless CDNs](#the-demand-for-decentralized-permissionless-cdns)
  - [Introducing Pipe Network](#introducing-pipe-network)
- [Architecture](#architecture)
  - [Node Structure and Hyperlocal PoP Strategy](#node-structure-and-hyperlocal-pop-strategy)
  - [Content Distribution and Caching Mechanism](#content-distribution-and-caching-mechanism)
  - [Solana Blockchain Integration](#solana-blockchain-integration)
- [Key Features](#key-features)
  - [1. Hyperlocal Pipe PoP Nodes](#1-hyperlocal-pipe-pop-nodes)
  - [2. Cost Efficiency](#2-cost-efficiency)
  - [3. Real-time Data Delivery](#3-real-time-data-delivery)
  - [4. Security and Data Integrity](#4-security-and-data-integrity)
  - [5. Rolling Egress Logs](#5-rolling-egress-logs)
  - [6. Cache Invalidation](#6-cache-invalidation)
  - [7. Header Filtering and URL Query Blocks](#7-header-filtering-and-url-query-blocks)
  - [8. Local Scarcity-Based Node Incentives](#8-local-scarcity-based-node-incentives)
- [Scalability and Network Growth](#scalability-and-network-growth)
  - [Decentralized Scalability](#decentralized-scalability)
  - [Network Expansion Strategy](#network-expansion-strategy)
  - [Hyperlocal PoP Nodes and Global Reach](#hyperlocal-pop-nodes-and-global-reach)
- [Opportunities and Use Cases](#opportunities-and-use-cases)
  - [Opportunities in the CDN Space](#opportunities-in-the-cdn-space)
  - [Pipe Network CDN Advantages](#pipe-network-cdn-advantages)
- [Operating a DevNet CDN PoP Node](#operating-a-devnet-cdn-pop-node)
  - [Key Features](#key-features-1)
- [Performance and Fraud Detection](#performance-and-fraud-detection)
  - [1. Multi-Layered IP Address Verification](#1-multi-layered-ip-address-verification)
  - [2. Latency-Based Location Verification](#2-latency-based-location-verification)
  - [4. Crowdsourced or Peer Verification](#4-crowdsourced-or-peer-verification)
  - [5. Economic Disincentives for Faking Locations](#5-economic-disincentives-for-faking-locations)
- [Nodes](#nodes)
  - [DevNet 2](#devnet-2)
  - [Troubleshooting](#troubleshooting)
  - [Pipe PoP Cache Node Documentation](#pipe-pop-cache-node-documentation)
- [CDN API Reference](#cdn-api-reference)
  - [Account Management APIs](#account-management-apis)
  - [File Management APIs](#file-management-apis)
  - [Wallet and Payments APIs](#wallet-and-payments-apis)
  - [Utility APIs](#utility-apis)
  - [Implementation Notes](#implementation-notes)
- [Future Development](#future-development)
  - [Testnet](#testnet)
  - [Mainnet](#mainnet)
- [Support and Resources](#support-and-resources)

## Welcome

Welcome to Pipe Network: Building a permissionless future, one node at a time.

Pipe Network is a hyper-localized, scalable content delivery network (CDN) built on Solana's high-performance blockchain. Each CDN PoP node in the network is strategically placed close to users for fast, reliable content delivery. Pipe Network's nodes ensure low-latency content streaming, making it ideal for media and real-time applications. Anyone can run a node, contributing to the network's growth and resilience.

## Introduction

Pipe Network is a decentralized, permissionless content delivery network (CDN) designed to address the limitations of traditional, centralized CDNs. By utilizing a unique architecture built on the Solana blockchain, Pipe Network offers a scalable, cost-efficient, and highly secure solution for delivering content globally.

At the core of Pipe Network's innovation is the deployment of hyperlocal Pipe PoP (Points of Presence) nodes. These nodes are strategically distributed in underserved areas to optimize latency, ensuring that content is delivered faster and more efficiently than centralized CDNs, particularly in regions where traditional CDNs fall short. This hyperlocal focus enhances the user experience by dramatically reducing the distance data must travel, which is key to achieving real-time content delivery.

Through the use of Pipe Credits and Data Credits, Pipe Network offers flexible, transparent payment structures that align incentives between users and node operators. The network compensates node operators based on local resource scarcity, ensuring fair and efficient service delivery.

Robust security and network management features, including real-time data transfer, DDoS protection, dynamic IP/geographical blocking, DMCA complaint handling, and access to rolling logs, further distinguish Pipe Network from legacy solutions. With decentralized infrastructure and advanced blockchain technology, Pipe Network reduces operational costs.

Pipe Network is set to transform content delivery with a globally distributed, decentralized architecture that focuses on real-time performance, transparency, and scalability through hyperlocal PoP nodes.

The internet is increasingly reliant on fast, efficient content delivery to power modern applications, websites, and services. Traditional Content Delivery Networks (CDNs) have played a critical role in distributing content to users around the globe. However, as demand for real-time access to data and media grows, centralized CDNs face limitations, such as high costs, latency in underserved regions, and bottlenecks due to their centralized nature.

### Current Limitations of Centralized CDNs

Centralized CDNs often require significant capital investment in infrastructure and are primarily concentrated in urban or high-traffic areas, leading to slower speeds in remote or underserved locations. Moreover, these CDNs operate within proprietary systems, creating barriers for smaller businesses and independent developers to access affordable content delivery solutions.

With growing demands for decentralization, security, and improved data delivery performance, the need for a new paradigm has emerged.

### The Demand for Decentralized, Permissionless CDNs

Decentralization offers the ability to spread content delivery responsibilities across a global network of independent nodes. Permissionless networks enable anyone with the necessary hardware to contribute to the network, eliminating central points of control and promoting true global distribution.

Pipe Network addresses these challenges with its decentralized CDN model. By leveraging blockchain technology, a unique economy, and a distributed network of hyperlocal Pipe PoP nodes, Pipe Network is designed to optimize latency, ensure equitable access to content, and reduce operational costs.

### Introducing Pipe Network

Pipe Network is a revolutionary decentralized CDN that uses the Solana blockchain to create a permissionless ecosystem. It allows anyone to operate nodes, leading to an expanded network of PoP nodes in hyperlocal regions worldwide. This model not only reduces latency but also provides a solution to the centralized inefficiencies of traditional CDNs.

Pipe Network aligns the incentives of users and node operators through Pipe Credits and Data Credits. This decentralized system prioritizes both cost-effectiveness and performance, enabling users to enjoy content delivery at a fraction of the cost compared to traditional solutions.

Pipe Network's unique combination of decentralization, hyperlocal PoP nodes, and blockchain-backed security is poised to redefine how content is distributed across the internet, especially in regions traditionally underserved by existing CDNs.

## Architecture

Pipe Network's decentralized architecture is designed to meet the evolving demands of content delivery in a more efficient and scalable way than traditional, centralized CDNs. The network leverages a combination of decentralized nodes, blockchain technology, and hyperlocal Points of Presence (PoP) to deliver content quickly and securely across the globe.

### Node Structure and Hyperlocal PoP Strategy

At the heart of Pipe Network's architecture are its hyperlocal PoP nodes, strategically deployed to ensure that content is delivered with minimal latency. Unlike traditional CDNs that rely on large, centralized server farms in major cities, Pipe Network operates on a decentralized model, where independent operators can deploy nodes in their local regions. This localized approach ensures content delivery is optimized for proximity, dramatically reducing latency for users, especially in underserved or remote areas.

Nodes are permissionless, meaning anyone with the appropriate hardware can contribute to the network. This creates a truly decentralized system where content delivery is not restricted by the centralization of infrastructure. Each node in the network can cache and deliver content to nearby users, providing both redundancy and improved performance.

### Content Distribution and Caching Mechanism

Pipe Network employs a distributed caching mechanism, where content is cached at the hyperlocal PoP nodes. The Cache Management System (CMS) manages the coordination of content, while individual nodes handle the local caching. In future development phases, Pipe Network will enable peer-to-peer connections between nodes, allowing them to sync and share cached content, further improving content availability and reducing the burden on the CMS.

This decentralized caching strategy ensures that content is not only served faster to local users but also reduces the need for redundant long-distance data transfers, leading to more efficient bandwidth usage.

### Solana Blockchain Integration

Pipe Network is built on the Solana blockchain, chosen for its high throughput, low transaction costs, and speed. The Solana integration enables the decentralized control of the network through smart contracts, ensuring that all transactions—whether it's payments for data bandwidth, or network upgrades—are handled securely and efficiently.

Solana's architecture allows Pipe Network to scale without compromising performance. The use of blockchain also brings transparency to the system, as all transactions are recorded immutably on-chain. This provides users and node operators with confidence in the fairness and integrity of the system.

![Network Architecture](./assets/network_architecture.png)

## Key Features

Pipe Network's decentralized CDN model is designed to address the specific needs of modern content delivery. By combining innovative technology with a robust feature set, Pipe Network offers a unique solution for businesses, developers, and users seeking to optimize content distribution.

### 1. Hyperlocal Pipe PoP Nodes

Pipe Network's hyperlocal Points of Presence (PoP) nodes are a fundamental aspect of the network's performance and efficiency. These PoP nodes are deployed in localized areas, enabling content to be delivered from the closest possible node to the end-user, significantly reducing latency. Unlike traditional CDNs that concentrate nodes in major cities, Pipe Network's decentralized model allows nodes to be set up in any region, including underserved and remote areas. This helps achieve true real-time data delivery across the globe.

### 2. Cost Efficiency

One of Pipe Network's core goals is to provide a cost-effective alternative to centralized CDNs. With its decentralized infrastructure and a blockchain-based system, Pipe Network can deliver content at a significantly lower price. The burn-mint equilibrium system ensures that users only pay for what they use, with Data Credits being consumed as data is transferred.

### 3. Real-time Data Delivery

Pipe Network outperforms competitors in real-time content delivery by leveraging its decentralized, hyperlocal PoP nodes. The proximity of these nodes to users minimizes latency, ensuring that data is delivered faster than traditional CDNs. This is particularly important for applications requiring real-time responsiveness, such as live video streaming, gaming, and real-time communications.

### 4. Security and Data Integrity

Pipe Network incorporates several advanced security features to ensure data integrity and protect against malicious attacks:

**DDoS Protection**: The network provides built-in Distributed Denial of Service (DDoS) protection for endpoints, mitigating the risk of attacks that could overwhelm content delivery.

**DMCA Complaint System**: Pipe Network has a backend system that allows customers to file and manage Digital Millennium Copyright Act (DMCA) complaints. The system parses URLs and connects them to the relevant customer, ensuring that content takedown requests are handled efficiently and securely.

**IP and Geo-blocking**: Customers can block access to content based on IP addresses or geographical locations. This feature offers flexibility in managing where content can be accessed and by whom.

### 5. Rolling Egress Logs

Pipe Network provides access to a window of egress URL logs for each customer's configured endpoints. This feature gives customers insights into how their content is being accessed, enabling them to monitor traffic patterns and optimize their delivery strategies.

### 6. Cache Invalidation

Customers have the ability to invalidate cached content at the PoP nodes. This ensures that outdated or incorrect data is removed from the cache, allowing the most up-to-date content to be served to users. Cache invalidation is crucial for dynamic content that changes frequently.

### 7. Header Filtering and URL Query Blocks

Pipe Network allows customers to filter requests to their content endpoints by analyzing headers or URL queries. This feature provides an extra layer of control, ensuring that only valid, authorized requests are allowed through.

### 8. Local Scarcity-Based Node Incentives

Pipe Network ties node operator payouts to local resource scarcity. This model ensures that operators in regions with fewer nodes or higher data demand are compensated more generously, incentivizing the deployment of nodes where they are needed the most. This approach promotes a balanced and distributed network that can grow organically based on demand.

## Scalability and Network Growth

Pipe Network is designed to scale seamlessly as demand for content delivery increases. The network's decentralized, permissionless architecture, combined with the hyperlocal PoP node strategy, ensures that it can grow organically while maintaining performance, security, and cost-efficiency.

### Decentralized Scalability

Unlike centralized CDNs, where capacity is constrained by infrastructure investments, Pipe Network's decentralized model allows anyone to contribute to the network by operating a node. This permissionless approach encourages rapid expansion, as node operators are incentivized through the scarcity-based reward system, creating a natural distribution of nodes in underserved areas where demand is high.

As more nodes join the network, content delivery speeds improve, especially in regions where traditional CDNs struggle to provide fast, reliable service. The hyperlocal focus of Pipe PoP nodes also ensures that the network can grow without requiring large, centralized data centers, making it inherently more flexible and scalable.

### Network Expansion Strategy

Pipe Network's growth strategy is centered around encouraging node operators to deploy in regions with high demand but low coverage. The system's rewards model, based on local resource scarcity, ensures that nodes are set up in underserved areas where they can provide the most value.

Additionally, Pipe Network has implemented a phased development approach:

**Phase 1**: The current design involves nodes that are connected to a cache management system, which manages content distribution. This phase ensures that content is cached locally at the PoP nodes, reducing the load on the CMS and improving delivery speeds.

**Phase 2**: In future phases, Pipe Network will enable peer-to-peer connections between nodes. This will allow nodes to synchronize and share cached content directly, reducing reliance on the CMS and improving the overall efficiency of the network.

**Phase 3**: In the long term, Pipe Network will focus on advanced features such as synchronized caching across nodes, real-time analytics, and geographic expansion to further enhance performance and reliability.

### Hyperlocal PoP Nodes and Global Reach

Hyperlocal PoP nodes are critical to Pipe Network's scalability. By placing these nodes in closer proximity to end-users, Pipe Network ensures that data does not have to travel long distances, reducing latency and improving the speed of content delivery. As more nodes are added, especially in regions that are typically underserved, Pipe Network can deliver content faster and more efficiently than traditional CDNs.

The scalability of hyperlocal PoP nodes also means that Pipe Network can respond dynamically to changes in demand. As new regions experience growth in digital content consumption, node operators can deploy additional nodes to meet that demand, ensuring that the network remains responsive and efficient.

## Opportunities and Use Cases

### Opportunities in the CDN Space

As demand for high-speed, low-latency streaming continues to grow, traditional CDNs are struggling to keep up. Pipe Network offers a fresh solution, leveraging Solana's decentralized architecture to deliver content reliably and at lower costs.

Key benefits include:

**Ultra-low Latency**: Fast, decentralized content delivery ensures smoother user experiences.

**Scalability**: Effortlessly adapts to growing content demands without major infrastructure investment.

**Enhanced Security**: Hyper-localized distributed design protects against cyberattacks and system failures.

**Cost efficiency**: Provides a more affordable content delivery solution for providers of all sizes.

Pipe Network is the next evolution in content delivery, shaping the future of the internet. Join us in building today!

### Pipe Network CDN Advantages

Pipe Network uses hyper-local cache (L2 Pipe PoP) that brings content closer to the end user than traditional CDNs, resulting in reduced latency, faster delivery times, and enhanced streaming quality.

For example, if content originates from a hyperscaler located 350 miles away, it will then pass through two layers of caching:

**L1 Pipe PoP (Country/Metro Cache)**: A cache located 150 miles from the user. 

**L2 Pipe PoP (Hyperlocal Cache)**: A second, much closer cache located within 10 miles of the end user, ensuring ultra-low latency and significantly faster content delivery. 

![CDN Advantages](./assets/cdn_advantages.png)

Ultimately, achieving reduce travel distance, enhanced speed, and optimal efficiency compared to traditional CDN setups.

## Operating a DevNet CDN PoP Node

The binary of the CDN PoP node For DevNet2 is publicly available.

Fill out this form to be notified of new releases and to be entered for a chance to win on-chain prizes:
https://docs.google.com/forms/d/e/1FAIpQLScbxN1qlstpbyU55K5I1UPufzfwshcv7uRJG6aLZQDk52ma0w/viewform

💡 Prepare for Testnet: Run a DevNet2 node, and keeping it running 24/7 will increase your node score, this will directly translate into a high node score for Testnet. The higher the node score the more traffic the protocol will direct to the node and increase the rewards. 

### Key Features

**Location-Based Rewards**: Operators in underrepresented or high-demand regions earn additional incentives.

**PoP Node Rewards**: Rewards are based on metrics such as data served, latency, and uptime. Consistent uptime and performance standards yield higher rewards, while downtime and churn result in rejoin penalties to deter disruption.

## Performance and Fraud Detection

Ensuring that node operators are physically located in the regions they claim, rather than using VPNs or proxies to spoof their location, is a critical challenge for decentralized networks like Pipe Network. Relying solely on self-reported geographic information can lead to exploitation of the scarcity-based incentive model.

To prevent nodes from spoofing their location using VPNs or proxies, Pipe Network will implement a multi-faceted verification approach.

### 1. Multi-Layered IP Address Verification

**Objective**:

**GeoIP Databases**: The most straightforward method is using commercial GeoIP databases (e.g., MaxMind, IP2Location) to verify the location of the IP address associated with the node. These databases can identify the geographic location of IP addresses down to the city or region level.

**IP Address History**: If a node's IP address changes frequently (as it might if someone is using a VPN), the system can flag this as suspicious. Consistency in IP address history can help verify that a node has a stable location.

**VPN and Proxy Detection**: There are specialized services and algorithms designed to detect VPNs, proxies, and other anonymization methods. Integrating these into the verification system helps filter out nodes using these techniques.

### 2. Latency-Based Location Verification

**Ping Tests to Local PoP nodes**: By running latency tests from a node to a network of strategically placed servers in different regions, the system can estimate the node's geographic location. For example, if a node claims to be in New York, but its latency to a New York server is much higher than expected, it may indicate the node is spoofing its location.

**Traceroute Analysis**: Performing traceroutes to various known locations can give insights into the node's actual geographic path and location. Nodes that use VPNs often show signs of rerouting through faraway servers, which can be detected through inconsistencies in network hops.

### 4. Crowdsourced or Peer Verification

**Node-to-Node Verification**: Peer nodes can be used to verify the geographic location of a new node. For example, a node joining the network in a certain geographic area could be required to interact with a few nearby nodes. If the latency and network paths are consistent, the location can be verified.

**Challenge-Response Mechanisms**: Nodes in specific geographic regions could be asked to perform tasks that only make sense for that area (e.g., interacting with local data sources or completing tasks with geographically localized content). If a node cannot complete these tasks with the expected performance, its location claim could be challenged.

### 5. Economic Disincentives for Faking Locations

**Penalties for False Reporting**: Introducing strict penalties for nodes caught faking their location could discourage this behavior. For example, if a node is flagged for potentially using a VPN and is found to be faking its location, the network could slash its rewards or remove it from the scarcity-based incentive model.

**Periodic Re-verification**: Nodes could be periodically required to prove their location, and failing re-verification could result in a loss of rewards or node deactivation.

Combining multiple verification methods creates a robust system that is harder to game. For example, using IP address checks combined with latency verification and periodic challenge-response tasks can ensure a high degree of accuracy in determining a node's location.

## Nodes

### DevNet 2

As we get ready for testnet launch we are introducing a new node architecture. 

DevNet 2 is basically alpha testnet. Once this has proven stable for 40 days, testnet will be released.

### Troubleshooting
Help for troubleshooting common mistakes

#### Issue: systemd service stuck in activating status, continuously restarting, won't start
1) Test for detectable issues in your pop systemd config file: `sudo systemd-analyze verify pop.service`
If there is no output then that means no errors were found by this tool, however your .service could still be misconfigured.

2) Review contents of your service config: `cat /etc/systemd/system/pop.service`

3) Compare with the example systemd service in the documentation

#### Issue: curl or wget issue when downloading PoP binary
If you received unexpected text on-screen during your download or unexpected errors at runtime, it's quite possible your download was not fully successful and your pop binary is not fully intact.  

To test your download URL pasting and curl'ing, attempt to get the following tests to pass. These test your pasted download URL (substitute the URL shown for your download URL)

1) `curl -I -s https://downloadurl.com | head -n 1`

2) `curl -Is https://downloadurl.com >/dev/null && echo "URL is accessible! ✅" || echo "URL is not accessible ❌"`

Once you believe you have a good download of the pop binary, attempt a simple `./pop --version`

#### Issue: another service on your system has taken the egress port
Potential error message: 'Error: Os { code: 98, kind: AddrInUse, message: "Address already in use" }'

Explanation: Another program has bound to port 8003, 443 or 80 on your server.

Solutions:
1) Make sure you've disabled and shutdown any old DevNet1 instances.

2) You could try rebooting the server as a quick way to clear out other port 8003, 443 or 80 usage.

3) Attempt to determine existing process, PID, user consuming port 8003, 443 or 80. Example uses '8003' but you can replace with '443' or '80' as needed to test.

```bash
sudo lsof -i :8003
```

OR:

```bash
sudo netstat -tulpn | grep 8003
```

If you find that nothing is displayed, it means no process is currently using that port.

#### Issue: Multiple config files, resulting in: 'Node Already Registered' / 'IP Already Associated'
**Common Error Messages**
- IP-xxx.xx.xxx.xxx is already associated with node_id=...
- "Node already registered"
- "Failed to register node"

**Root Cause**
These errors may occur when pop is ran subsequent times outside of the folder it was originally executed. This may result in the following:
- a new configuration file being created
- an additional registration attempt being made
- multiple node_info.json files

This leads to duplicative registration attempts, which system safeguards will block.  

In cases like this, your system already registered the first time pop was executed but when you run pop subsequent times from different locations pop may not see your existing node_info.json.  

An example scenario: you initially run pop from your home folder and pop registers and creates a node_info.json in your home folder. You then choose to setup pop as a systemd service such that the .service config references a different working directory which does not contain the node_info.json. In this case, duplicative node_info.json's need to be removed, and the original registered node_info.json needs to be moved to the servers working directory.

**Diagnostic Script**
Save this script as find-nodeinfo.sh:

```bash
#!/bin/bash
echo "Searching for node_info.json files..."
echo "----------------------------------------"

# Find all node_info.json files and store details in a temporary file
sudo find / -name node_info.json -type f -exec stat --format="%Z %n" {} \; 2>/dev/null | sort -n > /tmp/node_files.txt

if [ ! -s /tmp/node_files.txt ]; then
    echo "No node_info.json files found on the system."
    rm /tmp/node_files.txt
    exit 0
fi

echo "Found node_info.json files (sorted by change time):"
echo "----------------------------------------"

# Read and format the output
while read timestamp filepath; do
    # Convert timestamp to human readable date
    date_str=$(date -d @"$timestamp" "+%Y-%m-%d %H:%M:%S")
    # Get file size
    size=$(sudo du -h "$filepath" | cut -f1)
    # Check if file is being used by a running process
    if sudo lsof "$filepath" >/dev/null 2>&1; then
        status="ACTIVE - Currently in use by running process"
    else
        status="inactive"
    fi
    
    echo "File: $filepath"
    echo "Created: $date_str"
    echo "Size: $size"
    echo "Status: $status"
    echo "----------------------------------------"
done < /tmp/node_files.txt

# Clean up
rm /tmp/node_files.txt

echo "The OLDEST node_info.json file is likely the original registered one."
echo "If you're experiencing registration issues:"
echo "1. Stop any running pop processes"
echo "2. Ensure your pop service or command uses the oldest node_info.json"
echo "3. Consider removing newer duplicate files after backing them up"
echo ""
echo "To prevent future duplicates:"
echo "- Always run pop commands from the directory containing your original node_info.json"
echo "- Or use the 'pop' alias if you've set up the service using the installation script"
```

**Resolution Steps**
1. Stop your pop service:

```bash
sudo systemctl stop pop   # if running as a service
# or
killall pop              # if running directly
```

2. Run the diagnostic script to identify your original node_info.json file (usually the oldest one)

3. Make sure your pop service or command uses the original node_info.json location:

If running as a service: Check WorkingDirectory in pop.service:
```bash
cat /etc/systemd/system/pop.service
```

If running directly: Always cd to the correct directory first

4. Backup and remove any newer duplicate node_info.json files

**Prevention**
- Always run pop commands from the directory containing your original node_info.json
- If using the service setup, use the provided 'pop' alias for all commands
- Never run pop commands from random directories
- Consider setting up the systemd service which manages this automatically

The earliest created node_info.json file is typically your original registered node configuration. This is the one you want to keep and use.

### Pipe PoP Cache Node Documentation

#### Overview
Cache Node is a high-performance caching service that helps distribute and serve files efficiently across a network.

#### System Requirements
- Linux
- Minimum 4GB RAM (configurable), more the better for higher rewards
- At least 100GB free disk space (configurable). 200-500GB is a sweet spot
- Internet connectivity available 24/7
- v0.2.6 specifically introduces support for ports 80 and 443, requiring elevated privileges.

**A small note**:
"Port 80 and 443 require root privileges or a systemd capability fix (see 'Systemd Service' section). If you run the binary manually, you should use sudo or run as root."

#### Basic Installation

**Install**
```bash
# download the compiled pop binary
curl -L -o pop "https://dl.pipecdn.app/v0.2.8/pop"
# assign executable permission to pop binary
chmod +x pop
# create folder to be used for download cache
mkdir download_cache
```
⚠️ IMPORTANT: to avoid formatting issues, compose your single-line curl command in a plain text editor (notepad), and then paste the single-line command into your server cli

**Quick Start**
```bash
sudo ./pop
```
Runs on port 8003, 443 and 80 with 4GB RAM and 100GB disk space.

Egress data will be on port 8003, 443 and 80. Make sure 8003, 443 and 80 are open on any firewalls/NAT's such as UFW.

If you choose not to use systemd, you must run Pipe PoP with sudo or as root to bind to ports 80 and 443.

**Configuration Example**
```bash
sudo ./pop \
  --ram 8 \              # RAM in GB
  --max-disk 500 \       # Max disk usage in GB  
  --cache-dir /data \    # Cache location
  --pubKey <KEY>         # Solana public key
```
Retrieve the public key from your Solana wallet (e.g., Phantom, Backpack) and paste it here for --pubKey

**Monitor**
```bash
# View metrics
./pop --status

# Check points (note: Points are not active yet)
./pop --points-route
```

**Refer / Signup by referral**
```bash
# Generate referral
./pop --gen-referral-route

# Use referral
sudo ./pop --signup-by-referral-route <CODE>
```

#### Files
- `node_info.json`: Node configuration
- `download_cache/`: Cached content

Recommened to backup node_info.json. It is linked to the IP address that registered the PoP node. It is no recoverable if lost.

#### Logs
- Output streams to stdout
- Auto-reports errors
- Health updates every 5 minutes
- The node tracks uptime, bandwidth, cache hits, and historical metrics.

#### Referral System

**How Referrals Work**
- Nodes can generate referral codes: `./pop --gen-referral-route`
- New nodes can sign up with referral: `./pop --signup-by-referral-route <CODE>`
- Referrer earns 10 points when referred node:
  - Stays active for 7+ days
  - Maintains reputation score > 0.5

The node that generated the referral needs to also maintain a good reputation score for the referrals to be counted as valid and productively adding value to the network.

This program will expand over time to include rewards sharing.

**Checking Referral Status**
1. Browse to https://dashboard.pipenetwork.com/node-lookup
2. Enter the referrer's node ID in the Node Lookup
3. Scroll down to "Referral Stats" to review referred nodes

#### Reputation System

The node's reputation score (0-1) is calculated based on the last 7 days of node operation, using three main components:

**1. Uptime Score (40% of total)**
- Reports are first grouped by hour to prevent over-weighting from frequent reporting
- A day is considered to have "good coverage" if it has at least 75% of hours reported (18+ hours)
- For days with good coverage, the average uptime is weighted by how complete the day's coverage was
- The final uptime score is the weighted average daily uptime divided by seconds in a day (capped at 100%)

**2. Historical Score (30% of total)**
- Based on how many days out of the last 7 had good coverage
- Example: If 6 out of 7 days had good coverage, the historical score would be 0.857 (86%)
- This rewards consistent reporting over time

**3. Egress Score (30% of total)**
- Based on total data transferred over the 7-day period
- Normalized against a target of 1TB per day
- Capped at 100%

**Example Calculation**
If a node has:
```
Day 1: 24 hours reported (100% coverage)
Day 2: 22 hours reported (92% coverage)
Day 3: 23 hours reported (96% coverage)
Day 4: 24 hours reported (100% coverage)
Day 5: 20 hours reported (83% coverage)
Day 6: 12 hours reported (50% coverage - not counted)
Day 7: 24 hours reported (100% coverage)
```
Then:
- 6 days have good coverage (>75% of hours)
- Historical score would be 6/7 = 0.857
- Uptime score would be based on the weighted average of those 6 days
- The day with only 50% coverage is not counted in the uptime calculation

**Important Notes**

*Maintenance Windows:*
- Short gaps (< 4 hours) don't significantly impact the score
- A day needs only 75% coverage to count, allowing for maintenance
- Restarts don't reset your progress

*Score Recovery:*
- Scores are calculated over a rolling 7-day window
- Poor performance drops out of the calculation after 7 days
- New nodes can build up their score within a week of good operation

*Best Practices:*
- Regular reporting (at least hourly)
- Plan maintenance during the same 6-hour window each day
- Keep total downtime under 6 hours per day when possible

*Score Interpretation:*
- 90%+ : Excellent reliability
- 80-90%: Good reliability
- 70-80%: Fair reliability
- <70%: Needs improvement

**Benefits of High Reputation**
- Priority for P2P transfers (score > 0.7)
- Eligibility for referral rewards (score > 0.5)
- Future: Higher earnings potential

**View Reputation**
```bash
./pop --status
```
Displays detailed breakdown of reputation metrics and overall score.

#### FAQ

**File Size Limits & Performance**
- Default RAM usage: 4GB
- Default disk cache: 100GB
- Chunk size: 64MB per transfer
- Max concurrent downloads controlled by RAM allocation

**Network Requirements**
- Stable internet connection required
- Ports 8003, 443 and 80 must be accessible
- Supports IPv4 and IPv6
- Auto-fallback on network errors

**Monitoring & Diagnostics**
- Auto-reports errors to central servers
- Logs in stdout
- Health checks every 5 minutes
- Built-in metrics for CPU, RAM, disk, network usage

**Automatic Updates**
- Checks for updates on startup
- Auto-notifies when new version available
- Shows download URL for latest version

**Cache Behavior**
- Files expire after 4 hours if unused
- Auto-cleanup of expired files
- Automatic peer discovery
- Geographic-based peer selection

**Security Notes**
- IP-based rate limiting
- Node ID verification
- Geographic distribution tracking
- IP address validation on registration

#### Systemd Service

Here is an example systemd config setup submitted by the community. Please customize based on your preferences:

```bash
# Create service user and directories
sudo useradd -r -m -s /sbin/nologin pop-svc-user -d /home/pop-svc-user 2>/dev/null || true

# Create required directories
sudo mkdir -p /opt/pop
sudo mkdir -p /var/lib/pop
sudo mkdir -p /var/cache/pop/download_cache

# Move pop binary from home directory to installation directory
sudo mv -f ~/pop /opt/pop/
sudo chmod +x /opt/pop/pop 2>/dev/null || true

# Handle any existing node_info.json from quick-start
sudo mv -f ~/node_info.json /var/lib/pop/ 2>/dev/null || true

# Set ownership
sudo chown -R pop-svc-user:pop-svc-user /var/lib/pop
sudo chown -R pop-svc-user:pop-svc-user /var/cache/pop
sudo chown -R pop-svc-user:pop-svc-user /opt/pop

# Create systemd service file
sudo tee /etc/systemd/system/pop.service << 'EOF'
[Unit]
Description=Pipe POP Node Service
After=network.target
Wants=network-online.target

[Service]
AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
User=pop-svc-user
Group=pop-svc-user
ExecStart=/opt/pop/pop \
    --ram=12 \
    --pubKey 7ugorwsqWvT6fwHoZhejAUPGWxK4fJtE9W8f8vebVh2S \
    --max-disk 175 \
    --cache-dir /var/cache/pop/download_cache \
    --no-prompt
Restart=always
RestartSec=5
LimitNOFILE=65536
LimitNPROC=4096
StandardOutput=journal
StandardError=journal
SyslogIdentifier=pop-node
WorkingDirectory=/var/lib/pop

[Install]
WantedBy=multi-user.target
EOF

# Set config file symlink and pop alias: prevent dup configs/registrations, convenient pop commands.
ln -sf /var/lib/pop/node_info.json ~/node_info.json
grep -q "alias pop='cd /var/lib/pop && /opt/pop/pop'" ~/.bashrc || echo "alias pop='cd /var/lib/pop && /opt/pop/pop'" >> ~/.bashrc && source ~/.bashrc

# Reload systemd, check and enable service
sudo systemctl daemon-reload
sudo systemd-analyze verify pop.service && sudo systemctl enable pop.service && sudo systemctl start pop.service

echo "Example pop.service setup is complete"
echo "1. Update values in pop.service based on your preferences"
echo "2. Use the 'pop' command (the alias) to run any pop commands"
echo "3. Check service status with: sudo systemctl status pop"
```

⚠️ IMPORTANT: When running pop commands while using the systemd service configuration, you must either:
- Change to the working directory first: `cd /var/lib/pop && /opt/pop/pop [command]`
- OR use the provided alias: `pop [command]` (recommended) This ensures node_info.json is found and prevents duplicate node registration.

#### Backup your node

Take a backup copy of the node_info.json and store it offline. Example of taking a backup copy:

If running as a service:
```bash
cp /var/lib/pop/node_info.json ~/node_info.backup2-4-25
```

If running quickstart:
```bash
cp ~/node_info.json ~/node_info.backup2-4-25
```

You can download the backup file off your machine using SCP or other means.

#### Upgrade your Node

The nodes logs our --status output will show the URL of a newly released version
1. Download new version: `curl -L -o pop "<DOWNLOAD-URL>"`
2. `chmod +x ./pop`
3. Move pop binary to permanent location as needed, for example `mv ./pop /opt/pop/pop`
4. Change directory 'cd' into the WorkingDirectory containing the node_info.json, for example `cd /var/lib/pop`
5. `pop --refresh` or `/opt/pop/pop --refresh`

6. You may need to add these to the [SERVICE] section of your .service if you are using systemd:
```
[Service]
AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
```

If you prefer not to modify your systemd unit, you can also run:
```bash
sudo setcap 'cap_net_bind_service=+ep' /path/to/pop
```
This lets a non-root user bind to ports 80/443.

7. Open necessary ports:
```bash
sudo ufw allow 8003/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw reload
```

#### Decommission old DevNet 1 Node

If using same computer, this is best done before activating DevNet 2 Node:
```bash
sudo systemctl disable dcdnd.service
sudo systemctl stop dcdnd.service
```

## CDN API Reference

Pipe CDN API Documentation
This document provides a comprehensive overview of the Pipe CDN API. All is this is currently based on the Pipe Network CDN Devnet deployment on Solana Devnet.

### Base URL
All API endpoints are relative to the base URL

### Authentication
Most endpoints require authentication using two parameters:

- `user_id`: The unique identifier for the user
- `user_app_key`: The application key for the user

These parameters are typically included as query parameters for GET requests or in the request body for POST requests.

### Account Management APIs

#### Create User
Creates a new user account.

**Endpoint**: `/createUser`

**Method**: POST

**Authentication**: None (public endpoint)

```http
Request Body:
{
  "username": "string"
}

Response:
{
  "user_id": "string",
  "user_app_key": "string",
  "solana_pubkey": "string"
}
```

#### Rotate App Key
Rotates (changes) the application key for a user.

**Endpoint**: `/rotateAppKey`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string"
}

Response:
{
  "user_id": "string",
  "new_user_app_key": "string"
}
```

### File Management APIs

#### Upload File
Uploads a file to Pipe CDN.

**Endpoint**: `/upload`

**Method**: POST

**Authentication**: Required

**Query Parameters**:
- user_id: User ID
- user_app_key: User application key
- file_name: Name to store the file as
- epochs (optional): Storage duration in epochs

**Body**: File content as multipart/form-data

**Response**: The uploaded filename as a string

#### Priority Upload
Uploads a file with higher priority.

**Endpoint**: `/priorityUpload`

**Method**: POST

**Authentication**: Required

**Query Parameters**:
- user_id: User ID
- user_app_key: User application key
- file_name: Name to store the file as
- epochs (optional): Storage duration in epochs

**Body**: File content as multipart/form-data

**Response**: The uploaded filename as a string

#### Download File
Downloads a file from Pipe CDN.

**Endpoint**: `/download`

**Method**: GET

**Authentication**: Required

**Query Parameters**:
- user_id: User ID
- user_app_key: User application key
- file_name: Name of the file to download

**Response**: The file content with appropriate Content-Type and Content-Length headers

#### Priority Download
Downloads a file with higher priority.

**Endpoint**: `/priorityDownload`

**Method**: GET

**Authentication**: Required

**Query Parameters**:
- user_id: User ID
- user_app_key: User application key
- file_name: Name of the file to download

**Response**: The file content as Base64-encoded string

#### Delete File
Deletes a file from storage.

**Endpoint**: `/deleteFile`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "file_name": "string"
}

Response:
{
  "message": "string"
}
```

#### Create Public Link
Creates a public link for a file.

**Endpoint**: `/createPublicLink`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "file_name": "string"
}

Response:
{
  "link_hash": "string"
}
```

#### Public Download
Downloads a file using a public link.

**Endpoint**: `/publicDownload`

**Method**: GET

**Authentication**: None (public endpoint)

**Query Parameters**:
- hash: The public link hash

**Response**: The file content with appropriate headers

#### Extend Storage
Extends the storage duration for a file.

**Endpoint**: `/extendStorage`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "file_name": "string",
  "additional_months": number
}

Response:
{
  "message": "string",
  "new_expires_at": "string"
}
```

### Wallet and Payments APIs

#### Check SOL Balance
Checks the SOL (Solana) balance of the user's wallet.

**Endpoint**: `/checkWallet`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string"
}

Response:
{
  "user_id": "string",
  "public_key": "string",
  "balance_lamports": number,
  "balance_sol": number
}
```

#### Check PIPE Token Balance
Checks the PIPE token balance of the user's wallet.

**Endpoint**: `/getCustomTokenBalance`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string"
}

Response:
{
  "user_id": "string",
  "public_key": "string",
  "token_mint": "string",
  "amount": "string",
  "ui_amount": number
}
```

#### Check DC Balance
Checks the DC (Data Credit) balance of the user's wallet.

**Endpoint**: `/getDcBalance`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string"
}

Response:
{
  "user_id": "string",
  "dc_balance": number
}
```

#### Swap SOL for PIPE
Swaps SOL for PIPE tokens.

**Endpoint**: `/swapSolForPipe`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "amount_sol": number
}

Response:
{
  "user_id": "string",
  "sol_spent": number,
  "tokens_minted": number
}
```

#### Swap PIPE for DC
Swaps PIPE tokens for DC (Data Credits).

**Endpoint**: `/swapPipeForDc`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "amount_pipe": number
}

Response:
{
  "user_id": "string",
  "pipe_spent": number,
  "dc_minted": number
}
```

#### Withdraw SOL
Withdraws SOL to an external address.

**Endpoint**: `/withdrawSol`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "to_pubkey": "string",
  "amount_sol": number
}

Response:
{
  "user_id": "string",
  "to_pubkey": "string",
  "amount_sol": number,
  "signature": "string"
}
```

#### Withdraw Custom Token
Withdraws PIPE tokens to an external address.

**Endpoint**: `/withdrawToken`

**Method**: POST

**Authentication**: Required

```http
Request Body:
{
  "user_id": "string",
  "user_app_key": "string",
  "to_pubkey": "string",
  "amount": number
}

Response:
{
  "user_id": "string",
  "to_pubkey": "string",
  "amount": number,
  "signature": "string"
}
```

### Utility APIs

#### Get Priority Fee
Gets the current priority fee for priority uploads.

**Endpoint**: `/getPriorityFee`

**Method**: GET

**Authentication**: None (public endpoint)

```http
Response:
{
  "priority_fee_per_gb": number
}
```

#### Check Version
Checks if the client is using the latest version.

**Endpoint**: `/versionCheck`

**Method**: POST

**Authentication**: None (public endpoint)

```http
Request Body:
{
  "current_version": "string"
}

Response:
{
  "is_latest": boolean,
  "download_link": "string" (optional),
  "latest_version": "string" (optional),
  "release_notes": "string" (optional),
  "minimum_required": "string" (optional)
}
```

### Implementation Notes

#### Error Handling
All API calls should handle HTTP status codes appropriately:

- 200 OK: Successful request
- 400 Bad Request: Invalid request parameters
- 401 Unauthorized: Authentication failed
- 404 Not Found: Resource not found
- 500 Internal Server Error: Server-side error

Error responses typically include a text message explaining the error.

#### File Encryption
The Pipe CLI implements client-side encryption, which is not part of the API. If you want to implement encryption in your application:

- Use a strong encryption algorithm (AES-256-GCM is recommended)
- Generate and store a random salt and nonce for each encrypted file
- Derive an encryption key from the user's password using a strong KDF like Argon2
- Encrypt the file before uploading and decrypt after downloading
- Store encryption parameters (salt, nonce) securely, but never store the password

#### Retries and Backoff
For robust applications, implement retry logic with exponential backoff:

- Start with an initial delay (e.g., 1000ms)
- Increase the delay for each retry (up to a maximum, e.g., 10000ms)
- Limit the number of retries (e.g., 3)

#### Upload Considerations
- For large files, use chunked uploads or streaming to avoid memory issues
- Consider adding progress tracking for better user experience
- For batch operations, limit concurrent requests to avoid overwhelming the server

This documentation provides the foundation for building applications that interact with the Pipe CDN API in any programming language.

## Future Development

### Testnet
Coming Soon!

### Mainnet
Coming 2025!

## Support and Resources

- [Dashboard](https://dashboard.pipenetwork.com/node-lookup)
- [DevNet Signup Form](https://docs.google.com/forms/d/e/1FAIpQLScbxN1qlstpbyU55K5I1UPufzfwshcv7uRJG6aLZQDk52ma0w/viewform)
- [GitHub Repository](https://github.com/preterag/surrealine-backend.git)

---

*Last updated: 2025* 