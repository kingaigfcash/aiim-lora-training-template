#!/bin/bash

# This script provisions a Runpod environment for Kohya_SS.

# Exit on error
set -e

# Variables
KOHYA_SS_DIR="/workspace/kohya_ss"
KOHYA_SS_GIT_URL="https://github.com/bmaltais/kohya_ss.git"

# --- System Packages ---
APT_PACKAGES=(
    "git"
    "python3-pip"
    "python3-venv"
    "libgl1-mesa-glx"
    "libglib2.0-0"
    "python3-tk"
)

# --- Python Packages ---
PIP_PACKAGES=(
    "torch==2.1.2"
    "torchvision==0.16.2"
    "torchaudio==2.1.2"
    "xformers==0.0.23.post1"
    "accelerate==0.25.0"
    "transformers==4.36.2"
    "diffusers==0.25.1"
    "safetensors==0.4.1"
    "peft==0.7.1"
    "prodigyopt==1.0"
    "bitsandbytes==0.42.0"
    "gradio==3.48.0"
)

# --- Model Downloads ---
CHECKPOINT_MODELS=(
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    #"https://huggingface.co/kingcashflow/modelcheckpoints/resolve/main/AIIM_Realism.safetensors"
)

# --- Main Execution ---

# Clone the repository if it doesn't exist
if [ ! -d "$KOHYA_SS_DIR/.git" ]; then
    echo "--> Cloning Kohya_SS repository..."
    # Clone the repository and navigate into the directory
    git clone "$KOHYA_SS_GIT_URL" "$KOHYA_SS_DIR" && cd "$KOHYA_SS_DIR"
else
    echo "--> Kohya_SS repository already exists. Entering directory..."
    cd "$KOHYA_SS_DIR"
fi

# Run the setup script with the runpod flag
# This will handle venv creation, dependency installation, and launching the GUI
echo "--> Running Kohya_SS setup for RunPod..."
./setup.sh --runpod

echo "--> Provisioning complete. Kohya_SS is running or has completed setup."