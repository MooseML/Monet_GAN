# Base image with TensorFlow GPU support
FROM tensorflow/tensorflow:2.13.0-gpu

# Install system dependencies for OpenCV, Node.js, and other libraries
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    git \
    wget \
    unzip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install JupyterLab and TensorBoard
RUN pip install jupyterlab tensorboard_plugin_profile

# Expose JupyterLab and TensorBoard ports
EXPOSE 8888 6006

# Set entrypoint for JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
