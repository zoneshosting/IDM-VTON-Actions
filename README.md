# IDM-VTON Virtual Try-On with GitHub Actions

🚀 **Run AI-powered virtual try-on in the cloud using GitHub Actions - no local setup required!**

This repository provides a cloud-based implementation of IDM-VTON (Improving Diffusion Models for Virtual Try-on) that runs entirely on GitHub Actions, allowing you to generate virtual try-on images without any local installation.

![Virtual Try-On Demo](docs/demo-banner.png)

## ✨ Features

- 🌐 **Cloud-based processing** - No local installation required
- 🆓 **Free to use** - Runs on GitHub's free Action runners
- 🎯 **Easy to use** - Just provide image URLs and parameters
- 📱 **Multiple categories** - Upper body, lower body, dresses
- ⚙️ **Customizable parameters** - Control quality and generation settings
- 📦 **Automatic results** - Download results as artifacts
- 🔄 **Reproducible** - Use seeds for consistent results

## 🚀 Quick Start

### 1. Use This Repository

**Option A: Use directly (recommended)**
1. ⭐ Star this repository
2. Go to the **Actions** tab above
3. Select **IDM-VTON Virtual Try-On**
4. Click **Run workflow**

**Option B: Fork for customization**
1. Fork this repository to your account
2. Follow the same steps in your forked repo

### 2. Prepare Your Images

You'll need URLs to two images:
- **Person image**: Clear, front-facing photo of a person
- **Garment image**: Clean product photo of clothing item

**Image hosting options:**
- Upload to GitHub (drag & drop in issues, copy image URL)
- Use Imgur, Google Drive (public), or any image hosting service
- Ensure URLs are direct links to the image files

### 3. Run the Workflow

1. Click **Run workflow** (green button)
2. Fill in the parameters:
   ```
   Person image URL: https://example.com/person.jpg
   Garment image URL: https://example.com/garment.jpg
   Category: upper_body
   Inference steps: 20
   Guidance scale: 2.0
   Seed: 42
   ```
3. Click **Run workflow**
4. Wait 10-20 minutes for completion

### 4. Download Results

1. After completion, scroll down to **Artifacts**
2. Download:
   - `input-images`: Your original inputs
   - `tryon-results-[seed]`: Generated results with metadata

## 📋 Parameters Guide

| Parameter | Description | Range | Default |
|-----------|-------------|-------|---------|
| **Person Image URL** | Direct URL to person photo | URL | Required |
| **Garment Image URL** | Direct URL to garment photo | URL | Required |
| **Category** | Type of garment | upper_body, lower_body, dresses | upper_body |
| **Inference Steps** | Quality vs speed trade-off | 10-50 | 20 |
| **Guidance Scale** | How closely to follow garment | 1.0-7.5 | 2.0 |
| **Seed** | For reproducible results | Any number | 42 |

### Quality Settings

- **Fast (10-15 min)**: Steps=10, Guidance=1.5
- **Balanced (15-20 min)**: Steps=20, Guidance=2.0 ⭐ **Recommended**
- **High Quality (20-30 min)**: Steps=30, Guidance=3.0

## 📸 Image Requirements

### Person Image
- ✅ Clear, well-lit front-facing photo
- ✅ Person standing straight
- ✅ Minimal occlusions
- ✅ Resolution: 512x768 or higher
- ❌ Avoid complex poses or angles

### Garment Image
- ✅ Clean product photo
- ✅ Plain/transparent background preferred
- ✅ Good lighting and detail visibility
- ✅ Resolution: 512x512 or higher
- ❌ Avoid cluttered backgrounds

## 📁 Example Images

Check the `examples/` folder for sample images you can use to test the system:

- `examples/person-1.jpg` - Sample person image
- `examples/garment-1.jpg` - Sample t-shirt
- `examples/garment-2.jpg` - Sample dress

You can use these URLs in the workflow:
```
Person: https://raw.githubusercontent.com/[your-username]/IDM-VirtualTryOn/main/examples/person-1.jpg
Garment: https://raw.githubusercontent.com/[your-username]/IDM-VirtualTryOn/main/examples/garment-1.jpg
```

## 🛠️ Advanced Usage

### Batch Processing
Run multiple workflows with different parameters:
1. Same person, different garments
2. Same garment, different people
3. Different seeds for variations

### Custom Integration
Integrate with your own systems:
1. Use GitHub API to trigger workflows programmatically
2. Parse artifact results automatically
3. Build web interfaces around this backend

## ⚠️ Limitations

- **CPU Processing**: Slower than GPU implementations (15-30 min vs 1-2 min)
- **Demo Quality**: Simplified implementation, not full IDM-VTON
- **GitHub Limits**: 2000 free minutes/month for public repos
- **Image Access**: Images must be publicly accessible URLs
- **Time Limit**: 45-minute maximum per workflow run

## 💰 Cost & Usage

- **Free Tier**: 2000 Action minutes/month (public repos)
- **Per Run**: ~15-25 minutes
- **Monthly Capacity**: ~80-130 runs per month
- **Private Repos**: 500 minutes/month on free plan

Monitor usage: Repository Settings → Billing and plans

## 🔧 Local Development

For full IDM-VTON with GPU acceleration:

```bash
# Clone the official repository
git clone https://github.com/yisol/IDM-VTON.git
cd IDM-VTON

# Follow their installation guide
conda env create -f environment.yaml
conda activate idm

# Download model checkpoints
# ... (see their documentation)
```

## 🤝 Contributing

Contributions welcome! Areas for improvement:

- Better model integration
- Web interface
- API endpoints
- Performance optimizations
- Documentation improvements

## 📄 License

This project uses IDM-VTON under the **CC BY-NC-SA 4.0** license.

- ✅ Academic research
- ✅ Personal use
- ❌ Commercial use without permission

## 🙏 Acknowledgments

- [IDM-VTON](https://github.com/yisol/IDM-VTON) - Original implementation
- [Hugging Face](https://huggingface.co/) - Model hosting
- [GitHub Actions](https://github.com/features/actions) - Free compute resources

## 📞 Support

- 🐛 **Issues**: Use GitHub Issues for bugs
- 💡 **Ideas**: Discussions tab for feature requests
- 📖 **Docs**: Check `docs/` folder for detailed guides
- ⭐ **Show support**: Star the repository!

---

**Ready to try virtual fashion? Click the Actions tab and start your first try-on!** 🎉
