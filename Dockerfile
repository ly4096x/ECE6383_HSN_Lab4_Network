FROM peixuan670/frr

RUN apt-get update && apt-get install -y mtr-tiny iputils-ping tcpdump iperf3 && rm -rf /var/lib/apt/lists/*
