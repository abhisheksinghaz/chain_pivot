# Dockerfile to build an image having python, opencv and nodejs installed
FROM library/ubuntu

RUN apt-get update

#
# installing Python and opencv
#
RUN apt-get install -y python python-dev 
RUN apt-get install -y python-opencv --no-install-recommends
#
# Node.js and NPM
#
RUN apt-get install -y nodejs npm git --no-install-recommends
RUN ln -s /dev/null /dev/raw1394
 
# Install dependencies required by node-canvas
RUN apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++

#
# Clear cache
#
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD sh -c 'ln -s /dev/null /dev/raw1394'; npm start
