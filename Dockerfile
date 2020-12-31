# Pull base image.
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

#
# Note: ln -s /dev/null /dev/raw1394 is to prevent error on python's
#		cv2 during import: "libdc1394 error: Failed to initialize libdc1394"
#		So, if you want to run another command, just update your CMD to start
#		with this script, followed by whatever you want. (Not cute, but works)
#
CMD sh -c 'ln -s /dev/null /dev/raw1394'; npm start
