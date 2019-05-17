FROM k8s.gcr.io/volume-nfs:0.8
COPY add-google.sh .
RUN bash add-google.sh
RUN  yum update -y -q
RUN yum install gcsfuse -y -q
