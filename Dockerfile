FROM continuumio/miniconda3

# Create Python 3.10 environment
RUN conda create -n py310 python=3.10

# Install system dependencies
RUN apt-get update && apt-get install -y git

# Install Conda packages in Python 3.10 environment
RUN conda install -y -n py310 \
    jupyter \
    jupyterlab \
    numpy \
    pytables \
    pandas \
    scipy \
    matplotlib \
    seaborn \
    quandl \
    scikit-learn \
    openpyxl \
    xlrd \
    xlwt \
    pyyaml

# Activate environment and install pip packages
RUN conda run -n py310 pip install --upgrade pip && \
    conda run -n py310 pip install \
    q \
    plotly \
    cufflinks \
    tensorflow \
    keras \
    eikon \ 
    nasdaq-data-link \ 
    yfinance
    #git+https://github.com/Nasdaq/data-link-python
    # git+git://github.com/yhilpisch/tpqoa

# Set working directory and setup notebook directory

WORKDIR /opt/notebooks

# Expose Jupyter port and run notebook in Python 3.10 environment
EXPOSE 8888
CMD ["conda", "run", "-n", "py310", "jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--notebook-dir=/opt/notebooks"]