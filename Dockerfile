# We use the iqsharp-base image, as that includes
# the .NET Core SDK, IQ#, and Jupyter Notebook already
# installed for us.
FROM mcr.microsoft.com/quantum/iqsharp-base:0.10.1911.1607

# Add metadata indicating that this image is used for the katas.
ENV IQSHARP_HOSTING_ENV=KATAS_DOCKERFILE

# Make sure the contents of our repo are in ${HOME}
# Required for mybinder.org
COPY . ${HOME}
USER root

# Install Python dependencies for the Python visualization and tutorial notebooks
RUN pip install "matplotlib"
RUN pip install "pytest"

RUN chown -R ${USER} ${HOME} && \
    chmod +x ${HOME}/scripts/*.sh

USER ${USER}
