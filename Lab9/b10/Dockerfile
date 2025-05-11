# Specify Fedora Linux as base image
FROM fedora:latest

# Install Python with yum (Fedora's Package Manager)
# Install required Python packages
RUN yum update -y && yum install -y python3 python3-pip && \
    python3 -m pip install pyfiglet termcolor

# Add the missile.py file to the final image
ADD missile.py /

# Specify the command to be run on container creation
CMD ["/usr/bin/python3", "missile.py"]