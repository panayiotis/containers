# Adam container
Adam repository:  [bigdatagenomics/adam](https://github.com/bigdatagenomics/adam)

# Version
Adam commit [5ae8820](https://github.com/bigdatagenomics/adam/commit/5ae88202339b47851ab91f85c58a1185ad232740)  
Scala 2.11.8  
Spark 2.1.0  
Hadoop 2.7.3  

## Build
    docker build -t panos/adam .

##### adam-shell

    docker run --rm -it --name adam -p 4040:4040 panos/adam

##### bash

    docker run --rm -it --name adam --entrypoint /bin/bash panos/adam
