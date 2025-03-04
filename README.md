# Monet Style Painting Generative Adversarial Network (CycleGAN)

## Overview
This project implements a **WGAN-style CycleGAN** to generate Monet-style paintings from real-world photos. It was developed for a Kaggle competition, where the goal is to generate **7,000–10,000 Monet-style images**. The evaluation metric is **MiFID** (Memorization-Informed Fréchet Inception Distance), which checks realism while preventing memorization.

## Dataset
You can download the dataset from the [Kaggle competition page](https://www.kaggle.com/competitions/gan-getting-started/data?select=photo_jpg). It contains:
- **monet_jpg/**: 300 Monet paintings (256×256)
- **monet_tfrec/**: The same Monet paintings in TFRecord format
- **photo_jpg/**: 7,028 real-world photos (256×256)
- **photo_tfrec/**: The same photos in TFRecord format

The CycleGAN model learns to translate photo images into Monet-style artworks without needing paired training data.

## Setup & Installation
### Using Docker (Recommended)
Ensure you have [Docker installed](https://www.docker.com/get-started) and then run:

```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/Monet_GAN.git
cd Monet_GAN
docker-compose up --build
```

### Manual Setup
If running without Docker, install dependencies manually:
```sh
pip install -r requirements.txt
```

## Running the Model
To train the CycleGAN model, use:
```sh
python train.py
```
To generate Monet-style paintings:
```sh
python generate.py --input_dir=data/photo_jpg --output_dir=images
```

## Folder Structure
- `data/` - Contains dataset images (ignored in Git, should be manually downloaded from Kaggle).
- `logs/` - Stores training logs (ignored in Git).
- `images/` - Stores generated images (ignored in Git).
- `models/` - Pre-trained CycleGAN models.
- `src/` - Core implementation (training, inference, loss functions, etc.).

## Results & Observations
- Wasserstein loss with gradient penalty improved stability.
- Instance normalization worked better than batch normalization.
- Hyperparameter tuning (e.g., identity loss weight) impacted results.
- Perceptual loss could help improve the painterly effect further.

## Potential Improvements
1. Longer training or alternative early stopping criteria.
2. Hyperparameter tuning via Optuna.
3. Testing alternative architectures (e.g., Swin Transformer-based GANs).

## References
- Arjovsky, M., et al. (2017). *Wasserstein GAN*. [arXiv:1701.07875](https://arxiv.org/abs/1701.07875)
- Jang, A. (n.d.). *Monet CycleGAN Tutorial*. Kaggle. Retrieved from [here](https://www.kaggle.com/code/amyjang/monet-cyclegan-tutorial)
