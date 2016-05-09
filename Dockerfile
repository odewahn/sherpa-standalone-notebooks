FROM continuumio/miniconda

RUN conda install -y jupyter

RUN conda config --add channels https://conda.anaconda.org/sherpa
RUN conda install sherpa=4.8 matplotlib scipy  numpy pandas -y

#****************************************************************************
# Add custom dependencies here
#****************************************************************************

# Add the files to the image
ADD . /data

# Set the current working directory
WORKDIR /data

# Expose the notebook port
EXPOSE 8888

# Fire it up
CMD jupyter notebook --no-browser --port 8888 --ip=*
