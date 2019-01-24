FROM ubuntu:latest

RUN  apt-get update \
     && apt-get install -y wget\
     && apt-get install -y python-minimal\
     && apt-get install -y python-pip\
     && apt-get install -y iputils-ping
# Install stringtie

RUN wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.3.5.Linux_x86_64.tar.gz

RUN tar xvfz stringtie-1.3.5.Linux_x86_64.tar.gz

RUN mv stringtie-1.3.5.Linux_x86_64 stringtie

# get gffread from cufflink package
RUN wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
 
RUN tar xvfz cufflinks-2.2.1.Linux_x86_64.tar.gz

RUN mv cufflinks-2.2.1.Linux_x86_64 cufflinks

# Install LncADeep
RUN pip install numpy==1.13.1
RUN pip install pandas==0.20.3
RUN pip install h5py==2.7.0
RUN pip install Theano==0.9.0

RUN wget https://github.com/fchollet/keras/archive/1.2.2.tar.gz
RUN tar xzvf 1.2.2.tar.gz
RUN chmod +x keras-1.2.2/setup.py
RUN python keras-1.2.2/setup.py install
RUN mkdir /root/.keras/
COPY  keras.json /root/.keras/

ADD LncADeep_v1.0.tgz /
#RUN wget http://cqb.pku.edu.cn/ZhuLab/LncADeep/LncADeep_v1.0.tgz
#RUN tar xzvf LncADeep_v1.0.tgz
RUN chmod +x LncADeep_v1.0/configure
RUN LncADeep_v1.0/configure

