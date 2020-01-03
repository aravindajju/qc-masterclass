# We use the iqsharp-base image, as that includes
# the .NET Core SDK, IQ#, and Jupyter Notebook already
# installed for us.
FROM mcr.microsoft.com/quantum/iqsharp-base:0.10.1911.1607

# Make sure the contents of our repo are in ${HOME}
# Required for mybinder.org
COPY . ${HOME}

USER ${USER}
