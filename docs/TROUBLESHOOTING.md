# Troubleshooting Guide

## Common Issues and Solutions

### 1. Workflow Fails to Start

**Problem**: Clicking "Run workflow" doesn't work or shows errors.

**Solutions**:
- Check if you're in the Actions tab of your forked repository
- Ensure the workflow file is in `.github/workflows/` directory
- Verify the YAML syntax is correct
- Make sure repository has Actions enabled (Settings → Actions)

### 2. Image Download Fails

**Problem**: "Failed to download person/garment image" error.

**Solutions**:
- Verify URLs are direct links to images (not web pages)
- Test URLs in browser - they should show just the image
- Use different image hosting service
- Check if images are publicly accessible
- Ensure URLs don't require authentication

**URL Testing**:
```bash
# Good URL (direct image link):
https://user-images.githubusercontent.com/123/image.jpg

# Bad URL (webpage containing image):
https://example.com/product-page
```

### 3. Invalid Image Format

**Problem**: "Invalid image format" error.

**Solutions**:
- Use standard formats: JPG, PNG, GIF, BMP, WebP
- Avoid SVG, PDF, or other document formats
- Re-save images in JPG format if unsure
- Check file isn't corrupted

### 4. Workflow Timeout

**Problem**: Workflow stops after 45 minutes with timeout error.

**Solutions**:
- Reduce inference steps (use 10-15 instead of 30)
- Use smaller images (resize to 512x768)
- Try simpler garments
- Split complex jobs into multiple runs

### 5. Out of Actions Minutes

**Problem**: "You have exceeded your Actions minutes" error.

**Solutions**:
- Check usage: Settings → Billing and plans
- Wait for monthly reset
- Upgrade to paid plan for more minutes
- Use public repository (2000 vs 500 minutes)

### 6. Poor Quality Results

**Problem**: Results don't look realistic or have artifacts.

**Causes & Solutions**:
- **Blurry images**: Increase inference steps to 25-30
- **Wrong garment placement**: Adjust guidance scale to 2.5-3.0
- **Color issues**: Use higher quality input images
- **Pose problems**: Use front-facing person photos
- **Background issues**: Use garment images with plain backgrounds

### 7. Missing Artifacts

**Problem**: No download artifacts after workflow completion.

**Solutions**:
- Check if workflow actually completed successfully
- Look for red X marks in workflow steps
- Artifacts expire after 30 days - download promptly
- Re-run workflow if artifacts are missing

### 8. GitHub Repository Issues

**Problem**: Can't find Actions tab or workflows.

**Solutions**:
- Ensure you forked the repository to your account
- Check repository settings: Settings → Actions → Allow all actions
- Verify `.github/workflows/` folder exists in your repo
- Make sure you're looking at your fork, not the original repo

## Performance Optimization

### Speed Up Processing

1. **Reduce inference steps**:
   ```yaml
   num_inference_steps: '10'  # Instead of 20-30
   ```

2. **Lower guidance scale**:
   ```yaml
   guidance_scale: '1.5'  # Instead of 2.0-3.0
   ```

3. **Use smaller images**:
   - Resize to 512x512 or 512x768 before uploading

### Improve Quality

1. **Increase inference steps**:
   ```yaml
   num_inference_steps: '30'
   ```

2. **Optimize guidance scale**:
   ```yaml
   guidance_scale: '2.5'
   ```

3. **Use high-quality inputs**:
   - Well-lit, high-resolution images
   - Clean backgrounds
   - Proper poses

## Debugging Steps

### 1. Check Workflow Logs
1. Go to Actions tab
2. Click on failed workflow run
3. Click on "virtual-tryon" job
4. Expand failed steps to see error messages

### 2. Validate Your Images
```bash
# Test if URL works in browser
curl -I "YOUR_IMAGE_URL"

# Should return HTTP 200 and Content-Type: image/*
```

### 3. Test with Known Good Images
Use these tested URLs for debugging:
```
Person: https://raw.githubusercontent.com/yisol/IDM-VTON/main/example/human/00013_00.jpg
Garment: https://raw.githubusercontent.com/yisol/IDM-VTON/main/example/cloth/00034_00.jpg
```

### 4. Minimal Test Run
Use these minimal parameters:
```yaml
category: 'upper_body'
num_inference_steps: '10'
guidance_scale: '1.5'
seed: '42'
```

## Getting Help

### Before Asking for Help
1. Check this troubleshooting guide
2. Review workflow logs for specific errors
3. Test with example images
4. Try minimal parameters

### Where to Get Help
1. **GitHub Issues**: Report bugs or problems
2. **Discussions**: Ask questions or share tips
3. **Original IDM-VTON repo**: For model-specific issues

### When Reporting Issues
Include:
- Exact error message
- Workflow run URL
- Image URLs you used
- Parameters you selected
- Screenshots if helpful

## Known Limitations

### Current Implementation
- **Demo quality**: Not full IDM-VTON implementation
- **CPU only**: Much slower than GPU versions
- **Limited models**: Basic checkpoint support
- **Simple processing**: Proof of concept level

### GitHub Actions Limits
- **Time limit**: 45 minutes per run
- **Memory**: Limited RAM available
- **Storage**: Temporary only
- **Network**: Download speed limits

### Workarounds
- For production use: Set up local GPU environment
- For better quality: Use commercial services
- For batch processing: Consider paid CI/CD services
- For real-time use: Deploy on cloud GPU instances

## FAQ

**Q: Why are results not as good as shown in IDM-VTON demos?**
A: This is a simplified CPU implementation for demonstration. Full quality requires GPU setup with complete models.

**Q: Can I run this on private repositories?**
A: Yes, but you get fewer free minutes (500 vs 2000 for public repos).

**Q: How can I get better results?**
A: Use high-quality input images, experiment with parameters, or set up local GPU environment.

**Q: Can I modify the workflow?**
A: Yes! Fork the repository and edit the workflow file for your needs.

**Q: Is this suitable for commercial use?**
A: No, the license is non-commercial. Contact IDM-VTON authors for commercial licensing.
